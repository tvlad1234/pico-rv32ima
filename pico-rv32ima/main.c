#include "pico/stdlib.h"
#include "pico/multicore.h"
#include "pico/util/queue.h"

#include "hardware/pll.h"
#include "hardware/vreg.h"
#include "hardware/clocks.h"

#include "ff.h"
#include "hw_config.h"

#include "psram.h"
#include "emulator.h"
#include "console.h"
#include "terminal.h"

void core1_entry();

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

static inline bool gset_sys_clock_khz(uint32_t freq_khz, bool required)
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

int main()
{

    sleep_ms(50);
    vreg_set_voltage(VREG_VOLTAGE_MAX); // overvolt the core just a bit
    sleep_ms(50);
    gset_sys_clock_khz(400000, true); // overclock to 400 MHz (from 125MHz)
    sleep_ms(50);
    console_init();

    multicore_reset_core1();
    multicore_fifo_drain();
    multicore_launch_core1(core1_entry);

    while (true)
    {
        console_task();
    }
}

void core1_entry()
{
    sleep_ms(2000);
    int r = initPSRAM();
    if (r < 1)
        console_panic("Error initalizing PSRAM!\n\r");

    console_printf("PSRAM init OK!\n\r");
    console_printf("PSRAM Baud: %d\n\r", r);

    sd_card_t *pSD0 = sd_get_by_num(0);
    FRESULT fr = f_mount(&pSD0->fatfs, pSD0->pcName, 1);
    if (FR_OK != fr)
        console_panic("SD mount error: %s (%d)\n\r", FRESULT_str(fr), fr);

    int c = rvEmulator();

    while (c == EMU_REBOOT)
        c = rvEmulator();
}
