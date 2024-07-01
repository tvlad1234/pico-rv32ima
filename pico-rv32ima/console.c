#include "pico/stdlib.h"

#include <stdio.h>
#include <stdlib.h>
#include <stdarg.h>

#include "console.h"

#include "rv32_config.h"

#if CONSOLE_VGA
#include "terminal.h"
#endif

#if CONSOLE_CDC
#include "tusb.h"
#endif

queue_t ser_screen_queue, kb_queue;

#if CONSOLE_CDC
uint8_t cdc_buf[IO_QUEUE_LEN];
#endif

void console_init(void)
{

#if CONSOLE_VGA
    terminal_init();
#endif

#if CONSOLE_CDC
    tusb_init();
#endif

#if CONSOLE_UART
    uart_init(UART_INSTANCE, UART_BAUD_RATE);
    gpio_set_function(UART_TX_PIN, GPIO_FUNC_UART);
    gpio_set_function(UART_RX_PIN, GPIO_FUNC_UART);
#endif

#if CONSOLE_CDC || CONSOLE_UART
    queue_init(&ser_screen_queue, sizeof(char), IO_QUEUE_LEN);
#endif

    queue_init(&kb_queue, sizeof(char), IO_QUEUE_LEN);
}

#if CONSOLE_CDC || CONSOLE_UART
void ser_console_task(void)
{
    while (!queue_is_empty(&ser_screen_queue))
    {
        uint8_t c;
        queue_remove_blocking(&ser_screen_queue, &c);

#if CONSOLE_CDC
        if (tud_cdc_connected())
            tud_cdc_write_char(c);
#endif

#if CONSOLE_UART
        uart_putc_raw(UART_INSTANCE, c);
#endif
    }

#if CONSOLE_CDC
    if (tud_cdc_connected() && tud_cdc_available())
    {
        uint32_t count = tud_cdc_read(cdc_buf, sizeof(cdc_buf));
        for (int i = 0; i < count; i++)
            queue_try_add(&kb_queue, &cdc_buf[i]);
    }

    if (tud_cdc_connected())
        tud_cdc_write_flush();
#endif

#if CONSOLE_UART
    uint8_t uart_in_ch;
    while (uart_is_readable(UART_INSTANCE))
    {
        uart_read_blocking(UART_INSTANCE, &uart_in_ch, 1);
        queue_try_add(&kb_queue, &uart_in_ch);
    }
#endif
}
#endif

void console_task(void)
{
#if CONSOLE_CDC
    tud_task();
#endif

#if CONSOLE_CDC || CONSOLE_UART
    ser_console_task();
#endif

#if CONSOLE_VGA
    terminal_task();
#endif
}

void console_putc(char c)
{
#if CONSOLE_CDC || CONSOLE_UART
    queue_add_blocking(&ser_screen_queue, &c);
#endif

#if CONSOLE_VGA
   queue_add_blocking(&term_screen_queue, &c);
#endif
}

void console_puts(char s[])
{
    uint8_t n = strlen(s);
    for (int i = 0; i < n; i++)
        console_putc(s[i]);
}

char termPrintBuf[100];

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
