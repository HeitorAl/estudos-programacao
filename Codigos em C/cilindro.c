#include <stdio.h>
#include <string.h>
#include <math.h>
#include <stdlib.h>

#define pi 3.14

int main() {
	double h, r;
	scanf("%lf\n%lf", &h, &r);
	double volume=pi*pow(r, 2)*h, area=2*pi*r*h+2*pi*pow(r, 2);
	printf("%.2f\n%.2f", volume, area);
	return 0;
}
