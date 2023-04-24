/*
 * Copyright (c) 2023, Jisheng Zhang <jszhang@kernel.org>. All rights reserved.
 *
 * Modified by Vlad Tomoiaga (tvlad1234)
 * SPDX-License-Identifier: BSD-3-Clause
 */

#include <stdint.h>
#include <string.h>

#include "cache.h"
#include "psram.h"

#define psram_write(handle, ofs, p, sz) accessPSRAM(ofs, sz, true, p)
#define psram_read(handle, ofs, p, sz) accessPSRAM(ofs, sz, false, p)

struct cacheline
{
	uint8_t data[64];
};

static uint64_t accessed, hit;
static uint32_t tags[4096 / 64 / 2][2];
static struct cacheline cachelines[4096 / 64 / 2][2];

/*
 * bit[0]: valid
 * bit[1]: dirty
 * bit[2]: for LRU
 * bit[3:10]: reserved
 * bit[11:31]: tag
 */
#define VALID (1 << 0)
#define DIRTY (1 << 1)
#define LRU (1 << 2)
#define LRU_SFT 2
#define TAG_MSK 0xfffff800

/*
 * bit[0: 5]: offset
 * bit[6: 10]: index
 * bit[11: 31]: tag
 */
static inline int get_index(uint32_t addr)
{
	return (addr >> 6) & 0x1f;
}

void cache_write(uint32_t ofs, void *buf, uint32_t size)
{
	// if (((ofs | (64 - 1)) != ((ofs + size - 1) | (64 - 1))))
	//	printf("write cross boundary\n");

	int ti, i, index = get_index(ofs);
	uint32_t *tp;
	uint8_t *p;

	++accessed;

	for (i = 0; i < 2; i++)
	{
		tp = &tags[index][i];
		p = cachelines[index][i].data;
		if (*tp & VALID)
		{
			if ((*tp & TAG_MSK) == (ofs & TAG_MSK))
			{
				++hit;
				ti = i;
				break;
			}
			else
			{
				if (i != 1)
					continue;

				ti = 1 - ((*tp & LRU) >> LRU_SFT);
				tp = &tags[index][ti];
				p = cachelines[index][ti].data;

				if (*tp & DIRTY)
				{
					psram_write(handle, *tp & ~0x3f, p, 64);
				}
				psram_read(handle, ofs & ~0x3f, p, 64);
				*tp = ofs & ~0x3f;
				*tp |= VALID;
			}
		}
		else
		{
			if (i != 1)
				continue;

			ti = i;
			psram_read(handle, ofs & ~0x3f, p, 64);
			*tp = ofs & ~0x3f;
			*tp |= VALID;
		}
	}

	tags[index][1] &= ~(LRU);
	tags[index][1] |= (ti << LRU_SFT);
	memcpy(p + (ofs & 0x3f), buf, size);
	*tp |= DIRTY;
}

void cache_read(uint32_t ofs, void *buf, uint32_t size)
{
	// if (((ofs | (64 - 1)) != ((ofs + size - 1) | (64 - 1))))
	//	printf("read cross boundary\n");

	int ti, i, index = get_index(ofs);
	uint32_t *tp;
	uint8_t *p;

	++accessed;

	for (i = 0; i < 2; i++)
	{
		tp = &tags[index][i];
		p = cachelines[index][i].data;
		if (*tp & VALID)
		{
			if ((*tp & TAG_MSK) == (ofs & TAG_MSK))
			{
				++hit;
				ti = i;
				break;
			}
			else
			{
				if (i != 1)
					continue;

				ti = 1 - ((*tp & LRU) >> LRU_SFT);
				tp = &tags[index][ti];
				p = cachelines[index][ti].data;

				if (*tp & DIRTY)
				{
					psram_write(handle, *tp & ~0x3f, p, 64);
				}
				psram_read(handle, ofs & ~0x3f, p, 64);
				*tp = ofs & ~0x3f;
				*tp |= VALID;
			}
		}
		else
		{
			if (i != 1)
				continue;

			ti = i;
			psram_read(handle, ofs & ~0x3f, p, 64);
			*tp = ofs & ~0x3f;
			*tp |= VALID;
		}
	}

	tags[index][1] &= ~(LRU);
	tags[index][1] |= (ti << LRU_SFT);
	memcpy(buf, p + (ofs & 0x3f), size);
}

void cache_get_stat(uint64_t *phit, uint64_t *paccessed)
{
	*phit = hit;
	*paccessed = accessed;
}
