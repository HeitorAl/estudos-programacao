#include <stdio.h>
#include <string.h>
#include <math.h>
#include <stdlib.h>

int main() {
	int distancia; float combustivel;
	scanf("%d\n%f", &distancia, &combustivel);
	double total=distancia/combustivel;
	printf("%.3f km/l", total);    
	return 0;
}
