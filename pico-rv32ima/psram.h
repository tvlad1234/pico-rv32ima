#ifndef __PSRAM_H
#define __PSRAM_H

#include "pico/stdlib.h"
#include "rv32_config.h"

void accessPSRAM(uint32_t addr, size_t size, bool write, void *bufP);
int initPSRAM();

#endif