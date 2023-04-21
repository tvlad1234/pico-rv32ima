#include "pico/stdlib.h"

#include <stdio.h>
#include <stdlib.h>
#include <stdarg.h>

#include "tusb.h"

#include "console.h"
#include "rv32_config.h"

queue_t screen_queue, kb_queue;

uint8_t cdc_buf[IO_QUEUE_LEN];
uint8_t uart_in_ch;
const char cr = '\r';

bool uart_connected(void)
{
    static bool c = false;

    if (!c && uart_is_readable(UART_INSTANCE))
    {
        c = true;
        uint8_t x;
        uart_read_blocking(UART_INSTANCE, &x, 1);
    }
    return c;
}

void console_task(void)
{
    if (tud_cdc_connected() || uart_connected())
    {
        while (!queue_is_empty(&screen_queue))
        {
            uint8_t c;
            queue_remove_blocking(&screen_queue, &c);
            if (tud_cdc_connected())
                tud_cdc_write_char(c);
            uart_putc_raw(UART_INSTANCE, c);
        }

        if (tud_cdc_available())
        {
            uint32_t count = tud_cdc_read(cdc_buf, sizeof(cdc_buf));
            for (int i = 0; i < count; i++)
            {
                if (cdc_buf[i] == '\n')
                    queue_try_add(&kb_queue, &cr);
                queue_try_add(&kb_queue, &cdc_buf[i]);
            }
        }

        while (uart_is_readable(UART_INSTANCE))
        {
            uart_read_blocking(UART_INSTANCE, &uart_in_ch, 1);
            if (uart_in_ch == '\n')
                queue_try_add(&kb_queue, &cr);
            queue_try_add(&kb_queue, &uart_in_ch);
        }

        if (tud_cdc_connected())
            tud_cdc_write_flush();
    }
}

char termPrintBuf[100];
void console_puts(char s[])
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

void console_printf(const char *format, ...)
{
    va_list args;
    va_start(args, format);
    vsprintf(termPrintBuf, format, args);
    console_puts(termPrintBuf);
    va_end(args);
}

void console_panic(const char *format, ...)
{
    va_list args;
    va_start(args, format);
    vsprintf(termPrintBuf, format, args);
    console_puts("PANIC: ");
    console_puts(termPrintBuf);
    va_end(args);

    while (true)
        tight_loop_contents();
}
