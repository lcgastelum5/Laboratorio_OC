#include <stdint.h>
#include <stdio.h>

extern uint32_t NotBit32b(uint32_t dato, uint8_t numbit);
extern uint32_t XchgBits(uint32_t dato, uint8_t bit1, uint8_t bit2);
extern int str_cnt_chr(char *str, char letra);
extern uint8_t isPrime(uint32_t dato);
extern int shr_s(int dato);

int main()
{
	uint32_t x = 0x00123456;
	x = NotBit32b(x,1);
	printf("%d\n", x);

	x = 0x00123456;
	x = XchgBits(x,1,3);
	printf("%d\n", x);
	
	char str[]="Hola Mundo";
	x = str_cnt_chr(str, 'o');
	printf("%d\n", x);

	uint8_t y = isPrime(3);
	printf("%d\n", y);

	int a = -126;
	int b = shr_s(a);
	printf("%d\n", b);

return 0;
}