#include "rv32_config.h"
#if CONSOLE_VGA

#include "pico/stdlib.h"
#include <stdlib.h>

#include <ctype.h>
#include <string.h>

#include "console.h"
#include "vga.h"
#include "ps2.h"

#define ESC 0x1B
#define CSI '['

#define TERM_KEY_UP 'A'
#define TERM_KEY_DOWN 'B'
#define TERM_KEY_RIGHT 'C'
#define TERM_KEY_LEFT 'D'

const uint8_t termColors[] = {BLACK, RED, GREEN, YELLOW, BLUE, MAGENTA, CYAN, WHITE};

queue_t term_screen_queue;

void terminal_init(void)
{
    PS2_init(PS2_PIN_DATA, PS2_PIN_CK);
    VGA_initDisplay(VGA_VSYNC_PIN, VGA_HSYNC_PIN, VGA_R_PIN);
    VGA_puts("\n\rpico-rv32ima, compiled ");
    VGA_puts(__DATE__);
    queue_init(&term_screen_queue, sizeof(char), IO_QUEUE_LEN);
}

bool termCharAvailable()
{
    return !queue_is_empty(&term_screen_queue);
}

char termGetChar()
{
    char c;
    queue_remove_blocking(&term_screen_queue, &c);
    return c;
}

char termPeekChar()
{
    char c;
    queue_peek_blocking(&term_screen_queue, &c);
    return c;
}

void clearInLine()
{
    for (int i = cr_x; i < TERM_WIDTH; i++)
    {
        termBuf[cr_y][i] = 0;
        bgColBuf[cr_y][i] = 0;
    }
}

void runCSI(char csi, uint *param, uint paramCount)
{
    // Clear screen
    if (csi == 'J')
    {
        // Clear everything
        if (paramCount && param[0] == 2)
            VGA_clear();

        // Clear everything after cursor
        else if (paramCount == 0)
        {
            clearInLine();
            if (cr_y < TERM_HEIGHT - 1)
                for (int i = cr_y + 1; i < TERM_HEIGHT; i++)
                {
                    dma_memset(termBuf[i], 0, TERM_WIDTH);
                    dma_memset(bgColBuf[i], 0, TERM_WIDTH);
                }
        }
    }

    // Clear in line
    else if (csi == 'K')
    {
        // Clear from cursor to end of line
        if (paramCount == 0)
            clearInLine();
    }

    // Cursor movement
    else if (csi == 'H')
    {
        // Move to top left corner
        if (paramCount == 0)
            VGA_cursor(0, 0);
        else if (paramCount == 2)
            VGA_cursor(param[1], param[0]);
    }

    // Graphic rendition parameters
    else if (csi == 'm')
    {
        // Reset parameters
        if (paramCount == 0)
        {
            fg_col = WHITE;
            bg_col = BLACK;
        }
        else
            for (int i = 0; i < paramCount; i++)
            {
                // Foreground color
                if (param[i] >= 30 && param[i] <= 37)
                    fg_col = termColors[param[i] - 30];
                // Background color
                else if (param[i] >= 40 && param[i] <= 47)
                    bg_col = termColors[param[i] - 40];
            }
    }
}

void parseCSI(char *s)
{
    uint slen = strlen(s);

    uint params[25];
    uint paramNum = 0;
    char csi = s[slen - 1];

    if (slen > 1)
    {
        char *p = strtok(s, ";");
        while (p != NULL)
        {
            if (strlen(p))
                params[paramNum++] = atoi(p);
            else
                params[paramNum++] = 0;
            p = strtok(NULL, ";");
        }
    }

    runCSI(csi, params, paramNum);
}

void vt100Emu()
{
    if (!termCharAvailable())
        return;

    int c = termGetChar();

    // Handle escape sequences
    if (c == ESC)
    {
        int next = termGetChar();

        // Handle CSI escape sequences
        if (next == CSI)
        {

            char s[100];
            uint cnt = 0;
            do
            {
                next = termPeekChar();
                if (!isalpha(next))
                    termGetChar();
                s[cnt++] = next;

            } while (isdigit(next) || next == ';');
            s[cnt] = '\0';
            termGetChar();
            parseCSI(s);
        }
    }

    else
        VGA_putc(c); // Handle regular characters
}

static uint64_t GetTimeMiliseconds()
{
    absolute_time_t t = get_absolute_time();
    return to_ms_since_boot(t);
}

const char csiStr[] = {ESC, CSI};

void termSendArrow(char a)
{

    queue_try_add(&kb_queue, csiStr);
    queue_try_add(&kb_queue, csiStr + 1);
    queue_try_add(&kb_queue, &a);
}

void handlePs2Keyboard(void)
{
    while (PS2_keyAvailable())
    {
        uint16_t c = PS2_readKey();

        switch (c)
        {
        case PS2_UPARROW:
            termSendArrow(TERM_KEY_UP);
            break;

        case PS2_DOWNARROW:
            termSendArrow(TERM_KEY_DOWN);
            break;

        case PS2_LEFTARROW:
            termSendArrow(TERM_KEY_LEFT);
            break;

        case PS2_RIGHTARROW:
            termSendArrow(TERM_KEY_RIGHT);
            break;

        default:
            if (c & 0x100)
            {
                c &= 0xFF;
                c -= 'a' - 1;
            }
            queue_try_add(&kb_queue, &c);
            // VGA_putc(c);
            break;
        }
    }
}

void drawCursor(uint x, uint y, bool en)
{
    if (en)
        bgColBuf[y][x] = GREEN;
    else
        bgColBuf[y][x] = BLACK;
}

void terminal_task(void)
{
    static uint prevMillis = 0;
    static uint px, py;
    static bool en = false;
    vt100Emu();
    handlePs2Keyboard();
    uint millis = GetTimeMiliseconds();
    if (millis > prevMillis + 150)
    {
        if ((cr_x != px || cr_y != py) && !en)
            drawCursor(px, py, false);
        drawCursor(cr_x, cr_y, en);
        en = !en;

        px = cr_x;
        py = cr_y;
        prevMillis = millis;
    }
}

#endif