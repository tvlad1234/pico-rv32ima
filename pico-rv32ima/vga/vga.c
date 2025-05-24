/**
 * Hunter Adams (vha3@cornell.edu)
 * Modified by Vlad Tomoiaga (tvlad1234) to be used as a 320x240 text display (with 640x480 timings)
 * VGA driver using PIO assembler
 *
 * HARDWARE CONNECTIONS
 *  - GPIO 17 ---> VGA Hsync
 *  - GPIO 16 ---> VGA Vsync
 *  - GPIO 18 ---> 330 ohm resistor ---> VGA Red
 *  - GPIO 19 ---> 330 ohm resistor ---> VGA Green
 *  - GPIO 20 ---> 330 ohm resistor ---> VGA Blue
 *  - RP2040 GND ---> VGA GND
 *
 * RESOURCES USED
 *  - PIO state machines 0, 1, and 2 on PIO instance 0
 *  - DMA channels 0 and 1
 *  - 153.6 kBytes of RAM (for pixel color data)
 *
 *
 *
 */

#include "pico/stdlib.h"
#include "hardware/pio.h"
#include "hardware/dma.h"

#include "string.h"

#include "vga.h"
#include "font.h"

#include "../../rv32_config.h"

#ifdef PICO_RP2350A
#define SYS_FREQ RP2350_CPU_FREQ
#else 
#define SYS_FREQ RP2040_CPU_FREQ
#endif

#include "hsync.pio.h"
#include "vsync.pio.h"
#include "rgb.pio.h"

// We are using 640x480 timings but the pixels are doubled both horizontally and vertically to effectively get 320x240
#define H_ACTIVE 655   // (active + frontporch - 1) - one cycle delay for mov
#define V_ACTIVE 479   // (active - 1)
#define RGB_ACTIVE 159 // (horizontal active)/2 - 1

// Pixel color arrays that are DMA'd to the PIO machines and
// pointers to these arrays
unsigned char vga_data_array1[TXCOUNT];
unsigned char vga_data_array2[TXCOUNT];
volatile unsigned char *renderBuf = &vga_data_array1[0];
volatile unsigned char *transmitBuf = &vga_data_array2[0];
volatile unsigned char *linePtrT;

// Character and color arrays and pointers to them
volatile unsigned char termBuf[TERM_HEIGHT][TERM_WIDTH];
volatile uint8_t fgColBuf[TERM_HEIGHT][TERM_WIDTH];
volatile uint8_t bgColBuf[TERM_HEIGHT][TERM_WIDTH];
unsigned char *currentLine = termBuf[0];
uint8_t *currentFgColLine = fgColBuf[0];
uint8_t *currentBgColLine = fgColBuf[0];

// DMA channel for dma_memcpy and dma_memset
int memcpy_dma_chan;

// DMA channel for transferring pixel data to the display
int rgb_chan_0;

// Choose which PIO instance to use (there are two instances, each with 4 state machines)
PIO pio = pio1;

// Manually select a few state machines from pio instance pio0.
uint hsync_sm = 0;
uint vsync_sm = 1;
uint rgb_sm = 2;

volatile int lineno = 0;
volatile int fontLine;

uint term_lin_no;
uint cr_x, cr_y;

uint8_t doubling;
volatile uint8_t fg_col = WHITE;
volatile uint8_t bg_col = BLACK;

static inline void VGA_writePixel(int pixel, char color)
{
    if (pixel & 1)
    {
        renderBuf[pixel >> 1] &= 0b00000111;
        renderBuf[pixel >> 1] |= (color << 3);
    }
    else
    {
        renderBuf[pixel >> 1] &= 0b0111000;
        renderBuf[pixel >> 1] |= (color);
    }
}

void VGA_setTextColor(uint8_t color)
{
    fg_col = color;
}

void VGA_cursor(int x, int y)
{
    cr_x = x;
    cr_y = y;
}

void VGA_clear()
{
    dma_memset(termBuf, 0, sizeof(termBuf));
    dma_memset(bgColBuf, 0, sizeof(bgColBuf));
}

void VGA_scrollUp()
{
    for (int i = 1; i < TERM_HEIGHT; i++)
    {
        dma_memcpy(termBuf[i - 1], termBuf[i], TERM_WIDTH);
        dma_memcpy(fgColBuf[i - 1], fgColBuf[i], TERM_WIDTH);
        dma_memcpy(bgColBuf[i - 1], bgColBuf[i], TERM_WIDTH);
    }

    dma_memset(termBuf[TERM_HEIGHT - 1], 0, TERM_WIDTH);
}

void VGA_newline()
{

    if (cr_y < TERM_HEIGHT - 1)
        cr_y++;
    else
        VGA_scrollUp();
}
void VGA_putc(char c)
{
    if (c == '\n')
        VGA_newline();
    else if (c == '\r')
        cr_x = 0;
    else if (c == '\b')
    {
        if (cr_x == 0)
        {
            cr_x = TERM_WIDTH - 1;
            if (cr_y > 0)
                cr_y--;
        }
        else
            cr_x--;
    }
    else
    {
        termBuf[cr_y][cr_x] = c;
        fgColBuf[cr_y][cr_x] = fg_col;
        bgColBuf[cr_y][cr_x] = bg_col;
        cr_x++;
        if (cr_x >= TERM_WIDTH)
        {
            VGA_newline();
            cr_x = 0;
        }
    }
}

void VGA_puts(char s[])
{
    uint8_t n = strlen(s);
    for (int i = 0; i < n; i++)
        VGA_putc(s[i]);
}

void dma_handler()
{
    dma_hw->ints0 = 1u << rgb_chan_0;
    dma_channel_set_read_addr(rgb_chan_0, transmitBuf, true);

    if (!doubling)
    {
        uint px_x = 0;
        for (int i = 0; i < TERM_WIDTH; i++)
        {
            char c = currentLine[i];
            uint8_t fg = currentFgColLine[i];
            uint8_t bg = currentBgColLine[i];
            uint8_t *charPtr = font + (5 * c);
            for (int8_t i = 0; i < 5; i++)
            {
                uint8_t line = charPtr[i];
                line = line >> fontLine;
                if (line & 1)
                    VGA_writePixel(px_x++, fg);
                else
                    VGA_writePixel(px_x++, bg);
            }
            VGA_writePixel(px_x++, bg);
        }
        if (lineno == 239)
        {
            lineno = 0;
            term_lin_no = 0;
            fontLine = 0;
            currentLine = termBuf[0];
            currentFgColLine = fgColBuf[0];
            currentBgColLine = bgColBuf[0];
        }
        else
            lineno++;

        if (fontLine == 7)
        {
            fontLine = 0;
            term_lin_no++;
            currentLine = termBuf[term_lin_no];
            currentFgColLine = fgColBuf[term_lin_no];
            currentBgColLine = bgColBuf[term_lin_no];
        }
        else
            fontLine++;

        doubling = 1;
    }
    else
    {
        // swap buffers around
        linePtrT = transmitBuf;
        transmitBuf = renderBuf;
        renderBuf = linePtrT;
        doubling = 0;
    }
}

void VGA_initDisplay(uint vsync_pin, uint hsync_pin, uint r_pin)
{

    // Our assembled program needs to be loaded into this PIO's instruction
    // memory. This SDK function will find a location (offset) in the
    // instruction memory where there is enough space for our program. We need
    // to remember these locations!
    //
    // We only have 32 instructions to spend! If the PIO programs contain more than
    // 32 instructions, then an error message will get thrown at these lines of code.
    //
    // The program name comes from the .program part of the pio file
    // and is of the form <program name_program>
    uint hsync_offset = pio_add_program(pio, &hsync_program);
    uint vsync_offset = pio_add_program(pio, &vsync_program);
    uint rgb_offset = pio_add_program(pio, &rgb_program);

    // Call the initialization functions that are defined within each PIO file.
    // Why not create these programs here? By putting the initialization function in
    // the pio file, then all information about how to use/setup that state machine
    // is consolidated in one place. Here in the C, we then just import and use it.
    hsync_program_init(pio, hsync_sm, hsync_offset, hsync_pin);
    vsync_program_init(pio, vsync_sm, vsync_offset, vsync_pin);
    rgb_program_init(pio, rgb_sm, rgb_offset, r_pin);

    /////////////////////////////////////////////////////////////////////////////////////////////////////
    // ===========================-== DMA Data Channels =================================================
    /////////////////////////////////////////////////////////////////////////////////////////////////////

    // DMA channel - 0 sends color data
    rgb_chan_0 = dma_claim_unused_channel(true);

    // DMA channel for dma_memcpy and dma_memset
    memcpy_dma_chan = dma_claim_unused_channel(true);

    // Channel Zero (sends color data to PIO VGA machine)
    dma_channel_config c0 = dma_channel_get_default_config(rgb_chan_0); // default configs
    channel_config_set_transfer_data_size(&c0, DMA_SIZE_8);             // 8-bit txfers
    channel_config_set_read_increment(&c0, true);                       // yes read incrementing
    channel_config_set_write_increment(&c0, false);                     // no write incrementing
    if (pio == pio0)
        channel_config_set_dreq(&c0, DREQ_PIO0_TX2); // DREQ_PIO0_TX2 pacing (FIFO)
    else
        channel_config_set_dreq(&c0, DREQ_PIO1_TX2); // DREQ_PIO1_TX2 pacing (FIFO)

    dma_channel_configure(
        rgb_chan_0,        // Channel to be configured
        &c0,               // The configuration we just created
        &pio->txf[rgb_sm], // write address (RGB PIO TX FIFO)
        &transmitBuf,      // The initial read address (pixel color array)
        TXCOUNT,           // Number of transfers; in this case each is 1 byte.
        false              // Don't start immediately.
    );

    // Tell the DMA to raise IRQ line 0 when the channel finishes a block
    dma_channel_set_irq0_enabled(rgb_chan_0, true);

    // Configure the processor to run dma_handler() when DMA IRQ 0 is asserted
    irq_set_exclusive_handler(DMA_IRQ_0, dma_handler);
    irq_set_enabled(DMA_IRQ_0, true);

    /////////////////////////////////////////////////////////////////////////////////////////////////////
    /////////////////////////////////////////////////////////////////////////////////////////////////////

    // Initialize PIO state machine counters. This passes the information to the state machines
    // that they retrieve in the first 'pull' instructions, before the .wrap_target directive
    // in the assembly. Each uses these values to initialize some counting registers.
    pio_sm_put_blocking(pio, hsync_sm, H_ACTIVE);
    pio_sm_put_blocking(pio, vsync_sm, V_ACTIVE);
    pio_sm_put_blocking(pio, rgb_sm, RGB_ACTIVE);

    // Start the two pio machine IN SYNC
    // Note that the RGB state machine is running at full speed,
    // so synchronization doesn't matter for that one. But, we'll
    // start them all simultaneously anyway.
    pio_enable_sm_mask_in_sync(pio, ((1u << hsync_sm) | (1u << vsync_sm) | (1u << rgb_sm)));
    dma_start_channel_mask((1u << rgb_chan_0));
}

// memset implementation using DMA
void dma_memset(void *dest, uint8_t val, size_t num)
{
    dma_channel_config c = dma_channel_get_default_config(memcpy_dma_chan);
    channel_config_set_transfer_data_size(&c, DMA_SIZE_8);
    channel_config_set_read_increment(&c, false);
    channel_config_set_write_increment(&c, true);

    dma_channel_configure(
        memcpy_dma_chan, // Channel to be configured
        &c,              // The configuration we just created
        dest,            // The initial write address
        &val,            // The initial read address
        num,             // Number of transfers; in this case each is 1 byte.
        true             // Start immediately.
    );

    dma_channel_wait_for_finish_blocking(memcpy_dma_chan);
}

// memcpy implementation using DMA
void dma_memcpy(void *dest, void *src, size_t num)
{
    dma_channel_config c = dma_channel_get_default_config(memcpy_dma_chan);
    channel_config_set_transfer_data_size(&c, DMA_SIZE_8);
    channel_config_set_read_increment(&c, true);
    channel_config_set_write_increment(&c, true);

    dma_channel_configure(
        memcpy_dma_chan, // Channel to be configured
        &c,              // The configuration we just created
        dest,            // The initial write address
        src,             // The initial read address
        num,             // Number of transfers; in this case each is 1 byte.
        true             // Start immediately.
    );

    dma_channel_wait_for_finish_blocking(memcpy_dma_chan);
}
