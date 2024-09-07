#include <stdio.h>
#include <string.h>
#include <math.h>
#include <stdlib.h>

int main() {
	int dias, km;
	scanf("%d\n%d", &dias, &km);
	float diaria=dias*90;
	if (km>=dias*100){
	float valor=(km-100*dias)*12;
	printf("%.2f", diaria+valor);
	} else {
	printf("%.2f", diaria);
	}
	return 0;
}
