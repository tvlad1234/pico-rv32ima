#include <stdio.h>
#include <stdlib.h>
//
#include "pico/stdlib.h"
//
#include "ff.h"
#include "rtc.h"
//
#include "hw_config.h"
#include "sdram.h"
#include "emulator.h"

#include "hardware/vreg.h"

const char ramFilename[] = "0:ram.bin";
#ifdef RUN_LINUX
const char *const imageFilename = "0:Image";
#else
const char *const imageFilename = "0:baremetal.bin";
#endif

int main()
{
	// vreg_set_voltage(VREG_VOLTAGE_1_25); // overvolt the core just a bit
	// set_sys_clock_khz(170000, true);	 // overclock to 200MHz (from 125MHz)
	// sleep_ms(5);

	// stdio_init_all();
	stdio_uart_init_full(uart0, 115200, 0, 1);
	time_init();

	// while (!stdio_usb_connected())
	//	tight_loop_contents();

	puts("Hello, world!");

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

	printf("\nStarting emulator!\n\n");
	rvEmulator();

	fr = closeSDRAMfile();
	if (FR_OK != fr)
		printf("Error closing RAM file: %s (%d)\n", FRESULT_str(fr), fr);
	f_unmount(pSD0->pcName);

	puts("Goodbye, world!");
	for (;;)
		;
}
