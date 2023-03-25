#ifndef __SDRAM_H
#define __SDRAM_H

#include "pico/stdlib.h"
#include "f_util.h"
#include "ff.h"

#include "rv32_config.h"

#define CACHE_BLK_NUM EMULATOR_RAM_CACHE_BLOCKS
#define CACHE_BLK_KB 1

void accessSDRAM(uint32_t addr, uint8_t size, bool write, void *bufP);
FRESULT loadFileIntoRAM(const char * imageFilename, uint32_t addr);
FRESULT openSDRAMfile(const char *ramFilename, uint32_t sz);
FRESULT closeSDRAMfile();
void loadDataIntoRAM(const unsigned char *d, uint32_t addr, uint32_t size);

#endif