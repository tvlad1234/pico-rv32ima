#ifndef _TERMINAL_H
#define _TERMINAL_H

#include "hw_config.h"
#if CONSOLE_VGA

#include "pico/util/queue.h"

extern queue_t term_screen_queue;

void terminal_task(void);
void terminal_init(void);

#endif

#endif