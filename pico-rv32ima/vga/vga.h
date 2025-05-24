#ifndef _VGA_H
#define _VGA_H

#define VGA_BGR 0

// Length of the pixel array, and number of DMA transfers
#define TXCOUNT 160 // Total pixels/2 (since we have 2 pixels per byte)

#if VGA_BGR
#define BLACK 0b0
#define RED 0b100
#define GREEN 0b010
#define YELLOW 0b110
#define BLUE 0b001
#define MAGENTA 0b101
#define CYAN 0b011
#define WHITE 0b111
#else
#define BLACK 0
#define RED 1
#define GREEN 2
#define YELLOW 3
#define BLUE 4
#define MAGENTA 5
#define CYAN 6
#define WHITE 7
#endif

#define SCREEN_WIDTH 320
#define SCREEN_HEIGHT 240
#define FONT_HEIGHT 8
#define FONT_WIDTH 6
#define TERM_WIDTH (SCREEN_WIDTH / FONT_WIDTH)
#define TERM_HEIGHT (SCREEN_HEIGHT / FONT_HEIGHT)

extern volatile unsigned char termBuf[TERM_HEIGHT][TERM_WIDTH];
extern volatile uint8_t bgColBuf[TERM_HEIGHT][TERM_WIDTH];

extern uint cr_x, cr_y;
extern volatile uint8_t fg_col;
extern volatile uint8_t bg_col;

// void VGA_writePixel(int x, int y, char color);
void VGA_initDisplay(uint vsync_pin, uint hsync_pin, uint r_pin);

void VGA_fillScreen(uint16_t color);

void dma_memset(void *dest, uint8_t val, size_t num);
void dma_memcpy(void *dest, void *src, size_t num);

void VGA_cursor(int x, int y);
void VGA_clear();
void VGA_putc(char c);
void VGA_puts(char s[]);

#endif