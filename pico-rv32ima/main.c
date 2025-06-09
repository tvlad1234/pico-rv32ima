#include "pico/stdlib.h"
#include "pico/multicore.h"
#include "pico/util/queue.h"

#include "hardware/gpio.h"
#include "hardware/sync.h"
#include "hardware/structs/ioqspi.h"
#include "hardware/structs/sio.h"

#include "hardware/spi.h"
#include "hardware/pll.h"
#include "hardware/vreg.h"
#include "hardware/clocks.h"

#include "rv32_config.h"

#include "psram.h"
#include "emulator.h"
#include "console.h"

#include "pff.h"

void core1_entry();
bool gset_sys_clock_khz(uint32_t freq_khz, bool required);
void gset_sys_clock_pll(uint32_t vco_freq, uint post_div1, uint post_div2);
void wait_button();

FATFS fatfs;

int main()
{
#ifdef PICO_RP2350A
    vreg_disable_voltage_limit();
    sleep_ms(50);
    vreg_set_voltage(RP2350_OVERVOLT);
    sleep_ms(50);
    gset_sys_clock_khz(RP2350_CPU_FREQ, true);
    sleep_ms(50);

#else
    sleep_ms(50);
    vreg_set_voltage(RP2040_OVERVOLT);
    sleep_ms(50);
    gset_sys_clock_khz(RP2040_CPU_FREQ, true);
    sleep_ms(50);
#endif

    console_init();

    multicore_reset_core1();
    multicore_fifo_drain();
    multicore_launch_core1(core1_entry);

    while (true)
        console_task();
}

void core1_entry()
{
    wait_button();
    console_printf("\033[2J\033[1;1H"); // clear terminal

    int r = psram_init();
    if (r < 0)
        console_panic("\rError initalizing PSRAM!\n\r");
    console_printf("\rPSRAM init OK!\n\r");

    FRESULT rc;
    int tries = 0;

    do
    {
        rc = pf_mount(&fatfs);
        if (rc)
            tries++;
        sleep_ms(200);
    } while (rc && tries < 5);

    if (rc)
        console_panic("\rError initalizing SD!\n\r");
    console_printf("\rSD init OK!\n\r");

    int baud = spi_set_baudrate(PSRAM_SPI_INST, 1000 * 1000 * 55);
    console_printf("PSRAM clock freq: %.2f MHz\n\n\r", baud / 1000000.0f);
    sleep_ms(50);

    while (true)
    {
        int c = riscv_emu();
        if (c != EMU_REBOOT)
            wait_button();
        console_printf("\033[2J\033[1;1H"); // clear terminal
    }
}

void gset_sys_clock_pll(uint32_t vco_freq, uint post_div1, uint post_div2)
{
    if (!running_on_fpga())
    {
        clock_configure(clk_sys,
                        CLOCKS_CLK_SYS_CTRL_SRC_VALUE_CLKSRC_CLK_SYS_AUX,
                        CLOCKS_CLK_SYS_CTRL_AUXSRC_VALUE_CLKSRC_PLL_USB,
                        48 * MHZ,
                        48 * MHZ);

        pll_init(pll_sys, 1, vco_freq, post_div1, post_div2);
        uint32_t freq = vco_freq / (post_div1 * post_div2);

        // Configure clocks
        // CLK_REF = XOSC (12MHz) / 1 = 12MHz
        clock_configure(clk_ref,
                        CLOCKS_CLK_REF_CTRL_SRC_VALUE_XOSC_CLKSRC,
                        0, // No aux mux
                        12 * MHZ,
                        12 * MHZ);

        // CLK SYS = PLL SYS (125MHz) / 1 = 125MHz
        clock_configure(clk_sys,
                        CLOCKS_CLK_SYS_CTRL_SRC_VALUE_CLKSRC_CLK_SYS_AUX,
                        CLOCKS_CLK_SYS_CTRL_AUXSRC_VALUE_CLKSRC_PLL_SYS,
                        freq, freq);

        clock_configure(clk_peri,
                        0,
                        CLOCKS_CLK_PERI_CTRL_AUXSRC_VALUE_CLK_SYS,
                        freq,
                        freq);
    }
}

bool gset_sys_clock_khz(uint32_t freq_khz, bool required)
{
    uint vco, postdiv1, postdiv2;
    if (check_sys_clock_khz(freq_khz, &vco, &postdiv1, &postdiv2))
    {
        gset_sys_clock_pll(vco, postdiv1, postdiv2);
        return true;
    }
    else if (required)
    {
        panic("System clock of %u kHz cannot be exactly achieved", freq_khz);
    }
    return false;
}

void wait_button()
{
    queue_remove_blocking(&kb_queue, NULL);
    return;
}
