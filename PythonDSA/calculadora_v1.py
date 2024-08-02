# Calculadora em Python

# Desenvolva uma calculadora em Python com tudo que você aprendeu nos capítulos até aqui no curso. 
# A solução será apresentada no próximo capítulo!
def soma2(num1, num2):
    resultado = num1 + num2
    print(f"\n\n{num1} + {num2} = {resultado}\n\n")

def subtracao2(num1, num2):
    resultado = num1 - num2
    print(f"\n\n{num1} - {num2} = {resultado}\n\n")

def multiplicacao2(num1, num2):
    resultado = num1*num2
    print(f"\n\n{num1} * {num2} = {resultado}\n\n")

def divisao2(num1, num2):
    resultado = num1/num2
    print(f"\n\n{num1} / {num2} = {resultado}\n\n")

def calculadora(operacao, valor1, valor2):
    if operacao == 1:
        soma2(valor1, valor2)
    elif operacao == 2:
        subtracao2(valor1, valor2)
    elif operacao == 3:
        multiplicacao2(valor1, valor2)
    else:
        divisao2(valor1, valor2)
    return



print("\n******************* Calculadora em Python *******************")

print("\nSelecione o número da operação desejada:\n\n1 - Soma\n\n2 - Subtração\n\n3 - Multiplicação\n\n4 - Divisão")

n_operacao = int(input("\nDigite sua operação (1/2/3/4):"))
n1 = int(input("\nDigite o primeiro número:"))
n2 = int(input("\nDigite o segundo número:"))

calculadora(n_operacao, n1, n2)
