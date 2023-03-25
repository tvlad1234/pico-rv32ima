#include <stdio.h>
#include <stdlib.h>
#include <stdarg.h>

#include "tusb.h"

#include "cdc_console.h"

queue_t screen_queue, kb_queue;

uint8_t buf[IO_QUEUE_LEN];
void cdc_task(void)
{
    if (tud_cdc_connected())
    {
        while (!queue_is_empty(&screen_queue))
        {
            uint8_t c;
            queue_remove_blocking(&screen_queue, &c);
            tud_cdc_write_char(c);
        }

        if (tud_cdc_available())
        {
            uint32_t count = tud_cdc_read(buf, sizeof(buf));
            const char cr = '\r';
            for (int i = 0; i < count; i++)
            {
                if (buf[i] == '\n')
                    queue_try_add(&kb_queue, &cr);
                queue_try_add(&kb_queue, &buf[i]);
            }
        }
        
        tud_cdc_write_flush();
    }
}

char termPrintBuf[100];
void cdc_puts(char s[])
{
    const char cr = '\r';
    uint8_t n = strlen(s);
    for (int i = 0; i < n; i++)
    {
        queue_add_blocking(&screen_queue, &s[i]);
        if (s[i] == '\n')
            queue_add_blocking(&screen_queue, &cr);
    }
}

void cdc_printf(const char *format, ...)
{
    va_list args;
    va_start(args, format);
    vsprintf(termPrintBuf, format, args);
    cdc_puts(termPrintBuf);
    va_end(args);
}

void cdc_panic(const char *format, ...)
{
    va_list args;
    va_start(args, format);
    vsprintf(termPrintBuf, format, args);
    cdc_puts("PANIC: ");
    cdc_puts(termPrintBuf);
    va_end(args);

    while (true)
        tight_loop_contents();
}
