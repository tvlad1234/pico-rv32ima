#include "hw_config.h"
#include "ff.h" /* Obtains integer types */

#include "rv32_config.h"

// Hardware Configuration of SPI "objects" (if SPI is being used)
#if SD_USE_SDIO == 0
static spi_t spis[] = {
    {.hw_inst = SD_SPI_INSTANCE,              // SPI component
     .miso_gpio = SD_SPI_PIN_MISO, // GPIO number (not Pico pin number)
     .mosi_gpio = SD_SPI_PIN_MOSI,
     .sck_gpio = SD_SPI_PIN_CLK,
     .set_drive_strength = true,
     .mosi_gpio_drive_strength = GPIO_DRIVE_STRENGTH_2MA,
     .sck_gpio_drive_strength = GPIO_DRIVE_STRENGTH_2MA,
     .baud_rate = 50 * 1000 * 1000, // Actual frequency: 20833333.
     .DMA_IRQ_num = DMA_IRQ_1}};
#endif

// Hardware Configuration of the SD Card "objects"
static sd_card_t sd_cards[] = {
    {
        .pcName = "0:", // Name used to mount device

#if SD_USE_SDIO
        .type = SD_IF_SDIO,

        .sdio_if = {
            .CMD_gpio = SDIO_PIN_CMD,
            .D0_gpio = SDIO_PIN_D0,
            .SDIO_PIO = pio1,
            .DMA_IRQ_num = DMA_IRQ_0},

#else
        .type = SD_IF_SPI,
        .spi_if.spi = &spis[0],          // Pointer to the SPI driving this card
        .spi_if.ss_gpio = SD_SPI_PIN_CS, // The SPI slave select GPIO for this SD card

#endif
        .use_card_detect = false,
        .card_detect_gpio = 0,   // Card detect
        .card_detected_true = -1 // What the GPIO read returns when a card is
                                 // present.
    }};

/* ********************************************************************** */
size_t sd_get_num() { return count_of(sd_cards); }
sd_card_t *sd_get_by_num(size_t num)
{
    if (num <= sd_get_num())
    {
        return &sd_cards[num];
    }
    else
    {
        return NULL;
    }
}

size_t spi_get_num()
{
#if SD_USE_SDIO
    return 0;
#else
    return count_of(spis);
#endif
}

spi_t *spi_get_by_num(size_t num)
{
#if SD_USE_SDIO
    return NULL;
#else
    if (num <= spi_get_num())
        return &spis[num];
    else
        return NULL;
#endif
}

/* [] END OF FILE */
