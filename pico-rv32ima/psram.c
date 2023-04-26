#include <stdlib.h>

#include "rv32_config.h"
#include "psram.h"

#define PSRAM_CMD_RES_EN 0x66
#define PSRAM_CMD_RESET 0x99
#define PSRAM_CMD_READ_ID 0x9F
#define PSRAM_CMD_READ 0x03
#define PSRAM_CMD_READ_FAST 0x0B
#define PSRAM_CMD_WRITE 0x02
#define PSRAM_KGD 0x5D

#define RAM_HALF (EMULATOR_RAM_MB * 512 * 1024)

#define selectPsramChip(c) gpio_put(c, false)
#define deSelectPsramChip(c) gpio_put(c, true)

#define spi_set_mosi(value) gpio_put(PSRAM_SPI_PIN_TX, value)
#define spi_read_miso() gpio_get(PSRAM_SPI_PIN_RX)

#define spi_pulse_sck()                \
    {                                  \
        asm("nop");                    \
        gpio_put(PSRAM_SPI_PIN_CK, 1); \
        asm("nop");                    \
        gpio_put(PSRAM_SPI_PIN_CK, 0); \
    }

void spi_tx_array(const uint8_t *data, size_t size)
{
    for (size_t i = 0; i < size; i++)
    {
        uint8_t byte = data[i];
        for (int j = 7; j >= 0; j--)
        {
            spi_set_mosi((byte >> j) & 0x01);
            spi_pulse_sck();
        }
    }
}

void spi_rx_array(uint8_t *data, size_t size)
{
    for (size_t i = 0; i < size; i++)
    {
        uint8_t byte = 0;
        for (int j = 7; j >= 0; j--)
        {
            spi_pulse_sck();
            byte |= (spi_read_miso() << j);
        }
        data[i] = byte;
    }
}

void sendPsramCommand(uint8_t cmd, uint chip)
{
    if (chip)
        selectPsramChip(chip);
    spi_tx_array(&cmd, 1);

    if (chip)
        deSelectPsramChip(chip);
}

void psramReset(uint chip)
{
    sendPsramCommand(PSRAM_CMD_RES_EN, chip);
    sendPsramCommand(PSRAM_CMD_RESET, chip);
    sleep_ms(10);
}

void psramReadID(uint chip, uint8_t *dst)
{
    selectPsramChip(chip);
    sendPsramCommand(PSRAM_CMD_READ_ID, 0);
    spi_tx_array(dst, 3);
    spi_rx_array(dst, 6);
    deSelectPsramChip(chip);
}

int initPSRAM()
{
    gpio_init(PSRAM_SPI_PIN_S1);
    gpio_init(PSRAM_SPI_PIN_S2);
    gpio_init(PSRAM_SPI_PIN_TX);
    gpio_init(PSRAM_SPI_PIN_RX);
    gpio_init(PSRAM_SPI_PIN_CK);

    gpio_set_dir(PSRAM_SPI_PIN_S1, GPIO_OUT);
    gpio_set_dir(PSRAM_SPI_PIN_S2, GPIO_OUT);
    gpio_set_dir(PSRAM_SPI_PIN_TX, GPIO_OUT);
    gpio_set_dir(PSRAM_SPI_PIN_RX, GPIO_IN);
    gpio_set_dir(PSRAM_SPI_PIN_CK, GPIO_OUT);

    deSelectPsramChip(PSRAM_SPI_PIN_S1);
    deSelectPsramChip(PSRAM_SPI_PIN_S2);

    gpio_put(PSRAM_SPI_PIN_TX, 0);
    gpio_put(PSRAM_SPI_PIN_CK, 0);

    sleep_ms(10);

    psramReset(PSRAM_SPI_PIN_S1);
    psramReset(PSRAM_SPI_PIN_S2);

    uint8_t chipId[6];

    psramReadID(PSRAM_SPI_PIN_S1, chipId);
    if (chipId[1] != PSRAM_KGD)
        return 1;

    psramReadID(PSRAM_SPI_PIN_S2, chipId);
    if (chipId[1] != PSRAM_KGD)
        return 2;

    return 0;
}

uint8_t cmdAddr[5];

void accessPSRAM(uint32_t addr, size_t size, bool write, void *bufP)
{
    uint8_t *b = (uint8_t *)bufP;
    uint cmdSize = 4;
    uint ramchip = PSRAM_SPI_PIN_S1;

    if (write)
        cmdAddr[0] = PSRAM_CMD_WRITE;
    else
    {
        cmdAddr[0] = PSRAM_CMD_READ_FAST;
        cmdSize++;
    }

    if (addr >= RAM_HALF)
    {
        ramchip = PSRAM_SPI_PIN_S2;
        addr -= RAM_HALF;
    }

    cmdAddr[1] = (addr >> 16) & 0xff;
    cmdAddr[2] = (addr >> 8) & 0xff;
    cmdAddr[3] = addr & 0xff;

    selectPsramChip(ramchip);
    spi_tx_array(cmdAddr, cmdSize);

    if (write)
        spi_tx_array(b, size);
    else
        spi_rx_array(b, size);

    deSelectPsramChip(ramchip);
}
