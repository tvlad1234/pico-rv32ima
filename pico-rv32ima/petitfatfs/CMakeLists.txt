add_library(petitfatfs
	pff.c
    mmcbbp.c
)

target_include_directories(petitfatfs PUBLIC
	.
)

target_link_libraries(petitfatfs pico_stdlib hardware_spi)