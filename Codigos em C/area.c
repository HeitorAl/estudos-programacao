#include <stdio.h>
#include <string.h>
#include <math.h>
#include <stdlib.h>

#define pi 3.14159

int main() {
   	double a, b, c;
	scanf("%lf %lf %lf", &a, &b, &c);
	double area_triangulo=a*c/2, area_circulo=pi*pow(c, 2), area_trapezio=(a+b)*c/2, area_quadrado=b*b, area_retangulo=a*b;
	printf("TRIANGULO: %.3f\nCIRCULO: %.3f\nTRAPEZIO: %.3f\nQUADRADO: %.3f\nRETANGULO: %.3f", area_triangulo, area_circulo, area_trapezio, area_quadrado, area_retangulo); 
	return 0;
}
