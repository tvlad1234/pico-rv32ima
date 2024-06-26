TARGET = hello_linux
all : $(TARGET)

PREFIX:=../buildroot/output/host/bin/riscv32-buildroot-linux-uclibc-
CC:=$(PREFIX)gcc
OBJDUMP:=$(PREFIX)objdump

# Note:  regymm says to do -fPIE -pie -static, instead of -fPIC
CFLAGS:=-mabi=ilp32 -fPIE -pie -static -march=rv32ima -Os -s -g -ffunction-sections -fdata-sections
LDFLAGS:=-Wl,-elf2flt=-r -Wl,-gc-sections

C_S+=hello_linux.c

$(TARGET) : $(TARGET).c
	$(CC) $(CFLAGS) $(C_S) $(LDFLAGS) -o $@
	$(OBJDUMP) -S $@.gdb > $@.S

deploy : $(TARGET)
	cp $^ ../buildroot/output/target/root

clean :
	rm -rf $(TARGET) $(TARGET).gdb $(TARGET).S
