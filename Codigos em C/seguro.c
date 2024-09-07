#include <stdlib.h>
#include <math.h>
#include <string.h>
#include <stdio.h>

int main() {
	int gen, idade;
	scanf("%d\n%d", &gen, &idade);
	if ((gen==0) && (idade==1)) {
	printf("%d", 1);
	} else {
	printf("%d", 0);
	}
	return 0;
}
