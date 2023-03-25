#ifndef _RV32_CONFIG_H
#define _RV32_CONFIG_H

/******************/
/* Emulator config
/******************/

// RAM size in megabytes
#define EMULATOR_RAM_MB 16

// Number of 1kb RAM cache blocks
#define EMULATOR_RAM_CACHE_BLOCKS 200

// Time divisor 
#define EMULATOR_TIME_DIV 32

// Tie microsecond clock to instruction count
#define EMULATOR_FIXED_UPDATE false 


/****************/
/* SD card config
/***************/

// Set to 1 to use SDIO interface for the SD. Set to 0 to use SPI.
#define SD_USE_SDIO 1

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

#endif
