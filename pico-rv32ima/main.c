#include "pico/stdlib.h"
#include "pico/multicore.h"
#include "pico/util/queue.h"
#include "hardware/vreg.h"

#include "tusb.h"

#include "ff.h"
#include "hw_config.h"

#include "psram.h"
#include "emulator.h"
#include "console.h"

const char *const imageFilename = "0:Image";

void core1_entry();

int main()
{
	vreg_set_voltage(VREG_VOLTAGE_MAX); // overvolt the core just a bit
	set_sys_clock_khz(400000, true);	// overclock to 400 MHz (from 125MHz)
	sleep_ms(25);

	tusb_init();

	uart_init(UART_INSTANCE, UART_BAUD_RATE);
	gpio_set_function(UART_TX_PIN, GPIO_FUNC_UART);
	gpio_set_function(UART_RX_PIN, GPIO_FUNC_UART);

	queue_init(&screen_queue, sizeof(char), IO_QUEUE_LEN);
	queue_init(&kb_queue, sizeof(char), IO_QUEUE_LEN);

	multicore_reset_core1();
	multicore_fifo_drain();
	multicore_launch_core1(core1_entry);

	while (true)
	{
		tud_task();
		console_task();
	}
}

void core1_entry()
{

	int r = initPSRAM();
	if (r)
		console_panic("Error initalizing PSRAM!\n");

	console_printf("PSRAM init OK!\n");

	sd_card_t *pSD0 = sd_get_by_num(0);
	FRESULT fr = f_mount(&pSD0->fatfs, pSD0->pcName, 1);
	if (FR_OK != fr)
		console_panic("SD mount error: %s (%d)\n", FRESULT_str(fr), fr);

	fr = loadFileIntoRAM(imageFilename, 0);
	if (FR_OK != fr)
		console_panic("Error loading image: %s (%d)\n", FRESULT_str(fr), fr);
	console_printf("Image loaded sucessfuly!\n");

	rvEmulator();

	while (true)
		tight_loop_contents();
}
