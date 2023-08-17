#include <stdio.h>
#include <string.h>
#include <math.h>
#include <stdlib.h>

int main() {
	float l, c, a;
	scanf("%f\n%f\n%f", &l, &c, &a);
	if ((l<=45) && (c<=56) && (a<=25)) {
	printf("PERMITIDA");
	} else {
	printf("PROIBIDA");
	}
	return 0;
}
