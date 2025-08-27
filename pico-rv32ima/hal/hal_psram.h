#include "hardware/gpio.h"
#include "hardware/spi.h"
#include "hw_config.h"

#define psram_select() gpio_put(PSRAM_SPI_PIN_S1, false)
#define psram_deselect() gpio_put(PSRAM_SPI_PIN_S1, true)

#define psram_spi_write(buf, sz) spi_write_blocking(PSRAM_SPI_INST, buf, sz)
#define psram_spi_read(buf, sz) spi_read_blocking(PSRAM_SPI_INST, 0, buf, sz)
