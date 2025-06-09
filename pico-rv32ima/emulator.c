#include <stdio.h>
#include <stdlib.h>

#include "pico/stdlib.h"
#include "pico/util/queue.h"

#include "psram.h"
#include "emulator.h"
#include "console.h"
#include "cache.h"

#include "rv32_config.h"
#include "pff.h"

#include "default64mbdtc.h"

int time_divisor = EMULATOR_TIME_DIV;
int fixed_update = EMULATOR_FIXED_UPDATE;
int do_sleep = 1;
int single_step = 0;
int fail_on_all_faults = 0;

uint32_t ram_amt = EMULATOR_RAM_MB * 1024 * 1024;
const char kernel_cmdline[] = KERNEL_CMDLINE;

unsigned long blk_size = 67108864;
unsigned long blk_transfer_size;
unsigned long blk_offs;
unsigned long blk_ram_ptr;
FRESULT blk_err;

static uint32_t HandleException(uint32_t ir, uint32_t retval);
static uint32_t HandleControlStore(uint32_t addy, uint32_t val);
static uint32_t HandleControlLoad(uint32_t addy);
static void HandleOtherCSRWrite(uint8_t *image, uint16_t csrno, uint32_t value);
static uint32_t HandleOtherCSRRead(uint8_t *image, uint16_t csrno);
static int IsKBHit();
static int ReadKBByte();

static uint64_t GetTimeMicroseconds();
static void MiniSleep();

void loadDataIntoRAM(const unsigned char *d, uint32_t addr, uint32_t size);

#define MINIRV32WARN(x...) console_printf(x);
#define MINIRV32_DECORATE static
#define MINI_RV32_RAM_SIZE ram_amt
#define MINIRV32_IMPLEMENTATION
#define MINIRV32_POSTEXEC(pc, ir, retval)             \
    {                                                 \
        if (retval > 0)                               \
        {                                             \
            if (fail_on_all_faults)                   \
            {                                         \
                console_printf("FAULT\n");            \
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

#define MINIRV32_CUSTOM_MEMORY_BUS

static void MINIRV32_STORE4(uint32_t ofs, uint32_t val)
{
    cache_write(ofs, &val, 4);
}

static void MINIRV32_STORE2(uint32_t ofs, uint16_t val)
{
    cache_write(ofs, &val, 2);
}

static void MINIRV32_STORE1(uint32_t ofs, uint8_t val)
{
    cache_write(ofs, &val, 1);
}

static uint32_t MINIRV32_LOAD4(uint32_t ofs)
{
    uint32_t val;
    cache_read(ofs, &val, 4);
    return val;
}

static uint16_t MINIRV32_LOAD2(uint32_t ofs)
{
    uint16_t val;
    cache_read(ofs, &val, 2);
    return val;
}

static uint8_t MINIRV32_LOAD1(uint32_t ofs)
{
    uint8_t val;
    cache_read(ofs, &val, 1);
    return val;
}

static int8_t MINIRV32_LOAD1_SIGNED(uint32_t ofs)
{
    int8_t val;
    cache_read(ofs, &val, 1);
    return val;
}

static int16_t MINIRV32_LOAD2_SIGNED(uint32_t ofs)
{
    int16_t val;
    cache_read(ofs, &val, 2);
    return val;
}

#include "mini-rv32ima.h"

static void DumpState(struct MiniRV32IMAState *core);
struct MiniRV32IMAState core;

uint32_t blk_buf[512 / 4];

int riscv_emu()
{
    FRESULT rc = pf_open(KERNEL_FILENAME);
    if (rc)
        console_panic("Error opening kernel \"%s\"!\n\r", KERNEL_FILENAME);
    console_printf("Loading kernel \"%s\" into RAM\n\r", KERNEL_FILENAME);

    UINT br;
    uint32_t addr = 0;
    uint32_t total_bytes = 0;
    uint8_t cnt = 0;
    const char spinner[] = "/-\\|";

    for (;;)
    {
        rc = pf_read(blk_buf, sizeof(blk_buf), &br); /* Read a chunk of file */
        if (rc || !br)
            break; /* Error or end of file */

        psram_access(addr, br, true, blk_buf);
        total_bytes += br;
        addr += br;

        if (total_bytes % (16 * 1024) == 0)
        {
            cnt++;
            console_printf("%d kb so far...  ", total_bytes / 1024);
            console_putc(spinner[cnt % 4]);
            console_putc('\r');
        }
    }
    if (rc)
        console_panic("Error loading kernel.");
    console_printf("\rLoaded %d kilobytes.\n\r", total_bytes / 1024);

    rc = pf_open(BLK_FILENAME);
    if (rc)
        console_panic("Error opening block device image \"%s\"!\n\r", BLK_FILENAME);
    else
        console_printf("Opened block device image \"%s\".\n\n\r", BLK_FILENAME);

    uint32_t dtb_ptr = ram_amt - sizeof(default64mbdtb);
    psram_load_data(default64mbdtb, dtb_ptr, sizeof(default64mbdtb));
    cache_reset();

    console_printf("Loaded device tree, configured for:\n\r");
    console_printf("\t%d megabytes RAM\n\r", EMULATOR_RAM_MB);
    uint32_t dtbram = MINIRV32_LOAD4(dtb_ptr + 0x13c);
    if (dtbram == 0x00c0ff03)
    {
        uint32_t validram = dtb_ptr;
        dtbram = (validram >> 24) | (((validram >> 16) & 0xff) << 8) | (((validram >> 8) & 0xff) << 16) | ((validram & 0xff) << 24);
        MINIRV32_STORE4(dtb_ptr + 0x13c, dtbram);
    }

    console_printf("\tcmdline: \"%s\"\n\n\r", kernel_cmdline);
    const char *c = kernel_cmdline;
    uint32_t ptr = dtb_ptr + 0xc0;
    do
        MINIRV32_STORE1(ptr++, *(c++));
    while (*(c - 1));

    console_printf("Starting RISC-V VM\n\n\r");

    core.regs[10] = 0x00;                                                // hart ID
    core.regs[11] = dtb_ptr ? (dtb_ptr + MINIRV32_RAM_IMAGE_OFFSET) : 0; // dtb_pa (Must be valid pointer) (Should be pointer to dtb)
    core.extraflags |= 3;                                                // Machine-mode.

    core.pc = MINIRV32_RAM_IMAGE_OFFSET;
    long long instct = -1;

    uint64_t rt;
    uint64_t lastTime = (fixed_update) ? 0 : (GetTimeMicroseconds() / time_divisor);

    int instrs_per_flip = single_step ? 1 : 4096;
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
            console_printf("\nREBOOT@0x%08x%08x\n\r", core.cycleh, core.cyclel);
            return EMU_REBOOT; // syscon code for reboot
        case 0x5555:
            console_printf("\nPOWEROFF@0x%08x%08x\n\r", core.cycleh, core.cyclel);
            return EMU_POWEROFF; // syscon code for power-off
        default:
            console_printf("\nUnknown failure\n\r");
            return EMU_UNKNOWN;
            break;
        }
    }
}

//////////////////////////////////////////////////////////////////////////
// Functions for the emulator
//////////////////////////////////////////////////////////////////////////

// Keyboard
static inline int IsKBHit()
{
    if (queue_is_empty(&kb_queue))
        return 0;
    else
        return 1;
}

static inline int ReadKBByte()
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

// CSR handling (Linux HVC console and block device)
static inline void HandleOtherCSRWrite(uint8_t *image, uint16_t csrno, uint32_t value)
{
    if (csrno == 0x139)
        console_putc(value);
    else if (csrno == 0x151)
    {
        blk_ram_ptr = value - MINIRV32_RAM_IMAGE_OFFSET;
        // printf("\nblock op mem ptr %x\n", value);
    }
    else if (csrno == 0x152)
    {
        blk_offs = value;
        blk_err = pf_lseek(blk_offs);
        // printf("block op offset %x\n", value);
    }
    else if (csrno == 0x153)
    {
        blk_transfer_size = value;
        // printf("\nblock op transfer size %d\n", value);
    }
    else if (csrno == 0x154)
    {
        uint nblocks = blk_transfer_size >> 9; // divide by 512
        while (nblocks--)
        {
            if (value)
            {
                //  printf("block op write\n");
                for (int i = 0; i < 512 / 4; i++)
                {
                    blk_buf[i] = MINIRV32_LOAD4(blk_ram_ptr);
                    blk_ram_ptr += 4;
                }
                int x;
                blk_err = pf_write(blk_buf, 512, &x);
            }
            else
            {
                int x;
                blk_err = pf_read(blk_buf, 512, &x);
                for (int i = 0; i < 512 / 4; i++)
                {
                    MINIRV32_STORE4(blk_ram_ptr, blk_buf[i]);
                    blk_ram_ptr += 4;
                }
                // printf("block op read\n");
            }
        }
    }
}

static inline uint32_t HandleOtherCSRRead(uint8_t *image, uint16_t csrno)
{
    if (csrno == 0x140)
    {
        if (IsKBHit())
            return ReadKBByte();
        else
            return -1;
    }
    else if (csrno == 0x150)
    {
        return blk_size;
    }
    else if (csrno == 0x155)
    {
        return blk_err;
    }
    return 0;
}

// MMIO handling (8250 UART)

static uint32_t HandleControlStore(uint32_t addy, uint32_t val)
{
    if (addy == 0x10000000) // UART 8250 / 16550 Data Buffer
        console_putc(val);

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
static inline uint64_t GetTimeMicroseconds()
{
    absolute_time_t t = get_absolute_time();
    return to_us_since_boot(t);
}

static void MiniSleep()
{
    sleep_ms(1);
}
