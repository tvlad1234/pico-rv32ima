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
bool my_get_bootsel_button();
void wait_button();

FATFS fatfs;

int main()
{
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
        console_panic("Error initalizing PSRAM!\n\r");
    console_printf("PSRAM init OK!\n\r");

    
	FRESULT rc = pf_mount( &fatfs );
    if (rc)
        console_panic("Error initalizing SD!\n\r");
    console_printf("SD init OK!\n\r");

    sleep_ms(50);
    vreg_set_voltage(VREG_VOLTAGE_MAX); // overvolt the core just a bit
    sleep_ms(50);
    gset_sys_clock_khz(400000, true); // overclock to 400 MHz (from 125MHz)
    sleep_ms(50);

#if PSRAM_HARDWARE_SPI
    int baud = spi_set_baudrate(PSRAM_SPI_INST, 1000 * 1000 * 50);
    console_printf("PSRAM clock freq: %d Hz\n\r", baud);
    sleep_ms(50);
#endif

    while (true)
    {
        int c = riscv_emu();
        if(c != EMU_REBOOT)
            wait_button();
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

bool my_get_bootsel_button()
{
    const uint CS_PIN_INDEX = 1;

    // Set chip select to Hi-Z
    hw_write_masked(&ioqspi_hw->io[CS_PIN_INDEX].ctrl,
                    GPIO_OVERRIDE_LOW << IO_QSPI_GPIO_QSPI_SS_CTRL_OEOVER_LSB,
                    IO_QSPI_GPIO_QSPI_SS_CTRL_OEOVER_BITS);

    // Note we can't call into any sleep functions in flash right now
    for (volatile int i = 0; i < 1000; ++i)
        ;

    // The HI GPIO registers in SIO can observe and control the 6 QSPI pins.
    // Note the button pulls the pin *low* when pressed.
    bool button_state = !(sio_hw->gpio_hi_in & (1u << CS_PIN_INDEX));

    // Need to restore the state of chip select, else we are going to have a
    // bad time when we return to code in flash!
    hw_write_masked(&ioqspi_hw->io[CS_PIN_INDEX].ctrl,
                    GPIO_OVERRIDE_NORMAL << IO_QSPI_GPIO_QSPI_SS_CTRL_OEOVER_LSB,
                    IO_QSPI_GPIO_QSPI_SS_CTRL_OEOVER_BITS);

    return button_state;
}

void wait_button()
{
    while (!my_get_bootsel_button())
        tight_loop_contents();
    while (my_get_bootsel_button())
        tight_loop_contents();
}
