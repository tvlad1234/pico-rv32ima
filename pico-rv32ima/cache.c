#include <stdint.h>
#include <string.h>

#include "cache.h"
#include "psram.h"

#define ADDR_BITS 24

#define CACHE_LINE_SIZE 16
#define OFFSET_BITS 4 // log2(CACHE_LINE_SIZE)

#ifdef PICO_RP2350A
#define CACHE_SET_SIZE 8192
#define INDEX_BITS 13 // log2(CACHE_SET_SIZE)

#else
#define CACHE_SET_SIZE 4096
#define INDEX_BITS 12 // log2(CACHE_SET_SIZE)

#endif

#define OFFSET(addr) (addr & (CACHE_LINE_SIZE - 1))
#define INDEX(addr) ((addr >> OFFSET_BITS) & (CACHE_SET_SIZE - 1))
#define TAG(addr) (addr >> (OFFSET_BITS + INDEX_BITS))
#define BASE(addr) (addr & (~(uint32_t)(CACHE_LINE_SIZE - 1)))

#define LINE_TAG(line) (line->tag)

#define IS_VALID(line) (line->status & 0b01)
#define IS_DIRTY(line) (line->status & 0b10)
#define IS_LRU(line) (line->status & 0b100)

#define SET_VALID(line) line->status = 1
#define SET_DIRTY(line) line->status |= 0b10;
#define SET_LRU(line) line->status |= 0b100;
#define CLEAR_LRU(line) line->status &= ~0b100;

#define psram_write(ofs, p, sz) psram_access(ofs, sz, true, p)
#define psram_read(ofs, p, sz) psram_access(ofs, sz, false, p)

struct Cacheline
{
    uint8_t tag;
    uint8_t data[CACHE_LINE_SIZE];
    uint8_t status;
};
typedef struct Cacheline cacheline_t;

cacheline_t cache[CACHE_SET_SIZE][2];

uint64_t hits, misses;

void cache_reset()
{
    hits = 0;
    misses = 0;
    memset(cache, 0, sizeof(cache));
}

void cache_read(uint32_t addr, void *ptr, uint8_t size)
{
    uint16_t index = INDEX(addr);
    uint8_t tag = TAG(addr);
    uint8_t offset = OFFSET(addr);

    cacheline_t *line;

    if (tag == LINE_TAG((&cache[index][0])) && IS_VALID((&cache[index][0])))
    {
        line = &(cache[index][0]);
        CLEAR_LRU((&cache[index][0]));
        SET_LRU((&cache[index][1]));
        hits++;
    }
    else if (tag == LINE_TAG((&cache[index][1])) && IS_VALID((&cache[index][1])))
    {
        line = &(cache[index][1]);
        CLEAR_LRU((&cache[index][1]));
        SET_LRU((&cache[index][0]));
        hits++;
    }

    else // miss
    {
        misses++;

        if (IS_LRU((&cache[index][0])))
        {
            line = &(cache[index][0]);
            CLEAR_LRU((&cache[index][0]));
            SET_LRU((&cache[index][1]));
        }

        else
        {
            line = &(cache[index][1]);
            CLEAR_LRU((&cache[index][1]));
            SET_LRU((&cache[index][0]));
        }

        if (IS_VALID(line) && IS_DIRTY(line)) // if line is valid and dirty, flush it to RAM
        {
            // flush line to RAM
            uint32_t flush_base = (index << OFFSET_BITS) | ((uint32_t)(LINE_TAG(line)) << (INDEX_BITS + OFFSET_BITS));
            psram_write(flush_base, line->data, CACHE_LINE_SIZE);
        }

        // get line from RAM
        uint32_t base = BASE(addr);
        psram_read(base, line->data, CACHE_LINE_SIZE);

        line->tag = tag; // set the tag of the line
        SET_VALID(line); // mark the line as valid
    }

    /*
        if (offset + size > CACHE_LINE_SIZE)
        {
            // printf("cross boundary read!\n");
            size = CACHE_LINE_SIZE - offset;
        }
    */

    for (int i = 0; i < size; i++)
        ((uint8_t *)(ptr))[i] = line->data[offset + i];
}

void cache_write(uint32_t addr, void *ptr, uint8_t size)
{
    uint16_t index = INDEX(addr);
    uint8_t tag = TAG(addr);
    uint8_t offset = OFFSET(addr);

    cacheline_t *line;

    if (tag == LINE_TAG((&cache[index][0])) && IS_VALID((&cache[index][0])))
    {
        line = &(cache[index][0]);
        CLEAR_LRU((&cache[index][0]));
        SET_LRU((&cache[index][1]));
        hits++;
    }
    else if (tag == LINE_TAG((&cache[index][1])) && IS_VALID((&cache[index][1])))
    {
        line = &(cache[index][1]);
        CLEAR_LRU((&cache[index][1]));
        SET_LRU((&cache[index][0]));
        hits++;
    }

    else // miss
    {
        misses++;

        if (IS_LRU((&cache[index][0])))
        {
            line = &(cache[index][0]);
            CLEAR_LRU((&cache[index][0]));
            SET_LRU((&cache[index][1]));
        }

        else
        {
            line = &(cache[index][1]);
            CLEAR_LRU((&cache[index][1]));
            SET_LRU((&cache[index][0]));
        }

        if (IS_VALID(line) && IS_DIRTY(line)) // if line is valid and dirty, flush it to RAM
        {
            // flush line to RAM
            uint32_t flush_base = (index << OFFSET_BITS) | ((uint32_t)(LINE_TAG(line)) << (INDEX_BITS + OFFSET_BITS));
            psram_write(flush_base, line->data, CACHE_LINE_SIZE);
        }

        // get line from RAM
        uint32_t base = BASE(addr);
        psram_read(base, line->data, CACHE_LINE_SIZE);

        line->tag = tag; // set the tag of the line
        SET_VALID(line); // mark the line as valid
    }
    /*
        if (offset + size > CACHE_LINE_SIZE)
        {
            // printf("cross boundary write!\n");
            size = CACHE_LINE_SIZE - offset;
        }
    */
    for (int i = 0; i < size; i++)
        line->data[offset + i] = ((uint8_t *)(ptr))[i];
    SET_DIRTY(line); // mark the line as dirty
}
