#include <stdio.h>
#include <string.h>
#include <math.h>
#include <stdlib.h>

int main() {
	float fahrenheit;
	scanf("%f", &fahrenheit);
	float celcius=(fahrenheit-32)/1.8;
	printf("%.2f", celcius);    
	return 0;
}
