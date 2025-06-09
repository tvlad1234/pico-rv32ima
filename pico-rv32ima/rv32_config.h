#ifndef _RV32_CONFIG_H
#define _RV32_CONFIG_H


/**********************/
/* CPU frequency config
/**********************/

// if running on RP2040 (Pico)
#define RP2040_CPU_FREQ 400000 // 400000
#define RP2040_OVERVOLT VREG_VOLTAGE_MAX

// if running on RP2350 (Pico 2)
#define RP2350_CPU_FREQ 512000
#define RP2350_OVERVOLT VREG_VOLTAGE_1_60

/********************************************************/


/******************/
/* Emulator config
/******************/

#define KERNEL_FILENAME "IMAGE"
#define BLK_FILENAME "ROOTFS"

// RAM size in megabytes
#define EMULATOR_RAM_MB 8

// Kernel command line
#define KERNEL_CMDLINE "console=hvc0 root=fe00"

// Time divisor
#define EMULATOR_TIME_DIV 1

// Tie microsecond clock to instruction count
#define EMULATOR_FIXED_UPDATE false

// Enable UART console
#define CONSOLE_UART 0

// Enable USB CDC console
#define CONSOLE_CDC 1

// Enable VGA console
#define CONSOLE_VGA 1

/********************************************************/


/******************/
/* UART config
/******************/

#if CONSOLE_UART

// UART instance
#define UART_INSTANCE uart0

// UART Baudrate (if enabled)
#define UART_BAUD_RATE 115200

// Pins for the UART (if enabled)
#define UART_TX_PIN 0
#define UART_RX_PIN 1

#endif


/********************************************************/


/******************/
/* VGA config
/******************/

#if CONSOLE_VGA

// Pins for the VGA output (if enabled)
#define VGA_VSYNC_PIN 16
#define VGA_HSYNC_PIN 17
#define VGA_R_PIN 18

#define PS2_PIN_DATA 26
#define PS2_PIN_CK 27

#endif

/********************************************************/


/******************/
/* PSRAM config
/******************/

#define PSRAM_TWO_CHIPS 0

// Hardware SPI instance to use for PSRAM
#define PSRAM_SPI_INST spi1

// Pins for the PSRAM SPI interface
#define PSRAM_SPI_PIN_CK 10
#define PSRAM_SPI_PIN_TX 11
#define PSRAM_SPI_PIN_RX 12
#define PSRAM_SPI_PIN_S1 13
#define PSRAM_SPI_PIN_S2 14

// PSRAM chip size (in bytes)
#define PSRAM_CHIP_SIZE (8192 * 1024)

/********************************************************/


/******************/
/* SD card config
/******************/

#define SD_SPI_INST spi0

// Pins for the SD SPI interface
#define SD_SPI_PIN_CK 2
#define SD_SPI_PIN_TX 3
#define SD_SPI_PIN_RX 4
#define SD_SPI_PIN_CS 0


#endif
