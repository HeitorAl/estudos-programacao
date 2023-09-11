using System;
using System.Collections.Generic;
using System.IO;
class Solution {
    static void Main(String[] args) {
    
    /* Enter your code here. Read input from STDIN. Print output to STDOUT. Your class should be named Solution */
    int n = int.Parse(Console.ReadLine());

    while (n > 0) {
        string palavra = Console.ReadLine(), impar = "", par = "";
        int tamanho = palavra.Length;
        for (int i = 0; i < tamanho; i++) {
            if (i % 2 == 0) {
                par += palavra[i];
            }
            if (i % 2 != 0) {
                impar += palavra[i];
            }
        }
        Console.WriteLine($"{par} {impar}");
        n--;
    }
    }
}