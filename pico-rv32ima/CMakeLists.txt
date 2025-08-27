add_executable(pico-rv32ima
    main.c
	usb/get_serial.c
	usb/usb_descriptors.c
	console/console.c
	console/terminal/terminal.c
	console/vga/vga.c
	console/ps2/ps2.c
	../tiny-rv32ima/psram/psram.c
	../tiny-rv32ima/emulator/emulator.c
	../tiny-rv32ima/cache/cache.c
	../tiny-rv32ima/pff/pff.c
	../tiny-rv32ima/pff/mmcbbp.c
)

# Add the standard library and FatFS/SPI to the build
target_link_libraries(pico-rv32ima
	pico_stdlib 
	pico_time
	pico_multicore
	pico_unique_id
	hardware_vreg
	hardware_spi
	hardware_clocks
	hardware_pio
	hardware_dma
	tinyusb_device 
	tinyusb_board
)

target_include_directories(pico-rv32ima PUBLIC 
	.
	hal
	usb
	console
	../tiny-rv32ima
)

pico_define_boot_stage2(slower_boot2 ${PICO_DEFAULT_BOOT_STAGE2_FILE})
target_compile_definitions(slower_boot2 PRIVATE PICO_FLASH_SPI_CLKDIV=4)
pico_set_boot_stage2(pico-rv32ima slower_boot2)

pico_set_binary_type(pico-rv32ima copy_to_ram)
pico_add_extra_outputs(pico-rv32ima)

