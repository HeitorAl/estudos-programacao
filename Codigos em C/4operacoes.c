#include <stdio.h>
#include <string.h>
#include <math.h>
#include <stdlib.h>

int main() {
	double x, y;
	scanf("%lf\n%lf", &x, &y);
	double soma=x+y, subtracao=x-y, multiplicacao=x*y, divisao=x/y;
	printf("%.2f\n%.2f\n%.2f\n%.2f", soma, subtracao, multiplicacao, divisao);    
	return 0;
}
