#include <stdio.h>
#include <string.h>
#include <math.h>
#include <stdlib.h>

int main() {
	float salario, percentual;
	scanf("%f\n%f", &salario, &percentual);
	float aumento=salario+salario*(percentual/100);
	printf("Seu salario teve aumento de %.1f %, passando de R$ %.1f para R$ %.1f", percentual, salario, aumento);
	return 0;
}
