#include <stdlib.h>

#include "rv32_config.h"
#include "psram.h"

#include "hardware/spi.h"

#define PSRAM_CMD_RES_EN 0x66
#define PSRAM_CMD_RESET 0x99
#define PSRAM_CMD_READ_ID 0x9F
#define PSRAM_CMD_READ 0x03
#define PSRAM_CMD_READ_FAST 0x0B
#define PSRAM_CMD_WRITE 0x02
#define PSRAM_KGD 0x5D

#define psram_select_chip(c) gpio_put(c, false)
#define psram_deselect_chip(c) gpio_put(c, true)

#define PSRAM_SPI_WRITE(buf, sz) spi_write_blocking(PSRAM_SPI_INST, buf, sz)
#define PSRAM_SPI_READ(buf, sz) spi_read_blocking(PSRAM_SPI_INST, 0, buf, sz)

void psram_send_cmd(uint8_t cmd, uint chip)
{
    if (chip)
        psram_select_chip(chip);
    PSRAM_SPI_WRITE(&cmd, 1);

    if (chip)
        psram_deselect_chip(chip);
}

void psram_reset(uint chip)
{
    psram_send_cmd(PSRAM_CMD_RES_EN, chip);
    psram_send_cmd(PSRAM_CMD_RESET, chip);
    sleep_ms(10);
}

void psram_read_id(uint chip, uint8_t *dst)
{
    psram_select_chip(chip);
    psram_send_cmd(PSRAM_CMD_READ_ID, 0);
    PSRAM_SPI_WRITE(dst, 3);
    PSRAM_SPI_READ(dst, 6);
    psram_deselect_chip(chip);
}

int psram_init()
{
    gpio_init(PSRAM_SPI_PIN_S1);
    gpio_init(PSRAM_SPI_PIN_TX);
    gpio_init(PSRAM_SPI_PIN_RX);
    gpio_init(PSRAM_SPI_PIN_CK);

    gpio_set_dir(PSRAM_SPI_PIN_S1, GPIO_OUT);
    psram_deselect_chip(PSRAM_SPI_PIN_S1);

#if PSRAM_TWO_CHIPS
    gpio_init(PSRAM_SPI_PIN_S2);
    gpio_set_dir(PSRAM_SPI_PIN_S2, GPIO_OUT);
    psram_deselect_chip(PSRAM_SPI_PIN_S2);
#endif

    uint baud = spi_init(PSRAM_SPI_INST, 1000 * 1000 * 25);
    gpio_set_function(PSRAM_SPI_PIN_TX, GPIO_FUNC_SPI);
    gpio_set_function(PSRAM_SPI_PIN_RX, GPIO_FUNC_SPI);
    gpio_set_function(PSRAM_SPI_PIN_CK, GPIO_FUNC_SPI);

    //  gpio_set_slew_rate(PSRAM_SPI_PIN_S1, GPIO_SLEW_RATE_FAST);
    //  gpio_set_slew_rate(PSRAM_SPI_PIN_TX, GPIO_SLEW_RATE_FAST);
    //  gpio_set_slew_rate(PSRAM_SPI_PIN_RX, GPIO_SLEW_RATE_FAST);
    //  gpio_set_slew_rate(PSRAM_SPI_PIN_CK, GPIO_SLEW_RATE_FAST);

#if PSRAM_TWO_CHIPS
    gpio_set_slew_rate(PSRAM_SPI_PIN_S2, GPIO_SLEW_RATE_FAST);
#endif

    sleep_ms(10);

    psram_reset(PSRAM_SPI_PIN_S1);
#if PSRAM_TWO_CHIPS
    psram_reset(PSRAM_SPI_PIN_S2);
#endif

    uint8_t chipId[6];

    psram_read_id(PSRAM_SPI_PIN_S1, chipId);
    if (chipId[1] != PSRAM_KGD)
        return -1;

#if PSRAM_TWO_CHIPS
    psram_read_id(PSRAM_SPI_PIN_S2, chipId);
    if (chipId[1] != PSRAM_KGD)
        return -2;
#endif

    return 0;
}

uint8_t cmdAddr[5];

void psram_access(uint32_t addr, size_t size, bool write, void *bufP)
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

#if PSRAM_TWO_CHIPS
    if (addr >= PSRAM_CHIP_SIZE)
    {
        ramchip = PSRAM_SPI_PIN_S2;
        addr -= PSRAM_CHIP_SIZE;
    }
#endif

    cmdAddr[1] = (addr >> 16) & 0xff;
    cmdAddr[2] = (addr >> 8) & 0xff;
    cmdAddr[3] = addr & 0xff;

    psram_select_chip(ramchip);
    PSRAM_SPI_WRITE(cmdAddr, cmdSize);

    if (write)
        PSRAM_SPI_WRITE(b, size);
    else
        PSRAM_SPI_READ(b, size);
    psram_deselect_chip(ramchip);
}

void psram_load_data(void *buf, uint32_t addr, uint32_t size)
{
    while (size >= 1024)
    {
        psram_access(addr, 1024, true, buf);
        addr += 1024;
        buf += 1024;
        size -= 1024;
    }

    if (size)
        psram_access(addr, size, true, buf);
}
