#include <stdio.h>

extern int suma (int a, int b);
extern int strleng (char *str);
extern int getBit(int valor, int numbit);

int main()
{

int a=2;
int b=3;

char str[]="Hola mundo";

int valor= 9;
int numbit=3;

int total= suma(a, b);
printf("%d\n", total);

int cantidad= strleng(str);
printf("%d\n", cantidad);

int res= getBit(valor, numbit);
printf("%d\n", res);

return 0;
}