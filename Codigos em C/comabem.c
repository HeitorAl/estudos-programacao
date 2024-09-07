#include <stdio.h>
#include <string.h>
#include <math.h>
#include <stdlib.h>

int main() {
	float gasto;
	scanf("%f", &gasto);
	float garcom=gasto+gasto*0.1;
	printf("%.2f", garcom);    
	return 0;
}
