#ifndef CACHE_H
#define CACHE_H

#include <stdint.h>

void cache_reset();
void cache_write(uint32_t ofs, void *buf, uint8_t size);
void cache_read(uint32_t ofs, void *buf, uint8_t size);

#endif
