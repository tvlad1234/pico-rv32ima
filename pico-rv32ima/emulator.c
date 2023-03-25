#include <stdio.h>
#include <stdlib.h>

#include "pico/stdlib.h"
#include "pico/util/queue.h"

#include "cdc_console.h"
#include "sdram.h"
#include "emulator.h"

#include "default64mbdtc.h"

#include "rv32_config.h"

int time_divisor = EMULATOR_TIME_DIV;
int fixed_update = EMULATOR_FIXED_UPDATE;
int do_sleep = 0;
int single_step = 0;
int fail_on_all_faults = 0;

uint32_t ram_amt = EMULATOR_RAM_MB * 1024 * 1024;

static uint32_t HandleException(uint32_t ir, uint32_t retval);
static uint32_t HandleControlStore(uint32_t addy, uint32_t val);
static uint32_t HandleControlLoad(uint32_t addy);
static void HandleOtherCSRWrite(uint8_t *image, uint16_t csrno, uint32_t value);
static uint32_t HandleOtherCSRRead(uint8_t *image, uint16_t csrno);
static int IsKBHit();
static int ReadKBByte();

static uint64_t GetTimeMicroseconds();
static void MiniSleep();

#define MINIRV32WARN(x...) cdc_printf(x);
#define MINIRV32_DECORATE static
#define MINI_RV32_RAM_SIZE ram_amt
#define MINIRV32_IMPLEMENTATION
#define MINIRV32_POSTEXEC(pc, ir, retval)             \
    {                                                 \
        if (retval > 0)                               \
        {                                             \
            if (fail_on_all_faults)                   \
            {                                         \
                cdc_printf("FAULT\n");                \
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
#define MINIRV32_OTHERCSR_READ(csrno, rval)      \
    {                                            \
        rval = HandleOtherCSRRead(image, csrno); \
    }

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

static void DumpState(struct MiniRV32IMAState *core);
struct MiniRV32IMAState core;

void rvEmulator()
{

    uint32_t dtb_ptr = ram_amt - sizeof(default64mbdtb) - sizeof(struct MiniRV32IMAState);
    const uint32_t *dtb = default64mbdtb;

    uint32_t validram = dtb_ptr;
    loadDataIntoRAM(default64mbdtb, dtb_ptr, sizeof(default64mbdtb));

    uint32_t dtbRamValue = (validram >> 24) | (((validram >> 16) & 0xff) << 8) | (((validram >> 8) & 0xff) << 16) | ((validram & 0xff) << 24);
    MINIRV32_STORE4(dtb_ptr + 0x13c, dtbRamValue);

    core.regs[10] = 0x00;                                                // hart ID
    core.regs[11] = dtb_ptr ? (dtb_ptr + MINIRV32_RAM_IMAGE_OFFSET) : 0; // dtb_pa (Must be valid pointer) (Should be pointer to dtb)
    core.extraflags |= 3;                                                // Machine-mode.

    core.pc = MINIRV32_RAM_IMAGE_OFFSET;
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
            cdc_printf("POWEROFF@0x%08x%08x\n", core.cycleh, core.cyclel);
            return; // syscon code for power-off
        default:
            cdc_printf("Unknown failure\n");
            break;
        }
    }

}

//////////////////////////////////////////////////////////////////////////
// Functions for the emulator
//////////////////////////////////////////////////////////////////////////

// Keyboard
static int IsKBHit()
{
    if (queue_is_empty(&kb_queue))
        return 0;
    else
        return 1;
}

static int ReadKBByte()
{
    char c;
    if (queue_try_remove(&kb_queue, &c))
        return c;
    return -1;
}

// Exceptions handling

static uint32_t HandleException(uint32_t ir, uint32_t code)
{
    // Weird opcode emitted by duktape on exit.
    if (code == 3)
    {
        // Could handle other opcodes here.
    }
    return code;
}

// CSR handling (Linux HVC console)

static void HandleOtherCSRWrite(uint8_t *image, uint16_t csrno, uint32_t value)
{
    if (csrno == 0x139)
    {
        char c = value;
        queue_add_blocking(&screen_queue, &c);
    }
}

static uint32_t HandleOtherCSRRead(uint8_t *image, uint16_t csrno)
{
    if (csrno == 0x140)
    {
        if (IsKBHit())
            return ReadKBByte();
        else
            return -1;
    }

    return 0;
}

// MMIO handling (8250 UART)

static uint32_t HandleControlStore(uint32_t addy, uint32_t val)
{
    if (addy == 0x10000000) // UART 8250 / 16550 Data Buffer
    {
        char c = val;
        queue_add_blocking(&screen_queue, &c);
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

// Timing 
static uint64_t GetTimeMicroseconds()
{
    absolute_time_t t = get_absolute_time();

    static uint32_t prev = 0;
    static uint32_t upper = 0;

    uint32_t now = to_us_since_boot(t);
    if (now < prev)
    {
        upper += 1;
    }
    uint64_t ret = ((uint64_t)upper << 32) | (uint64_t)now;
    prev = now;
    return now;

    return to_us_since_boot(t);
}

static void MiniSleep()
{
    sleep_ms(500);
}
