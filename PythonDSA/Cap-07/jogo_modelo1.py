"""Módulos para o jogo da forca"""
from os import system
import unicodedata
import random


def remove_acentos(palavra):
    """Essa função irá normalizar
    totalmente a palavra secreta"""
    norm = unicodedata.normalize('NFKD', palavra)
    return "".join([c for c in norm if not unicodedata.combining(c)])


def atualiza_ps(ps, p, letra, string):
    """Essa função irá atualizar
    a string de underlines a ser
    printada"""
    string = string.split(' ')
    for i, char in enumerate(p):
        if letra == char:
            string[i] = ps[i]
    return ' '.join(string)


def limpa_tela():
    """Essa função irá limpar
    a tela do terminal"""
    _ = system('cls')


def jogo():
    """Essa é a função main do programa,
    este será o jogo da forca"""

    limpa_tela()
    print("Bem-vindo ao jogo da forca")
    print("Adivinhe a palavra:\n")
    lista_palavras = ['casa', 'sol', 'lua', 'gato', 'cão', 'bola',
                      'pé', 'mão', 'água', 'ar', 'árvore', 'nuvem',
                      'janela', 'porta', 'lápis', 'livro', 'computador',
                      'bicicleta', 'montanha', 'oceano', 'quiabo',
                      'xícara', 'xadrez', 'bússola', 'girassol', 'melancia',
                      'abacaxi', 'escafandro', 'hipopótamo', 'psicologia']

    regex = r"[ !@#$%^&*()_+-=[]{}|;:<>,./?]"
    secret_word = random.choice(lista_palavras)
    normal_word = remove_acentos(secret_word)
    erros = 0
    letras_corretas = []
    letras_usadas = []
    letras_erradas = []
    limite_erros = 6
    forca = "_ "*len(secret_word)

    while erros < limite_erros:
        print('\n' + forca + '\n')
        print(f"Chances restantes: {limite_erros - erros}")
        print('Letras erradas: ', ' '.join(letras_erradas))
        chute = input("\nDigite uma letra: ").lower()[0]
        if chute in regex:
            print("\nEsse caracter não é aceito")
            continue

        forca = atualiza_ps(secret_word, normal_word, chute, forca)
        if chute not in letras_usadas:
            letras_usadas.append(chute)

            if chute in normal_word:
                letras_corretas.append(list(normal_word).count(chute))

                if sum(letras_corretas) == len(secret_word):
                    limpa_tela()
                    print(f'\n{secret_word}\n')
                    print('Letras testadas:', ' '.join(letras_usadas))
                    print("Você venceu!\n")
                    return

            else:
                erros += 1
                letras_erradas.append(chute)
                continue

        else:
            print("\nVocê já chutou esta letra! Tente outra letra\n")
            continue

    limpa_tela()
    print(f'\n{secret_word}\n')
    print('Letras testadas:', ' '.join(letras_usadas))
    print("Você perdeu!\n")
    return


jogo()
