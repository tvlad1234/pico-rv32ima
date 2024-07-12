add_library(vga
	vga.c
)

target_include_directories(vga PUBLIC
	.
	pio
)

target_link_libraries(vga pico_stdlib hardware_pio hardware_dma)