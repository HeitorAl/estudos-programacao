#include <stdio.h>
#include <string.h>
#include <math.h>
#include <stdlib.h>


#define MAX 10000

int main() {
    /* Enter your code here. Read input from STDIN. Print output to STDOUT */  
    int n;
    scanf("%d", &n);

    while (n > 0) {

        char palavra[MAX], impar[MAX], par[MAX];
        scanf("%s", palavra);

        int tamanho = strlen(palavra);
        int parIndex = 0, imparIndex = 0;

        for (int i = 0; i < tamanho; i++) {
            if (i % 2 == 0) {
                par[parIndex++] = palavra[i];
            } else {
                impar[imparIndex++] = palavra[i];
            }
        }

        par[parIndex] = '\0';
        impar[parIndex] = '\0';

        printf("%s %s\n", par, impar);
        n--;
    }
    return 0;
}
