# Hangman Game (Jogo da Forca) 
# Programação Orientada a Objetos

# Import
import random
from os import system

# Board (tabuleiro)
board = ['''

>>>>>>>>>>Hangman<<<<<<<<<<

+---+
|   |
    |
    |
    |
    |
=========''', '''

+---+
|   |
O   |
    |
    |
    |
=========''', '''

+---+
|   |
O   |
|   |
    |
    |
=========''', '''

 +---+
 |   |
 O   |
/|   |
     |
     |
=========''', r'''

 +---+
 |   |
 O   |
/|\  |
     |
     |
=========''', r'''

 +---+
 |   |
 O   |
/|\  |
/    |
     |
=========''', r'''

 +---+
 |   |
 O   |
/|\  |
/ \  |
     |
=========''']


# Classe
class Hangman:

	# Método Construtor
    def __init__(self, palavras):
        self.palavra = random.choice(palavras).lower()
        self.letras_corretas = ["_" for _ in self.palavra]
        self.letras_erradas = []
        self.tentativas = 0
        self.max_tentativas = 6
        self.hangman = board

    # Método para limpar a tela
    def limpa_tela(self):
        _ = system("cls")

	# Método para adivinhar a letra
    def guess(self):
        letra = input("Digite uma letra: ").lower()
        if letra in self.letras_corretas or letra in self.letras_erradas:
            print("\nVocê já tentou essa letra!\n")
            return False

        if letra in self.palavra:
            for i, l in enumerate(self.palavra):
                if letra == l:
                    self.letras_corretas[i] = letra

        else:
            print(f"Letra {letra} não está na palavra")
            self.letras_erradas.append(letra)
            self.tentativas += 1
        return True

	# Método para verificar se o jogo terminou
    def hangman_over(self):
        return self.hangman_won() or self.tentativas == self.max_tentativas
		
	# Método para verificar se o jogador venceu
    def hangman_won(self):
        if "_" not in self.letras_corretas:
            return True
		
	# Método para checar o status do game e imprimir o board na tela
    def hangman_status(self):
        print('\n' + self.hangman[self.tentativas] + "\n")
        print("Palavra: " + " ".join(self.letras_corretas) + "\n")
        print("Letras erradas:\n" + "\n".join(self.letras_erradas) + "\n")

lista_palavras = ['casa', 'sol', 'lua', 'gato', 'cao', 'bola',
                  'pe', 'mao', 'agua', 'ar', 'arvore', 'nuvem',
                  'janela', 'porta', 'lapis', 'livro', 'computador',
                  'bicicleta', 'montanha', 'oceano', 'quiabo',
                  'xicara', 'xadrez', 'bussola', 'girassol', 'melancia',
                  'abacaxi', 'escafandro', 'hipopotamo', 'psicologia']
jogo = Hangman(lista_palavras)
jogo.limpa_tela()

while not jogo.hangman_over():
    jogo.hangman_status()
    jogo.guess()

jogo.hangman_status()
if jogo.hangman_won():
    print("\nParabéns você venceu!")
else:
    print("\nGame over! Você perdeu!")
    print(f"A palavra era: {jogo.palavra}")
