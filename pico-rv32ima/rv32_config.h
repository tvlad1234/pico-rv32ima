#ifndef _RV32_CONFIG_H
#define _RV32_CONFIG_H

/******************/
/* Emulator config
/******************/

// RAM size in megabytes
#define EMULATOR_RAM_MB 16

// Image filename
#define IMAGE_FILENAME "0:Image"

// Time divisor
#define EMULATOR_TIME_DIV 6

// Tie microsecond clock to instruction count
#define EMULATOR_FIXED_UPDATE false

// Enable UART console
#define CONSOLE_UART 0

// Enable USB CDC console
#define CONSOLE_CDC 1

// Enable ST7735 LCD and PS/2 keyboard terminal (Cannot be used when PSRAM is using hardware SPI)
#define CONSOLE_LCD 0

#if CONSOLE_UART

/******************/
/* UART config
/******************/

// UART instance
#define UART_INSTANCE uart0

// UART Baudrate (if enabled)
#define UART_BAUD_RATE 115200

// Pins for the UART (if enabled)
#define UART_TX_PIN 0
#define UART_RX_PIN 1

#endif

/******************/
/* PSRAM config
/******************/

// Use hardware SPI for PSRSAM (bitbang otherwise)
#define PSRAM_HARDWARE_SPI 1

#if PSRAM_HARDWARE_SPI

// Hardware SPI instance to use for PSRAM
#define PSRAM_SPI_INST spi1

#endif
// Pins for the PSRAM SPI interface
#define PSRAM_SPI_PIN_CK 10
#define PSRAM_SPI_PIN_TX 11
#define PSRAM_SPI_PIN_RX 12

// Select lines for the two PSRAM chips
#define PSRAM_SPI_PIN_S1 21
#define PSRAM_SPI_PIN_S2 22

// PSRAM chip size (in kilobytes)
#define PSRAM_CHIP_SIZE (8192 * 1024)

// Use two PSRAM chips?
#define PSRAM_TWO_CHIPS 1

/****************/
/* SD card config
/***************/

// Set to 1 to use SDIO interface for the SD. Set to 0 to use SPI.
#define SD_USE_SDIO 0

#if SD_USE_SDIO

/****************/
/* SDIO interface
/****************/

// Pins for the SDIO interface (if used)
// CLK will be D0 - 2,  D1 = D0 + 1,  D2 = D0 + 2,  D3 = D0 + 3
#define SDIO_PIN_CMD 18
#define SDIO_PIN_D0 19

#else

/*******************/
/* SD SPI interface
/******************/

// SPI instance used for SD (if used)
#define SD_SPI_INSTANCE spi0

// Pins for the SD SPI interface (if used)
#define SD_SPI_PIN_MISO 16
#define SD_SPI_PIN_MOSI 19
#define SD_SPI_PIN_CLK 18
#define SD_SPI_PIN_CS 20

#endif

#if PSRAM_HARDWARE_SPI
#undef CONSOLE_LCD
#define CONSOLE_LCD 0
#endif

#if CONSOLE_LCD

/*******************/
/* LCD SPI interface
/******************/

// SPI instance used for the LCD (if used)
#define LCD_SPI_INSTANCE spi1

// Pins for the LCD SPI interface (if used)
#define LCD_PIN_DC 4
#define LCD_PIN_CS 6
#define LCD_PIN_RST 5
#define LCD_PIN_SCK 14
#define LCD_PIN_TX 15

/*******************/
/* PS/2 keyboard interface
/******************/

#define PS2_PIN_DATA 2
#define PS2_PIN_CK 3

#endif

#endif
