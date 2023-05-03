#ifndef _EMULATOR_H
#define _EMULATOR_H

#include <stdint.h>

enum emulatorCode{
    EMU_POWEROFF,
    EMU_REBOOT,
    EMU_UNKNOWN
};

int rvEmulator();

#endif