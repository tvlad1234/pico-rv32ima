#include "pico/stdlib.h"
#include "pico/multicore.h"
#include "pico/util/queue.h"
#include "hardware/vreg.h"

#include "ff.h"
#include "hw_config.h"

#include "psram.h"
#include "emulator.h"
#include "console.h"
#include "terminal.h"

void core1_entry();

int main()
{
	vreg_set_voltage(VREG_VOLTAGE_MAX); // overvolt the core just a bit
	set_sys_clock_khz(400000, true);	// overclock to 400 MHz (from 125MHz)
	sleep_ms(25);

	console_init();

	multicore_reset_core1();
	multicore_fifo_drain();
	multicore_launch_core1(core1_entry);

	while (true)
	{
		console_task();
	}
}

void core1_entry()
{
	int r = initPSRAM();
	if (r)
		console_panic("Error initalizing PSRAM!\n\r");

	console_printf("PSRAM init OK!\n\r");

	sd_card_t *pSD0 = sd_get_by_num(0);
	FRESULT fr = f_mount(&pSD0->fatfs, pSD0->pcName, 1);
	if (FR_OK != fr)
		console_panic("SD mount error: %s (%d)\n\r", FRESULT_str(fr), fr);

	int c = rvEmulator();

	while (c == EMU_REBOOT)
		c = rvEmulator();
}
