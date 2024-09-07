#include <stdio.h>
#include <string.h>
#include <math.h>
#include <stdlib.h>

int main() {
	int n;
	scanf("%d", &n);
	for(int i=1; i!=10; i++){
	int tab=n*i;
	printf("%d X %d = %d\n", n, i, tab);
	}    
	return 0;
}
