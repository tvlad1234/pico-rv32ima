add_executable(pico-rv32ima
    main.c
	hw_config.c
	sdram.c
	emulator.c
	usb_descriptors.c
    tusb_callbacks.c
)

# Add the standard library and FatFS/SPI to the build
target_link_libraries(pico-rv32ima
	pico_stdlib 
	FatFs_SPI 
	pico_time
	pico_multicore
	hardware_vreg
	tinyusb_device 
	tinyusb_board)

	target_include_directories(pico-rv32ima PUBLIC ${CMAKE_CURRENT_LIST_DIR}/tusb_inc )

pico_enable_stdio_uart(pico-rv32ima 0)
pico_enable_stdio_usb(pico-rv32ima 0)


pico_set_binary_type(pico-rv32ima copy_to_ram)

pico_add_extra_outputs(pico-rv32ima)

