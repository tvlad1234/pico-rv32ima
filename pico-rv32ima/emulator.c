#include <stdio.h>
#include <stdlib.h>
#include "pico/stdlib.h"

#include "pico/util/queue.h"

#include "sdram.h"
#include "emulator.h"

#ifdef RUN_LINUX
#include "default64mbdtc.h"
#endif

uint32_t ram_amt = RAM_MB * 1024 * 1024;

static uint32_t HandleException(uint32_t ir, uint32_t retval);
static uint32_t HandleControlStore(uint32_t addy, uint32_t val);
static uint32_t HandleControlLoad(uint32_t addy);
static void HandleOtherCSRWrite(uint8_t *image, uint16_t csrno, uint32_t value);
static int IsKBHit();
static int ReadKBByte();

static uint64_t GetTimeMicroseconds();
static void MiniSleep();

int fail_on_all_faults = 0;

#define MINIRV32WARN(x...) printf(x);
#define MINIRV32_DECORATE static
#define MINI_RV32_RAM_SIZE ram_amt
#define MINIRV32_IMPLEMENTATION
#define MINIRV32_POSTEXEC(pc, ir, retval)             \
    {                                                 \
        if (retval > 0)                               \
        {                                             \
            if (fail_on_all_faults)                   \
            {                                         \
                printf("FAULT\n");                    \
                return 3;                             \
            }                                         \
            else                                      \
                retval = HandleException(ir, retval); \
        }                                             \
    }
#define MINIRV32_HANDLE_MEM_STORE_CONTROL(addy, val) \
    if (HandleControlStore(addy, val))               \
        return val;
#define MINIRV32_HANDLE_MEM_LOAD_CONTROL(addy, rval) rval = HandleControlLoad(addy);
#define MINIRV32_OTHERCSR_WRITE(csrno, value) HandleOtherCSRWrite(image, csrno, value);

// SD Memory Bus
#define MINIRV32_CUSTOM_MEMORY_BUS

void MINIRV32_STORE4(uint32_t ofs, uint32_t val)
{
    accessSDRAM(ofs, 4, true, &val);
}

void MINIRV32_STORE2(uint32_t ofs, uint16_t val)
{
    accessSDRAM(ofs, 2, true, &val);
}

void MINIRV32_STORE1(uint32_t ofs, uint8_t val)
{
    accessSDRAM(ofs, 1, true, &val);
}

uint32_t MINIRV32_LOAD4(uint32_t ofs)
{
    uint32_t val;
    accessSDRAM(ofs, 4, false, &val);
    return val;
}

uint16_t MINIRV32_LOAD2(uint32_t ofs)
{
    uint16_t val;
    accessSDRAM(ofs, 2, false, &val);
    return val;
}

uint8_t MINIRV32_LOAD1(uint32_t ofs)
{
    uint8_t val;
    accessSDRAM(ofs, 1, false, &val);
    return val;
}

#include "mini-rv32ima.h"

extern queue_t screen_queue, kb_queue;

static void DumpState(struct MiniRV32IMAState *core);
struct MiniRV32IMAState core;

void rvEmulator()
{

#ifdef RUN_LINUX
    uint32_t dtb_ptr = ram_amt - sizeof(default64mbdtb); //- sizeof(struct MiniRV32IMAState);
    uint32_t *dtb = default64mbdtb;

    uint32_t validram = dtb_ptr;
    loadDataIntoRAM(default64mbdtb, dtb_ptr, sizeof(default64mbdtb));

    uint32_t dtbRamValue = (validram >> 24) | (((validram >> 16) & 0xff) << 8) | (((validram >> 8) & 0xff) << 16) | ((validram & 0xff) << 24);
    MINIRV32_STORE4(dtb_ptr + 0x13c, dtbRamValue);

    core.pc = MINIRV32_RAM_IMAGE_OFFSET;
    core.regs[10] = 0x00;                                                // hart ID
    core.regs[11] = dtb_ptr ? (dtb_ptr + MINIRV32_RAM_IMAGE_OFFSET) : 0; // dtb_pa (Must be valid pointer) (Should be pointer to dtb)
    core.extraflags |= 3;                                                // Machine-mode.
#endif

    int time_divisor = 1;
    int fixed_update = false;
    int do_sleep = 0;
    int single_step = 0;
    long long instct = -1;

    uint64_t rt;
    uint64_t lastTime = (fixed_update) ? 0 : (GetTimeMicroseconds() / time_divisor);
    int instrs_per_flip = single_step ? 1 : 1024;
    for (rt = 0; rt < instct + 1 || instct < 0; rt += instrs_per_flip)
    {
        uint64_t *this_ccount = ((uint64_t *)&core.cyclel);
        uint32_t elapsedUs = 0;
        if (fixed_update)
            elapsedUs = *this_ccount / time_divisor - lastTime;
        else
            elapsedUs = GetTimeMicroseconds() / time_divisor - lastTime;
        lastTime += elapsedUs;

        int ret = MiniRV32IMAStep(&core, NULL, 0, elapsedUs, instrs_per_flip); // Execute upto 1024 cycles before breaking out.
        switch (ret)
        {
        case 0:
            break;
        case 1:
            if (do_sleep)
                MiniSleep();
            *this_ccount += instrs_per_flip;
            break;
        case 3:
            instct = 0;
            break;
        case 0x7777:
            return; // syscon code for restart
        case 0x5555:
            printf("POWEROFF@0x%08x%08x\n", core.cycleh, core.cyclel);
            return; // syscon code for power-off
        default:
            printf("Unknown failure\n");
            break;
        }
    }
    DumpState(&core);
}

//////////////////////////////////////////////////////////////////////////
// Functions for the emulator
//////////////////////////////////////////////////////////////////////////

// Keyboard
static int IsKBHit()
{
    if(queue_is_empty(&kb_queue))
        return 0;
    else return 1;
}

static int ReadKBByte()
{
    char c;
    queue_remove_blocking(&kb_queue, &c);
    return c;
}

// Exceptions and UART

static uint32_t HandleException(uint32_t ir, uint32_t code)
{
    // Weird opcode emitted by duktape on exit.
    if (code == 3)
    {
        // Could handle other opcodes here.
    }
    return code;
}

void printRAMStr(uint32_t addr, uint32_t size)
{
    uint8_t ramval; // = MINIRV32_LOAD1(ptrend);
    while (size--)
    {
        putchar(MINIRV32_LOAD1(addr++));
    }
}

static void HandleOtherCSRWrite(uint8_t *image, uint16_t csrno, uint32_t value)
{
    if (csrno == 0x136)
    {
        printf("%d", value);
        fflush(stdout);
    }
    if (csrno == 0x137)
    {
        printf("%08x", value);
        fflush(stdout);
    }

    else if (csrno == 0x138)
    {
        // Print "string"
        uint32_t ptrstart = value - MINIRV32_RAM_IMAGE_OFFSET;
        uint32_t ptrend = ptrstart;
        if (ptrstart >= ram_amt)
            printf("DEBUG PASSED INVALID PTR (%08x)\n", value);
        while (ptrend < ram_amt)
        {
            uint8_t ramval = MINIRV32_LOAD1(ptrend);
            if (ramval == 0)
                break;
            ptrend++;
        }
        if (ptrend != ptrstart)
            printRAMStr(image + ptrstart, ptrend - ptrstart);
    }
}

static uint32_t HandleControlStore(uint32_t addy, uint32_t val)
{
    if (addy == 0x10000000) // UART 8250 / 16550 Data Buffer
    {
        char c = val;
        queue_try_add(&screen_queue, &c);
    }

    return 0;
}

static uint32_t HandleControlLoad(uint32_t addy)
{
    // Emulating a 8250 / 16550 UART
    if (addy == 0x10000005)
        return 0x60 | IsKBHit();
    else if (addy == 0x10000000 && IsKBHit())
        return ReadKBByte();

    return 0;
}

static uint64_t GetTimeMicroseconds()
{
    absolute_time_t t = get_absolute_time();
    return to_us_since_boot(t)/1000;
}

static void MiniSleep()
{
    sleep_us(500);
}

static void DumpState(struct MiniRV32IMAState *core)
{
    uint32_t pc = core->pc;
    uint32_t pc_offset = pc - MINIRV32_RAM_IMAGE_OFFSET;
    uint32_t ir = 0;

    printf("PC: %08x ", pc);
    if (pc_offset >= 0 && pc_offset < ram_amt - 3)
    {
        ir = MINIRV32_LOAD4(pc_offset);
        printf("[0x%08x] ", ir);
    }
    else
        printf("[xxxxxxxxxx] ");
    uint32_t *regs = core->regs;
    printf("Z:%08x ra:%08x sp:%08x gp:%08x tp:%08x t0:%08x t1:%08x t2:%08x s0:%08x s1:%08x a0:%08x a1:%08x a2:%08x a3:%08x a4:%08x a5:%08x ",
           regs[0], regs[1], regs[2], regs[3], regs[4], regs[5], regs[6], regs[7],
           regs[8], regs[9], regs[10], regs[11], regs[12], regs[13], regs[14], regs[15]);
    printf("a6:%08x a7:%08x s2:%08x s3:%08x s4:%08x s5:%08x s6:%08x s7:%08x s8:%08x s9:%08x s10:%08x s11:%08x t3:%08x t4:%08x t5:%08x t6:%08x\n",
           regs[16], regs[17], regs[18], regs[19], regs[20], regs[21], regs[22], regs[23],
           regs[24], regs[25], regs[26], regs[27], regs[28], regs[29], regs[30], regs[31]);
}
