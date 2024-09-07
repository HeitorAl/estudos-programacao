#include <stdio.h>
#include <string.h>
#include <math.h>
#include <stdlib.h>



int main() {
	double pi=3.14159;
	double r;
	scanf("%lf", &r);
	r=r/100;
	double area=pi*pow(r, 2.0);
	printf("Area = %.4f", area);
	return 0;
}
