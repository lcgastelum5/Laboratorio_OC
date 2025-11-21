#include <stdint.h>
#include <stdio.h>

extern void pBin8b(uint8_t dato1);
extern void pBin16b(uint16_t dato2);
extern void pBin32b(uint32_t dato3);
extern void pBin64b(uint64_t dato4);


int main()
{


	uint8_t dato1=2;
	pBin8b(dato1);
	printf("\n");

	uint16_t dato2=3;
	pBin16b(dato2);
	printf("\n");

	uint32_t dato3=4;
	pBin32b(dato3);
	printf("\n");

	uint64_t dato4=5;
	pBin64b(dato4);
	printf("\n");


return 0;
}