#include "hardware/gpio.h"
#include "hardware/spi.h"
#include "hw_config.h"

#define sd_select() gpio_put(SD_SPI_PIN_CS, false)
#define sd_deselect() gpio_put(SD_SPI_PIN_CS, true)

static inline uint8_t sd_spi_byte(uint8_t b)
{
    spi_write_read_blocking(SD_SPI_INST, &b, &b, 1);
    return b;
}

#define sd_led_off() gpio_put(PICO_DEFAULT_LED_PIN, 0)
#define sd_led_on() gpio_put(PICO_DEFAULT_LED_PIN, 1)
