add_library(ps2
	ps2.c
)

target_include_directories(ps2 PUBLIC
	.
)

target_link_libraries(ps2 pico_stdlib)