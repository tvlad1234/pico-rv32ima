/*
 * Copyright (c) 2023, Jisheng Zhang <jszhang@kernel.org>. All rights reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 */

#ifndef CACHE_H
#define CACHE_H

#include <stdint.h>

void cache_write(uint32_t ofs, void *buf, uint32_t size);
void cache_read(uint32_t ofs, void *buf, uint32_t size);
void cache_get_stat(uint64_t *phit, uint64_t *paccessed);

#endif /* CACHE_H */
