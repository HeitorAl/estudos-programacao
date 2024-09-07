#include <stdio.h>
#include <string.h>
#include <math.h>
#include <stdlib.h>

int main() {
        float aguam3, custo_litro;
        scanf("%f %f", &aguam3, &custo_litro);
	float valor_agua=1000*aguam3*custo_litro, valor_esgoto=valor_agua*0.8, valor_total=valor_agua+valor_esgoto;
	printf("%.2f\n%.2f\n%.2f", valor_agua, valor_esgoto, valor_total);
        return 0;
}
