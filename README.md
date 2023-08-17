# pico-rv32ima
RISC-V emulator for RP2040, capable of running Linux.\
Based on [mini-rv32ima by CNLohr](https://github.com/cnlohr/mini-rv32ima).

## How it works
This project uses [CNLohr's mini-rv32ima](https://github.com/cnlohr/mini-rv32ima) RISC-V emulator core to run Linux on a Raspberry Pi Pico. It uses two 8 megabyte SPI PSRAM chips as system memory. To alleviate the bottleneck introduced by the SPI interface of the PSRAM, a 4kb cache is used. The cache implementation comes from [xhackerustc's uc32-rvima project](https://github.com/xhackerustc/uc-rv32ima).

## Requirements 
- a Raspberry Pi Pico (or other RP2040 board)
- an SD card
- two 8 megabyte (64Mbit) SPI PSRAM chips (I used LY68L6400).
    - it is possible to use only one of these chips when running a reduced system image, by changing a setting in the config file.

_This project overvolts and overclocks the RP2040! Use at own risk!_

## How to use
The configuration can be modified in the [rv32_config.h](pico-rv32ima/rv32_config.h) file. A schematic with the pin mappings described here is included in [this file](hardware/pico_linux.kicad_sch).

- By default, the SD card is connected via SPI, with the following pinout:
    - CLK: GPIO18
    - MISO: GPIO16
    - MOSI: GPIO19
    - CS: GPIO20
- The SD card may also be connected over SDIO.

- The two RAM chips are connected with the following default pinout:
    - CLK: GPIO10
    - MISO: GPIO12
    - MOSI: GPIO11
    - CS1: GPIO21
    - CS2: GPIO22

- The RAM chips use hardware SPI by default. A flag in the config file allows them to use software bit-banged SPI (required for using the LCD console).

- The system console is accessible over USB-CDC, UART or an 128x160 ST7735 display paired with a PS2 keyboard. All three can be used at the same time, but keep in mind they point to the same virtual console. They can be enabled or disabled as desired in the config file. By default, only the USB console is enabled.
    - The use of the LCD console requires disabling the hardware SPI interface for the RAN in the config file.

The SD card needs to be formatted as FAT32 or exFAT. Block sizes from 1024 to 4096 bytes are confirmed to be working. A prebuilt Linux kernel and filesystem image is provided in [this file](linux/Image). It must be placed in the root of the SD card. If you want to build the image yourself, you need to run `make` in the [linux](linux) folder. This will clone the buildroot source tree, apply the necessary config files and build the kernel and system image.

## What it does
On powerup, the Linux image will be copied into RAM. After a few seconds, Linux kernel messages will start streaming on the console. The boot process takes about one and a half minute. A video of the boot process can be seen [here](https://youtu.be/txgoWddk_2I). The Linux image includes a fork of the [c4 compiler/interpreter](https://github.com/rswier/c4). To run the included hello world example, type `c4 hello.c` in the shell after the system has booted. The source file of c4 can be found in `/usr/src/c4.c`. I have included it in the system image because this compiler is self-hosting and can run itself, which makes for a nice demo. You can use the vi editor to create or edit source files.

## Pictures
- Serial (USB or UART) console:
    - ![Console boot log](pictures/screenshot.jpg)
- LCD console:
    - ![LCD console](pictures/lcd.jpg)