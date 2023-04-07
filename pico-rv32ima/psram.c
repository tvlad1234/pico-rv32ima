#include <stdlib.h>

#include "f_util.h"
#include "ff.h"
#include "hw_config.h"
#include "hardware/spi.h"

#include "pio_spi.h"
#include "rv32_config.h"
#include "cdc_console.h"
#include "psram.h"

#define PSRAM_CMD_RES_EN 0x66
#define PSRAM_CMD_RESET 0x99
#define PSRAM_CMD_READ_ID 0x9F
#define PSRAM_CMD_READ 0x03
#define PSRAM_CMD_READ_FAST 0x0B
#define PSRAM_CMD_WRITE 0x02

#define RAM_HALF (EMULATOR_RAM_MB * 512 * 1024)

pio_spi_inst_t pioSpi = {
    .pio = pio0,
    .sm = 0,
    .cs_pin = PICO_DEFAULT_SPI_CSN_PIN};

void selectPsramChip(uint c)
{
    gpio_put(c, false);
}

void deSelectPsramChip(uint c)
{
    gpio_put(c, true);
}

void sendPsramCommand(uint8_t cmd, uint chip)
{
    if (chip)
        selectPsramChip(chip);
    pio_spi_write8_blocking(&pioSpi, &cmd, 1);

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
    pio_spi_write8_blocking(&pioSpi, dst, 3);
    pio_spi_read8_blocking(&pioSpi, dst, 6);
    deSelectPsramChip(chip);
}

int initPSRAM()
{
    gpio_init(PSRAM_SPI_PIN_S1);
    gpio_set_dir(PSRAM_SPI_PIN_S1, true);
    gpio_init(PSRAM_SPI_PIN_S2);
    gpio_set_dir(PSRAM_SPI_PIN_S2, true);

    deSelectPsramChip(PSRAM_SPI_PIN_S1);
    deSelectPsramChip(PSRAM_SPI_PIN_S2);

    uint offset = pio_add_program(pioSpi.pio, &spi_cpha0_program);

    pio_spi_init(pioSpi.pio, pioSpi.sm, offset,
                 8,     // 8 bits per SPI frame
                 2.5,   // 40 MHz @ 400 clk_sys
                 false, // CPHA = 0
                 false, // CPOL = 0
                 PSRAM_SPI_PIN_CK,
                 PSRAM_SPI_PIN_TX,
                 PSRAM_SPI_PIN_RX);

    sleep_ms(10);

    psramReset(PSRAM_SPI_PIN_S1);
    psramReset(PSRAM_SPI_PIN_S2);

    uint8_t chipId[6];

    psramReadID(PSRAM_SPI_PIN_S1, chipId);
    if (chipId[1] != 0b01011101)
        return 1;

    psramReadID(PSRAM_SPI_PIN_S2, chipId);
    if (chipId[1] != 0b01011101)
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
    pio_spi_write8_blocking(&pioSpi, cmdAddr, cmdSize);

    if (write)
        pio_spi_write8_blocking(&pioSpi, b, size);
    else
        pio_spi_read8_blocking(&pioSpi, b, size);

    deSelectPsramChip(ramchip);
}

FRESULT loadFileIntoRAM(const char *imageFilename, uint32_t addr)
{
    FIL imageFile;
    FRESULT fr = f_open(&imageFile, imageFilename, FA_READ);
    if (FR_OK != fr && FR_EXIST != fr)
        return fr;

    FSIZE_t imageSize = f_size(&imageFile);

    uint8_t buf[4096];
    while (imageSize >= 4096)
    {
        fr = f_read(&imageFile, buf, 4096, NULL);
        if (FR_OK != fr)
            return fr;
        accessPSRAM(addr, 4096, true, buf);
        addr += 4096;
        imageSize -= 4096;
    }

    if (imageSize)
    {
        fr = f_read(&imageFile, buf, imageSize, NULL);
        if (FR_OK != fr)
            return fr;
        accessPSRAM(addr, imageSize, true, buf);
    }

    fr = f_close(&imageFile);
    return fr;
}

void loadDataIntoRAM(const unsigned char *d, uint32_t addr, uint32_t size)
{
    while (size--)
        accessPSRAM(addr++, 1, true, d++);
}
