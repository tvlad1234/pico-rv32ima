#include <stdint.h>
#include "hardware/gpio.h"
#include "hw_config.h"

uint8_t spi_tx_data, spi_rx_data;

static inline uint8_t bb_spi_xfer_byte(uint8_t tx_data)
{
    uint8_t rx_data = 0;

    for (int i = 0; i < 8; i++)
    {
        // set MOSI
        gpio_put(BB_SPI_MOSI, tx_data & 0x80);

        tx_data = tx_data << 1;

        gpio_put(BB_SPI_SCK, false);
        sleep_us(BB_SPI_DELAY);

        rx_data = rx_data << 1;
        if (gpio_get(BB_SPI_MISO))
            rx_data |= 1;

        gpio_put(BB_SPI_SCK, true);
        sleep_us(BB_SPI_DELAY);
    }

    return rx_data;
}

static inline void custom_csr_write(uint16_t csrno, uint32_t value)
{
    // 0x180 : chip select register
    if (csrno == 0x180)
    {
        gpio_put(BB_SPI_CS, !value);
        sleep_us(BB_SPI_DELAY);
    }

    // 0x181 : initiate SPI transfer
    else if (csrno == 0x181)
    {
        // do transfer here
        spi_rx_data = bb_spi_xfer_byte(spi_tx_data);
    }

    // 0x182 : tx data register
    else if (csrno == 0x182)
    {
        spi_tx_data = value;
    }
}

static inline uint32_t custom_csr_read(uint16_t csrno)
{
    // 0x182 : tx data register
    if (csrno == 0x183)
        return spi_rx_data;
    return 0;
}