#define SNAPSHOT_FILENAME "SNAP"

#define KERNEL_FILENAME "IMAGE"
#define BLK_FILENAME "ROOTFS"
#define DTB_FILENAME "DTB"

// Device tree binary size
#define DTB_SIZE 2048

// RAM size in megabytes
#define EMULATOR_RAM_MB 8

// Kernel command line
#define KERNEL_CMDLINE "console=hvc0 root=fe00"

// Time divisor
#define EMULATOR_TIME_DIV 1

// Tie microsecond clock to instruction count
#define EMULATOR_FIXED_UPDATE 0

// Time divisor
#define EMULATOR_TIME_DIV 1

// Tie microsecond clock to instruction count
#define EMULATOR_FIXED_UPDATE 0

// Cache configuration
#define CACHE_LINE_SIZE 16
#define OFFSET_BITS 4 // log2(CACHE_LINE_SIZE)
#define CACHE_SET_SIZE 4096
#define INDEX_BITS 12 // log2(CACHE_SET_SIZE)
