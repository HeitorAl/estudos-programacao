#include <stdio.h>
#include <string.h>
#include <math.h>
#include <stdlib.h>

int main() {
	char nome[1000], atracao[1000];
	fgets(nome, 1000, stdin);
	nome[strcspn(nome, "\n")] = '\0';
	fgets(atracao, 1000, stdin);
	atracao[strcspn(atracao, "\n")] = '\0';	
	printf("Bem-vindo %s! Aguardamos você na/o %s!", nome, atracao);    
	return 0;
}
