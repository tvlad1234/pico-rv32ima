#include "pico/stdlib.h"

#define timing_delay_ms(n) sleep_ms(n)
#define timing_delay_us(n) sleep_us(n)

static inline uint64_t timing_micros(void)
{
    absolute_time_t t = get_absolute_time();
    return to_us_since_boot(t);
}
