#include <stdio.h>
#include <string.h>
#include <math.h>
#include <stdlib.h>

int main() {
	char tipo; double a, b, c;
	scanf("%c\n%lf\n%lf\n%lf", &tipo, &a, &b, &c);
	if (tipo==65) {
	double media_a=(a+b+c)/3;
	printf("%.3f", media_a);
	} else if (tipo==72) {
	double media_har=3/((1/a)+(1/b)+(1/c));
	printf("%.3f", media_har);
	} else if (tipo==71) {
	double m=a*b*c, media_geo=pow(m, 1.0/3);
	printf("%.3f", media_geo);
	}    
	return 0;
}
