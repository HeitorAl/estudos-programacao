#include <stdio.h>
#include <string.h>
#include <math.h>
#include <stdlib.h>

int main() {
    float a, b, c;
    scanf("%f", &a);
    scanf("%f", &b);
    scanf("%f", &c);

    float media = (a + b + c) / 3;

    if (a == b && b == c && c == media) {
        printf("0\n");
    } else if (a < media && b < media && c < media) {
        printf("0\n");
    } else if ((a > media && b < media && c < media) || (b > media && a < media && c < media) || (c > media && b < media && a < media)) {
        printf("1\n");
    } else {
        printf("2\n");
    }
        return 0;
}
