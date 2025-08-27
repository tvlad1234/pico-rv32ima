#include "pico/stdlib.h"
#include "pico/multicore.h"

#include "hardware/spi.h"
#include "hardware/gpio.h"
#include "hardware/vreg.h"
#include "hardware/pll.h"
#include "hardware/clocks.h"

#include "hw_config.h"
#include "tiny-rv32ima.h"
#include "console.h"

void core1_entry();
bool gset_sys_clock_khz(uint32_t freq_khz, bool required);
void gset_sys_clock_pll(uint32_t vco_freq, uint post_div1, uint post_div2);

int main()
{

#ifdef PICO_RP2350A
    // Overclock RP2350
    vreg_disable_voltage_limit();
    sleep_ms(50);
    vreg_set_voltage(RP2350_OVERVOLT);
    sleep_ms(50);
    gset_sys_clock_khz(RP2350_CPU_FREQ, true);
    sleep_ms(50);
#else
    // Overclock RP2040
    sleep_ms(50);
    vreg_set_voltage(RP2040_OVERVOLT);
    sleep_ms(50);
    gset_sys_clock_khz(RP2040_CPU_FREQ, true);
    sleep_ms(50);
#endif

    // LED
    gpio_init(PICO_DEFAULT_LED_PIN);
    gpio_set_dir(PICO_DEFAULT_LED_PIN, GPIO_OUT);

    // PSRAM GPIO and SPI
    gpio_init(PSRAM_SPI_PIN_TX);
    gpio_init(PSRAM_SPI_PIN_RX);
    gpio_init(PSRAM_SPI_PIN_CK);

    gpio_init(PSRAM_SPI_PIN_S1);
    gpio_set_dir(PSRAM_SPI_PIN_S1, GPIO_OUT);
    gpio_put(PSRAM_SPI_PIN_S1, true);

    spi_init(PSRAM_SPI_INST, 1000 * 1000 * 50);
    gpio_set_function(PSRAM_SPI_PIN_TX, GPIO_FUNC_SPI);
    gpio_set_function(PSRAM_SPI_PIN_RX, GPIO_FUNC_SPI);
    gpio_set_function(PSRAM_SPI_PIN_CK, GPIO_FUNC_SPI);

    // SD GPIO and SPI
    gpio_init(SD_SPI_PIN_CS);
    gpio_set_dir(SD_SPI_PIN_CS, GPIO_OUT);
    gpio_put(SD_SPI_PIN_CS, true);

    gpio_init(SD_SPI_PIN_CK);
    gpio_init(SD_SPI_PIN_TX);
    gpio_init(SD_SPI_PIN_RX);

    spi_init(SD_SPI_INST, 1000 * 100 * 50);
    gpio_set_function(SD_SPI_PIN_CK, GPIO_FUNC_SPI);
    gpio_set_function(SD_SPI_PIN_TX, GPIO_FUNC_SPI);
    gpio_set_function(SD_SPI_PIN_RX, GPIO_FUNC_SPI);

    // Bit-banged SPI
    gpio_init(BB_SPI_CS);
    gpio_set_dir(BB_SPI_CS, GPIO_OUT);
    gpio_put(BB_SPI_CS, true);

    gpio_init(BB_SPI_SCK);
    gpio_set_dir(BB_SPI_SCK, GPIO_OUT);
    gpio_put(BB_SPI_SCK, true);

    gpio_init(BB_SPI_MOSI);
    gpio_set_dir(BB_SPI_MOSI, GPIO_OUT);

    gpio_init(BB_SPI_MISO);
    gpio_set_dir(BB_SPI_MISO, GPIO_IN);

    // Console init
    console_init();

    // Second core bringup
    multicore_reset_core1();
    multicore_fifo_drain();
    multicore_launch_core1(core1_entry);

    // Handle console
    while (true)
        console_task();
}

void core1_entry()
{
    sleep_ms(250);
    vm_init_hw();

    int vm_state = EMU_GET_SD;
    while (true)
    {
        vm_state = start_vm(vm_state);
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
