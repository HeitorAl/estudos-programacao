#include <stdio.h>
#include <string.h>
#include <math.h>
#include <stdlib.h>

#define pi 3.1416

int main() {
	double r;
	scanf("%lf", &r);
	double volume=(4*pi*pow(r, 3))/3;
	printf("%.2f", volume);    
	return 0;
}
