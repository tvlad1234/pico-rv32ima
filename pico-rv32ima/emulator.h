#ifndef _EMULATOR_H
#define _EMULATOR_H

#include <stdint.h>

#define RUN_LINUX
#define RAM_MB 16

extern uint32_t ram_amt;
void rvEmulator();

#endif