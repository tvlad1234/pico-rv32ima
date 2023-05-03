#include "rv32_config.h"
#if CONSOLE_LCD

#include "pico/stdlib.h"
#include <stdlib.h>

#include <ctype.h>
#include <string.h>

#include "console.h"

#include "st7735.h"
#include "gfx.h"

#include "ps2.h"

#define ESC 0x1B
#define CSI '['

queue_t term_screen_queue;

uint fontWidth = 6;
uint fontHeight = 8;

uint termWidth, termHeight;

uint termCursX = 0;
uint termCursY = 0;

uint16_t termFgColor = ST77XX_WHITE;
uint16_t termBgColor = ST77XX_BLACK;

void initLCDTerm(void)
{
    LCD_setPins(LCD_PIN_DC, LCD_PIN_CS, LCD_PIN_RST, LCD_PIN_SCK, LCD_PIN_TX);
    LCD_setSPIperiph(LCD_SPI_INSTANCE);
    LCD_initDisplay(INITR_BLACKTAB);
    LCD_setRotation(1);
    GFX_createFramebuf();

    PS2_init(PS2_PIN_DATA, PS2_PIN_CK);

    queue_init(&term_screen_queue, sizeof(char), IO_QUEUE_LEN);

    termWidth = GFX_getWidth() / fontWidth;
    termHeight = GFX_getHeight() / fontHeight - 1;

    GFX_clearScreen();
    GFX_flush();
}

void term_move_cursor(int x, int y)
{
    termCursX = x;
    termCursY = y;
}

void term_clear_screen()
{
    GFX_clearScreen();
}

void termNewLine()
{
    termCursY++;
    if (termCursY > termHeight)
    {
        termCursY--;
        GFX_scrollUp(fontHeight);
    }
}

void termCR()
{
    termCursX = 0;
}

void termPrintChar(char c)
{
    if (c == '\n')
        termNewLine();
    else if (c == '\r')
        termCR();
    else if (c == '\b')
    {
        if (termCursX == 0)
        {
            termCursX = termWidth - 1;
            if (termCursY > 0)
                termCursY--;
        }
        else
            termCursX--;
    }
    else
    {
        GFX_drawChar(termCursX * fontWidth, termCursY * fontHeight, c, termFgColor, termBgColor, 1, 1);
        termCursX++;
        if (termCursX >= termWidth)
        {
            termNewLine();
            termCR();
        }
    }
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

const uint16_t termColors[] = {ST77XX_BLACK, ST77XX_RED, ST77XX_GREEN, ST77XX_YELLOW, ST77XX_BLUE, ST77XX_MAGENTA, ST77XX_CYAN, ST77XX_WHITE};

void runCSI(char csi, uint *param, uint paramCount)
{
    // Clear screen
    if (csi == 'J')
    {
        // Clear everything
        if (paramCount && param[0] == 2)
            term_clear_screen();

        // Clear everything after cursor
        else if (paramCount == 0)
        {
            uint fillPosX = termCursX * fontWidth;
            uint fillPosY = termCursY * fontHeight;
            GFX_fillRect(fillPosX, fillPosY, GFX_getWidth() - fillPosX, fontHeight, ST77XX_BLACK);
            if (termCursY < termHeight)
            {
                fillPosY = (termCursY + 1) * fontHeight;
                GFX_fillRect(0, fillPosY, GFX_getWidth(), GFX_getHeight() - fillPosY, ST77XX_BLACK);
            }
        }
    }

    // Clear in line
    else if (csi == 'K')
    {
        // Clear from cursor to end of line
        if (paramCount == 0)
        {
            uint fillPosX = termCursX * fontWidth;
            uint fillPosY = termCursY * fontHeight;
            GFX_fillRect(fillPosX, fillPosY, GFX_getWidth() - fillPosX, fontHeight, ST77XX_BLACK);
        }
    }

    // Cursor movement
    else if (csi == 'H')
    {
        // Move to top left corner
        if (paramCount == 0)
            term_move_cursor(0, 0);
        else if (paramCount == 2)
            term_move_cursor(param[1], param[0]);
    }

    // Graphic rendition parameters
    else if (csi == 'm')
    {
        // Reset parameters
        if (paramCount == 0)
        {
            termFgColor = ST77XX_WHITE;
            termBgColor = ST77XX_BLACK;
        }
        else
            for (int i = 0; i < paramCount; i++)
            {
                // Foreground color
                if (param[i] >= 30 && param[i] <= 37)
                    termFgColor = termColors[param[i] - 30];
                // Background color
                else if (param[i] >= 40 && param[i] <= 47)
                    termBgColor = termColors[param[i] - 40];
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
        termPrintChar(c); // Handle regular characters
}

static uint64_t GetTimeMiliseconds()
{
    absolute_time_t t = get_absolute_time();
    return to_ms_since_boot(t);
}

#define TERM_KEY_UP 'A'
#define TERM_KEY_DOWN 'B'
#define TERM_KEY_RIGHT 'C'
#define TERM_KEY_LEFT 'D'

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
        char c = PS2_readKey();

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
            queue_try_add(&kb_queue, &c);
            break;
        }
    }
}

void drawCursor(uint x, uint y, bool en)
{
    if (en)
        GFX_drawLine(x * fontWidth, y * fontHeight + fontHeight, (x + 1) * fontWidth, y * fontHeight + fontHeight, ST77XX_WHITE);
    else
        GFX_drawLine(x * fontWidth, y * fontHeight + fontHeight, (x + 1) * fontWidth, y * fontHeight + fontHeight, ST77XX_BLACK);
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
        if ((termCursX != px || termCursY != py) && !en)
            drawCursor(px, py, false);
        drawCursor(termCursX, termCursY, en);
        en = !en;

        GFX_Update();
        px = termCursX;
        py = termCursY;
        prevMillis = millis;
    }
}

#endif