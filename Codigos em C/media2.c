#include <stdio.h>
#include <string.h>
#include <math.h>
#include <stdlib.h>

int main() {
	float a, b, c;
	scanf("%f\n%f\n%f", &a, &b, &c);
	float media=(a*2 + b*3 + c*5)/(2+3+5);
	printf("MEDIA = %.1f", media);
	return 0;
}
