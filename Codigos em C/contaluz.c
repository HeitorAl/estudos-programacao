#include <stdio.h>
#include <string.h>
#include <math.h>
#include <stdlib.h>

#define pi 3.1416

int main() {
	double KWh;
	scanf("%lf", &KWh);
	double valor_total=KWh*1.50, valor_desconto = valor_total-valor_total*0.15;
	printf("Valor a ser pago: R$ %.2f reais\nValor a ser pago com desconto: R$ %.2f reais", valor_total, valor_desconto);
        return 0;
}
