#include <stdio.h>
#include <string.h>
#include <math.h>
#include <stdlib.h>

int main() {
	float base_menor, base_maior, altura;
	scanf("%f\n%f\n%f", &base_menor, &base_maior, &altura);
	float area_trapezio=(base_menor+base_maior)*altura/2;
	printf("%.1f", area_trapezio);    
	return 0;
}
