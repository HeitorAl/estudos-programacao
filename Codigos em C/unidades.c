#include <stdio.h>
#include <string.h>
#include <math.h>
#include <stdlib.h>

int main() {
	int N;
	scanf("%d", &N);
	int unidade=N%10;
	if (abs(N)>10) {
	printf("%d", unidade);
	} else if (0<=abs(N)<10) {
	printf("%d", N);
	} else if (-10<abs(N)<0) {
	printf("-%d", N);
	} else {
	printf("-%d", unidade);
	} return 0;
}
