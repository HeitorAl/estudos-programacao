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
    Essa função pode demorar a processar por conta da recursividade
    """
    A = np.matrix(A, dtype = float)
    m, n = A.shape
    Q = np.eye(min(m,n))

    if n == 1:
        return Q, A

    u = A[:, 0].astype(float)
    a = A[0, 0]
    if np.sum(A[1:, 0]) == 0:
        return Q, A
    alfa = -np.sign(a) * la.norm(u)
    e1 = np.eye(u.shape[0], 1)
    r = alfa**2 - alfa*a
    w = (alfa*e1 - u)
    # Construindo a matriz de Householder
    H = np.eye(m) - (1/r) * w @ w.T 
    R = H @ A

    Q_k, R_k = houseHolder_QR(R[1: , 1:])

    Q[1: , 1:] = Q_k.astype(float)

    R_tot = np.zeros_like(A)
    R_tot[0, :] = R[0, :]
    R_tot[1: , 1:] = R_k

    # Aplicando H à direita de R e à esquerda de Q
    return H @ Q, R_tot

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
        diag_norm = la.norm(np.diag(R_k))
        triu_norm = la.norm(R_k[np.triu_indices(R_k.shape[0], 1)])
        if triu_norm / diag_norm < tol:
            break
        A_k = A@Q_k
        Q_k, R_k = houseHolder_QR(A_k)
        iteracoes += 1
    print(f'n de iteracoes: {iteracoes}')
    return A, Q_k, np.diag(R_k), Q_k.T

"""Como conclusão após alguns testes eu percebi que para uma tolerância maior
que 1e-10 a função que utiliza a la.qr
"""

A, B, C, D = random_svd()
M, U, S, Vh = householder_svd(A)
tupla1 = (A,B,C,D)
tupla2 = (M, U, S, Vh)

for i in range(len(tupla1)-1):
    print(tupla1[i+1],'\n')
    print(tupla2[i+1],'\n')
