#ifndef __PSRAM_H
#define __PSRAM_H

#include "pico/stdlib.h"

void psram_load_data(void *d, uint32_t addr, uint32_t size);
void psram_access(uint32_t addr, size_t size, bool write, void *bufP);
int psram_init();

#endif