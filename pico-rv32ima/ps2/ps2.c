#include "ps2.h"
#include "pico/stdlib.h"

#include "hardware/gpio.h"

#define BUFFER_SIZE 45

#define BREAK 0x01
#define MODIFIER 0x02
#define SHIFT_L 0x04
#define SHIFT_R 0x08
#define ALTGR 0x10
#define CTRL_L 0x20

int ps2DataPin;
int ps2ClkPin;

volatile uint8_t buffer[BUFFER_SIZE];
volatile uint8_t head = 0, tail = 0;
uint16_t CharBuffer = 0;
uint8_t UTF8next = 0;
PS2Keymap_t *keymap = &PS2Keymap_US;

uint8_t ctrl_pressed = 0;

const PS2Keymap_t PS2Keymap_US = {
	// without shift
	{0, PS2_F9, 0, PS2_F5, PS2_F3, PS2_F1, PS2_F2, PS2_F12,
	 0, PS2_F10, PS2_F8, PS2_F6, PS2_F4, PS2_TAB, '`', 0,
	 0, 0 /*Lalt*/, 0 /*Lshift*/, 0, 0 /*Lctrl*/, 'q', '1', 0,
	 0, 0, 'z', 's', 'a', 'w', '2', 0,
	 0, 'c', 'x', 'd', 'e', '4', '3', 0,
	 0, ' ', 'v', 'f', 't', 'r', '5', 0,
	 0, 'n', 'b', 'h', 'g', 'y', '6', 0,
	 0, 0, 'm', 'j', 'u', '7', '8', 0,
	 0, ',', 'k', 'i', 'o', '0', '9', 0,
	 0, '.', '/', 'l', ';', 'p', '-', 0,
	 0, 0, '\'', 0, '[', '=', 0, 0,
	 0 /*CapsLock*/, 0 /*Rshift*/, PS2_ENTER /*Enter*/, ']', 0, '\\', 0, 0,
	 0, 0, 0, 0, 0, 0, PS2_BACKSPACE, 0,
	 0, '1', 0, '4', '7', 0, 0, 0,
	 '0', '.', '2', '5', '6', '8', PS2_ESC, 0 /*NumLock*/,
	 PS2_F11, '+', '3', '-', '*', '9', PS2_SCROLL, 0,
	 0, 0, 0, PS2_F7},
	// with shift
	{0, PS2_F9, 0, PS2_F5, PS2_F3, PS2_F1, PS2_F2, PS2_F12,
	 0, PS2_F10, PS2_F8, PS2_F6, PS2_F4, PS2_SHIFT_TAB, '~', 0,
	 0, 0 /*Lalt*/, 0 /*Lshift*/, 0, 0 /*Lctrl*/, 'Q', '!', 0,
	 0, 0, 'Z', 'S', 'A', 'W', '@', 0,
	 0, 'C', 'X', 'D', 'E', '$', '#', 0,
	 0, ' ', 'V', 'F', 'T', 'R', '%', 0,
	 0, 'N', 'B', 'H', 'G', 'Y', '^', 0,
	 0, 0, 'M', 'J', 'U', '&', '*', 0,
	 0, '<', 'K', 'I', 'O', ')', '(', 0,
	 0, '>', '?', 'L', ':', 'P', '_', 0,
	 0, 0, '"', 0, '{', '+', 0, 0,
	 0 /*CapsLock*/, 0 /*Rshift*/, PS2_ENTER /*Enter*/, '}', 0, '|', 0, 0,
	 0, 0, 0, 0, 0, 0, PS2_BACKSPACE, 0,
	 0, '1', 0, '4', '7', 0, 0, 0,
	 '0', '.', '2', '5', '6', '8', PS2_ESC, 0 /*NumLock*/,
	 PS2_F11, '+', '3', '-', '*', '9', PS2_SCROLL, 0,
	 0, 0, 0, PS2_F7},
	0};

void ps2_gpio_callback(uint gpio, uint32_t events)
{
	if (gpio == ps2ClkPin)
	{
		static uint8_t bitcount = 0;
		static uint8_t incoming = 0;
		static uint32_t prev_ms = 0;
		uint32_t now_ms;
		uint8_t n, val;

		val = gpio_get(ps2DataPin);

		now_ms = to_ms_since_boot(get_absolute_time());

		if (now_ms - prev_ms > 250)
		{
			bitcount = 0;
			incoming = 0;
		}
		prev_ms = now_ms;

		n = bitcount - 1;
		if (n <= 7)
		{
			incoming |= (val << n);
		}
		bitcount++;
		if (bitcount == 11)
		{
			uint8_t i = head + 1;
			if (i >= BUFFER_SIZE)
				i = 0;
			if (i != tail)
			{
				buffer[i] = incoming;
				head = i;
			}
			bitcount = 0;
			incoming = 0;
		}
	}
}

uint8_t get_scan_code(void)
{
	uint8_t c, i;

	i = tail;
	if (i == head)
		return 0;
	i++;
	if (i >= BUFFER_SIZE)
		i = 0;
	c = buffer[i];
	tail = i;
	return c;
}

char get_iso8859_code(void)
{
	static uint8_t state = 0;
	uint8_t s;
	char c;

	while (1)
	{
		s = get_scan_code();
		if (!s)
			return 0;
		if (s == 0xF0)
		{
			state |= BREAK;
		}
		else if (s == 0xE0)
		{
			state |= MODIFIER;
		}
		else
		{
			if (state & BREAK)
			{
				if (s == 0x12)
				{
					state &= ~SHIFT_L;
				}
				else if (s == 0x59)
				{
					state &= ~SHIFT_R;
				}
				else if (s == 0x14)
				{
					state &= ~CTRL_L;
				}
				else if (s == 0x11 && (state & MODIFIER))
				{
					state &= ~ALTGR;
				}
				// CTRL, ALT & WIN keys could be added
				// but is that really worth the overhead?
				state &= ~(BREAK | MODIFIER);
				continue;
			}
			if (s == 0x12)
			{
				state |= SHIFT_L;
				continue;
			}
			else if (s == 0x59)
			{
				state |= SHIFT_R;
				continue;
			}
			else if (s == 0x14)
			{
				state |= CTRL_L;
				continue;
			}
			else if (s == 0x11 && (state & MODIFIER))
			{
				state |= ALTGR;
			}
			c = 0;
			if (state & MODIFIER)
			{
				switch (s)
				{
				case 0x70:
					c = PS2_INSERT;
					break;
				case 0x6C:
					c = PS2_HOME;
					break;
				case 0x7D:
					c = PS2_PAGEUP;
					break;
				case 0x71:
					c = PS2_DELETE;
					break;
				case 0x69:
					c = PS2_END;
					break;
				case 0x7A:
					c = PS2_PAGEDOWN;
					break;
				case 0x75:
					c = PS2_UPARROW;
					break;
				case 0x6B:
					c = PS2_LEFTARROW;
					break;
				case 0x72:
					c = PS2_DOWNARROW;
					break;
				case 0x74:
					c = PS2_RIGHTARROW;
					break;
				case 0x4A:
					c = '/';
					break;
				case 0x5A:
					c = PS2_ENTER;
					break;
				default:
					break;
				}
			}
			else if ((state & ALTGR) && keymap->uses_altgr)
			{
				if (s < PS2_KEYMAP_SIZE)
					c = keymap->altgr[s]; // pgm_read_byte(keymap->altgr + s);
			}
			else if (state & (SHIFT_L | SHIFT_R))
			{
				if (s < PS2_KEYMAP_SIZE)
					c = keymap->shift[s]; // pgm_read_byte(keymap->shift + s);
			}
			else
			{
				if (s < PS2_KEYMAP_SIZE)
					c = keymap->noshift[s]; // pgm_read_byte(keymap->noshift + s);
			}

			if (state & CTRL_L)
				ctrl_pressed = 1;
			else
				ctrl_pressed = 0;
			state &= ~(BREAK | MODIFIER);
			if (c)
				return c;
		}
	}
}

uint8_t PS2_keyAvailable(void)
{
	if (CharBuffer || UTF8next)
		return 1;
	CharBuffer = get_iso8859_code();
	if (CharBuffer)
		return 1;
	return 0;
}

uint16_t PS2_readKey()
{
	uint16_t result;

	result = UTF8next;
	if (result)
	{
		UTF8next = 0;
	}
	else
	{
		result = CharBuffer;
		if (result)
		{
			CharBuffer = 0;
			if (ctrl_pressed)
				result |= 0x100;
			ctrl_pressed = 0;
		}
		else
		{
			result = get_iso8859_code();
			if (ctrl_pressed)
				result |= 0x100;
			ctrl_pressed = 0;
		}
		/*
		if (result >= 128)
		{
			UTF8next = (result & 0x3F) | 0x80;
			result = ((result >> 6) & 0x1F) | 0xC0;
		}
		*/
	}
	if (!result)
		return -1;
	return result;
}

void PS2_init(int d, int c)
{
	ps2DataPin = d;
	ps2ClkPin = c;
	gpio_init(ps2DataPin);
	gpio_init(ps2ClkPin);
	gpio_set_dir(ps2DataPin, GPIO_IN);
	gpio_set_dir(ps2ClkPin, GPIO_IN);
	gpio_set_pulls(ps2ClkPin, false, true);
	gpio_set_pulls(ps2DataPin, false, true);

	gpio_set_irq_enabled_with_callback(ps2ClkPin, GPIO_IRQ_EDGE_FALL, true, &ps2_gpio_callback);
}

void PS2_selectKeyMap(PS2Keymap_t *km)
{
	keymap = km;
}