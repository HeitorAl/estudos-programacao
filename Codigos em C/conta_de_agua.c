#include <stdio.h>
#include <string.h>
#include <math.h>
#include <stdlib.h>

int main() {
	int consumo_agua, conta_agua=10;
	printf("Quanto de agua foi consumido no mes? (em m3)\n");
	scanf("%d", &consumo_agua);
	if ((30 >= consumo_agua) && (consumo_agua > 10)) {
	conta_agua = consumo_agua;
	} else if ((70 >= consumo_agua) && (consumo_agua > 30)) {
	conta_agua += 20 + (consumo_agua - 30)*2;
	} else if (consumo_agua > 70) {
	conta_agua += 20 + 80 + (consumo_agua - 70)*5;
	}
	printf("Esse eh o valor da sua conta de agua: R$%d,00", conta_agua);
	return 0;
}
