#ifndef __PSRAM_H
#define __PSRAM_H

#include "pico/stdlib.h"
#include "f_util.h"
#include "ff.h"

#include "rv32_config.h"

void accessPSRAM(uint32_t addr, size_t size, bool write, void *bufP);
FRESULT loadFileIntoRAM(const char *imageFilename, uint32_t addr);
void loadDataIntoRAM(const unsigned char *d, uint32_t addr, uint32_t size);

int initPSRAM();


#endif