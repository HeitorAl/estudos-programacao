#include <stdio.h>
#include <string.h>
#include <math.h>
#include <stdlib.h>

int main() {
    int i = 4;
    double d = 4.0;
    char s[] = "HackerRank ";

    
    // Declare second integer, double, and String variables.
    int inteiro;
    double dobro;
    char str[50];

    // Read and save an integer, double, and String to your variables.
    scanf("%d\n%lf\n", &inteiro, &dobro);
    scanf("%[^\n]", str);

    // Print the sum of both integer variables on a new line.
    int sum = inteiro + i;

    // Print the sum of the double variables on a new line.
    double soma = dobro + d;

    // Concatenate and print the String variables on a new line
    // The 's' variable above should be printed first.
    printf("%d\n%.1f\n%s%s", sum, soma, s, str);
    return 0;
}
