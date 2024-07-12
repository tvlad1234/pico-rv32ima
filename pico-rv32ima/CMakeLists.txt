add_subdirectory(petitfatfs)
add_subdirectory(vga)
add_subdirectory(ps2)

add_executable(pico-rv32ima
    main.c
	psram.c
	cache.c
	console.c
	terminal.c
	emulator.c
	get_serial.c
	usb_descriptors.c
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
	tinyusb_device 
	tinyusb_board
	petitfatfs
	vga
	ps2

)

target_include_directories(pico-rv32ima PUBLIC ${CMAKE_CURRENT_LIST_DIR}/tusb_inc )

pico_define_boot_stage2(slower_boot2 ${PICO_DEFAULT_BOOT_STAGE2_FILE})
target_compile_definitions(slower_boot2 PRIVATE PICO_FLASH_SPI_CLKDIV=4)
pico_set_boot_stage2(pico-rv32ima slower_boot2)

pico_set_binary_type(pico-rv32ima copy_to_ram)
pico_add_extra_outputs(pico-rv32ima)

