#include "console.h"

#define console_putc(c) console_putc(c)
#define console_puts(s) console_puts(s)

#define console_available() (!queue_is_empty(&kb_queue))
#define pwr_button() console_available()

char console_read(void)
{
    char c;
    queue_try_remove(&kb_queue, &c);
    return c;
}
