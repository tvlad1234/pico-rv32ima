#include "f_util.h"
#include "ff.h"
#include "hw_config.h"
#include "sdram.h"

#include <stdlib.h>

#define CACHE_BLK_BYTES (CACHE_BLK_KB * 1024)

FIL ramFile;

typedef struct CacheBlock
{
    uint32_t startAddress;
    uint64_t lastAccess;
    uint8_t contents[CACHE_BLK_BYTES];
    bool pendingData;
    bool wasUsed;
} CacheBlock;

CacheBlock blocks[CACHE_BLK_NUM] = {0};
CacheBlock *blockList[CACHE_BLK_NUM];

uint8_t usedBlocks = 0;

uint64_t memAccesses = 0;

CacheBlock *leastRecentlyUsed()
{
    CacheBlock *b = &blocks[0];
    for (int i = 1; i < usedBlocks; i++)
        if (blocks[i].lastAccess < b->lastAccess)
            b = blocks + i;
    return b;
}

void flushBlock(CacheBlock *b)
{

    if (b->pendingData)
    {

        //  printf("Write block %d!\n", b->num);
        b->pendingData = false;
        FRESULT fr;
        fr = f_lseek(&ramFile, b->startAddress);
        if (fr != FR_OK)
        {
            printf("Seek error at address %d!\n", b->startAddress);
            while (1)
                tight_loop_contents();
        }

        fr = f_write(&ramFile, b->contents, CACHE_BLK_BYTES, NULL);
        if (fr != FR_OK)
        {
            printf("Write error at address %d!\n", b->startAddress);
            while (1)
                tight_loop_contents();
        }
    }
}

void fetchBlock(uint32_t addr, CacheBlock *b)
{
    //  printf("Read block starting at address %d!\n", addr);
    LED_ON();

    b->startAddress = addr - (addr % CACHE_BLK_BYTES);
    b->wasUsed = true;
    b->pendingData = false;
    FRESULT fr;
    fr = f_lseek(&ramFile, b->startAddress);
    if (fr != FR_OK)
    {
        printf("Seek error at address %d!\n", b->startAddress);
        while (1)
            tight_loop_contents();
    }
    fr = f_read(&ramFile, b->contents, CACHE_BLK_BYTES, NULL);
    if (fr != FR_OK)
    {
        printf("Read error at address %d!\n", b->startAddress);
        while (1)
            tight_loop_contents();
    }
    LED_OFF();
}

int cmpfunc(const void *a, const void *b)
{
    CacheBlock *ba = *(CacheBlock **)a;
    CacheBlock *bb = *(CacheBlock **)b;

    return ba->startAddress - bb->startAddress;
}

CacheBlock *fetchNewBlock(uint32_t addr)
{
    CacheBlock *b;
    if (usedBlocks < CACHE_BLK_NUM)
    {
        b = &blocks[usedBlocks];
        blockList[usedBlocks++] = b;
    }

    else
    {
        b = leastRecentlyUsed();
        if (b->pendingData)
            flushBlock(b);
    }
    fetchBlock(addr, b);
    // insertionSort(blockList, usedBlocks);
    qsort(blockList, usedBlocks, sizeof(CacheBlock *), cmpfunc);
    return b;
}

CacheBlock *binarySearch(CacheBlock *arr[], int n, uint32_t x)
{
    int Left = 0, Right = n;
    CacheBlock *Sol = NULL;
    while(Left <= Right)
    {
        int Mid = (Left+Right) / 2;
        if(arr[Mid]->wasUsed && (x >= arr[Mid]->startAddress && x < arr[Mid]->startAddress + CACHE_BLK_BYTES))
        {
            Sol = arr[Mid];
            break;
        }
        if(arr[Mid]->startAddress + CACHE_BLK_BYTES > x)
            Right = Mid - 1;
        if(arr[Mid]->startAddress < x)
            Left = Mid + 1;
    }
    return Sol;
}

CacheBlock *whereCached(uint32_t addr)
{

    if (usedBlocks == 0)
        return NULL;

    CacheBlock * b = binarySearch(blockList, usedBlocks, addr);
    return b;

    for (int i = 0; i < usedBlocks; i++)
        if (blockList[i]->wasUsed && (addr >= blockList[i]->startAddress && addr < blockList[i]->startAddress + CACHE_BLK_BYTES))
            return blockList[i];

    //   printf("Block %d is not cached\n", blockNum);

    return NULL;
}

void writeCachedRAMByte(uint32_t addr, uint8_t data)
{
    CacheBlock *b = whereCached(addr);
    if (b == NULL)
        b = fetchNewBlock(addr);
    b->pendingData = true;

    b->lastAccess = memAccesses;
    memAccesses++;
    b->contents[addr - b->startAddress] = data;
}

uint8_t readCachedRAMByte(uint32_t addr)
{
    CacheBlock *b = whereCached(addr);
    if (b == NULL)
        b = fetchNewBlock(addr);

    b->lastAccess = memAccesses;
    memAccesses++;
    return b->contents[addr - b->startAddress];
}

void accessSDRAM(uint32_t addr, uint8_t size, bool write, void *bufP)
{
    uint8_t *b = (uint8_t *)bufP;
    if (write)
        while (size--)
            writeCachedRAMByte(addr++, *(b++));
    else
        while (size--)
            *(b++) = readCachedRAMByte(addr++);
}

FRESULT loadFileIntoRAM(const char *imageFilename, uint32_t addr)
{
    FIL imageFile;
    FRESULT fr = f_open(&imageFile, imageFilename, FA_READ);
    if (FR_OK != fr && FR_EXIST != fr)
        return fr;

    FSIZE_t imageSize = f_size(&imageFile);
    for (uint64_t i = 0; i < imageSize; i++)
    {
        uint8_t val;
        fr = f_read(&imageFile, &val, 1, NULL);
        if (FR_OK != fr)
            return fr;
        accessSDRAM(addr++, 1, true, &val);
    }
    fr = f_close(&imageFile);
    return fr;
}

void loadDataIntoRAM(const unsigned char *d, uint32_t addr, uint32_t size)
{
    while (size--)
        writeCachedRAMByte(addr++, *(d++));
}

int getFileSize(const char *fname)
{
    FIL f;
    FRESULT fr = f_open(&f, fname, FA_READ);
    if (FR_OK != fr && FR_EXIST != fr)
        return -1;

    int s = f_size(&f);
    fr = f_close(&f);
    return s;
}

FRESULT openSDRAMfile(const char *ramFilename, uint32_t sz)
{
    FRESULT fr = f_open(&ramFile, ramFilename, FA_WRITE | FA_READ);
    if (FR_OK != fr)
        return fr;
    /*
        uint8_t zero[4096] = {0};
        for (uint32_t i = 0; i < sz / 4096; i++)
        {
            fr = f_write(&ramFile, zero, 4096, NULL);
            if (FR_OK != fr)
                return fr;
        }
    */
    return fr;
}

FRESULT closeSDRAMfile()
{
    for (int i = 0; i < usedBlocks; i++)
        if (blocks[i].pendingData)
            flushBlock(&blocks[i]);
    FRESULT fr = f_close(&ramFile);
    return fr;
}