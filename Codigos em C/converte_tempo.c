#include <stdio.h>
#include <string.h>
#include <math.h>
#include <stdlib.h>

int main() {
	int segundo;
	scanf("%d", &segundo);
	int horas, minutos, segundos;    
	horas=segundo/3600;
	segundo%=3600;
	minutos=segundo/60;
	segundos=segundo%60;
	printf("%d:%d:%d", horas, minutos, segundos);
	return 0;
}
