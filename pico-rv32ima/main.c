#include <stdio.h>
#include <stdlib.h>
//
#include "pico/stdlib.h"
#include "pico/multicore.h"
#include "pico/util/queue.h"
//
#include "ff.h"
#include "rtc.h"
//
#include "hw_config.h"
#include "sdram.h"
#include "emulator.h"

#include "hardware/vreg.h"

#include "bsp/board.h"
#include "tusb.h"

const char ramFilename[] = "0:ram.bin";
#ifdef RUN_LINUX
const char *const imageFilename = "0:Image";
#else
const char *const imageFilename = "0:baremetal.bin";
#endif

#define IO_QUEUE_LEN 50

queue_t screen_queue, kb_queue;

void cdc_task(void);
void core1_entry();

int main()
{
	vreg_set_voltage(VREG_VOLTAGE_1_25); // overvolt the core just a bit
	set_sys_clock_khz(180000, true);	 // overclock to 200MHz (from 125MHz)
	sleep_ms(5);

	//	 stdio_init_all();
	// stdio_uart_init_full(uart0, 115200, 0, 1);
	tusb_init();
	time_init();

	queue_init(&screen_queue, sizeof(char), IO_QUEUE_LEN);
	queue_init(&kb_queue, sizeof(char), IO_QUEUE_LEN);

	multicore_reset_core1();
	multicore_fifo_drain();
	multicore_launch_core1(core1_entry);

	while (true)
	{
		tud_task();

		cdc_task();
	}
}

void core1_entry()
{
	sd_card_t *pSD0 = sd_get_by_num(0);
	FRESULT fr = f_mount(&pSD0->fatfs, pSD0->pcName, 1);
	if (FR_OK != fr)
		panic("f_mount error: %s (%d)\n", FRESULT_str(fr), fr);

	fr = openSDRAMfile(ramFilename, ram_amt);
	if (FR_OK != fr && FR_EXIST != fr)
		panic("Error opening RAM file: %s (%d)\n", ramFilename, FRESULT_str(fr), fr);
	printf("RAM file opened sucessfuly!\n");

	fr = loadFileIntoRAM(imageFilename, 0);
	if (FR_OK != fr)
		panic("Error loading image: %s (%d)\n", FRESULT_str(fr), fr);
	printf("Image loaded sucessfuly!\n");

	rvEmulator();

	fr = closeSDRAMfile();
	if (FR_OK != fr)
		printf("Error closing RAM file: %s (%d)\n", FRESULT_str(fr), fr);
	f_unmount(pSD0->pcName);

	puts("Goodbye, world!");
	for (;;)
		;
}

uint8_t buf[64];
void cdc_task(void)
{

	while (!queue_is_empty(&screen_queue))
	{
		uint8_t c;
		queue_remove_blocking(&screen_queue, &c);
		tud_cdc_write_char(c);
	}
	

	if(tud_cdc_available())
	{
		
        uint32_t count = tud_cdc_read(buf, sizeof(buf));

		for(int i=0; i<count; i++)
		{
			queue_try_add(&kb_queue, buf[i]);
			//tud_cdc_write_char(buf[i]);
		}

	}

	tud_cdc_write_flush();

}