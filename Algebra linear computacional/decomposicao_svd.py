"""Importando modulos para a manipulação das matrizes"""
import numpy as np
from numpy import linalg as la


def diag(M, tol=1e-10):
    """Função que irá verificar se a matriz é diagonal
    Essa função cria uma matriz de booleanos e preenche
    a diagonal principal com valores False e compara 
    com a presença dos valores da matriz fornecida

    Essa função foi criada com o intuito de fazer a verificação da
    convergência da matriz R(um caso não muito otimizado)
    """

    b = np.ones_like(M, dtype=bool)
    np.fill_diagonal(b, False)
    return np.all(np.abs(M[b]) <= tol) #M[b] selecionará os elementos valor=True


def houseHolder_QR(A):
    """ Algoritmo de Fatoração QR Householder
        Função otimizada usando loops
    """
    A = np.matrix(A, dtype = float)
    m, n = A.shape
    Q = np.eye(m)
    R = A.copy()

    for j in range(min(m,n)):
        u = R[j:, j].copy()
        a = u[0, 0]
        if np.sum(u[1:, 0]) == 0:
            continue
        alfa = -np.sign(a) * la.norm(u)
        e1 = np.eye(u.shape[0], 1)
        r = alfa**2 - alfa*a
        w = (alfa*e1 - u)
    # Construindo a matriz de Householder
        H_j = np.eye(m - j) - (1/r) * w @ w.T 
        R[j:, :] = H_j @ R[j:, :]

        H = np.eye(m)
        H[j:, j:] = H_j

        Q = Q @ H
    # Aplicando H à direita de R e à esquerda de Q
    return Q, R


def random_svd(tol=1e-14):
    """ 
    Função que realiza a decomposição em valores singulares em uma matriz
    criada aleatoriamente o retorno será dessa forma:
        Matriz de autovetores cuja inversa é igual a transposta
        Matriz linha de autovalores ordenados em módulo(Retornando apenas a
        diagonal da matriz original)
        Matriz A retornando com o intuito de utilizá-la apenas para testes
    """ 

    """ 
    Função rand sendo usada por padrão, porém pode ser substituida por
    qualquer outra função que crie uma matriz aleatória
    """
    A = np.random.rand(30,30) 
    A = A.T @ A  # Garantindo que os autovalores serão positivos
    Q_k, R_k = la.qr(A)
    iteracoes = 1
    while iteracoes < 50000: #limitando o n de iteracoes
        
        # verificando a convergência da região triangular superior da matriz R_k
        # de forma otimizada
        diag_norm = la.norm(np.diag(R_k))
        triu_norm = la.norm(R_k[np.triu_indices(R_k.shape[0], 1)])
        if triu_norm / diag_norm < tol:
            break
        A_k = A@Q_k
        Q_k, R_k = la.qr(A_k)
        iteracoes += 1
    print(f'n de iteracoes: {iteracoes}')
    return A, Q_k, np.diag(R_k), Q_k.T


def householder_svd(A, tol=1e-14):
    """ 
    Cópia da função anterior, dessa vez usando a função QR criada por mim
    Para fins de comparação eu coloquei uma matriz como parâmetro nessa função
    que seria a matriz obtida na outra função de decomposição(apenas retirar o
    parâmetro e inserir os códigos equivalentes aos da função anterior para
    obter uma matriz aleatória)
    """

    Q_k, R_k = houseHolder_QR(A)  
    iteracoes = 1
    while iteracoes < 50000: #limitando o n de iteracoes

        # verificando a convergência da região triangular superior da matriz R_k
        # de forma otimizada
        diag_norm = la.norm(np.diag(R_k))
        triu_norm = la.norm(R_k[np.triu_indices(R_k.shape[0], 1)])
        if triu_norm / diag_norm < tol:
            break
        A_k = A@Q_k
        Q_k, R_k = houseHolder_QR(A_k)
        iteracoes += 1
    print(f'n de iteracoes: {iteracoes}')
    return A, Q_k, np.diag(R_k), Q_k.T


A, B, C, D = random_svd()
M, U, S, Vh = householder_svd(A)
J, K, V = la.svd(A)
tupla1 = (A,B,C,D)
tupla2 = (M, U, S, Vh)
tupla3 = (J, K, V)

# Comparando as 3 funções
for i in range(len(tupla1)-1):
    print(tupla1[i+1],'\n')
    print(tupla2[i+1],'\n')
    print(tupla3[i],'\n')
