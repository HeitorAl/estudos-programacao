"""Importando numpy para manipular as matrizes"""
import numpy as np
from numpy import linalg as la


def houseHolder_QR(A):
    """ Algoritmo de Fatoração QR Householder"""
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


A = [[1, 0, 0], [0, 1, 0], [0, 0, 1]]
B = [[2, 1, 3], [0, 4, 5], [0, 0, 6]]
C = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
D = [[3, 5, 6], [0, 2, 4], [0, 0, 1]]
E = [[4, 1, 3],
     [2, 1, 5],
     [1, 1, 1]]

tupla = (A,B,C,D,E)

for i, matriz in enumerate(tupla):
    Q, R = houseHolder_QR(matriz)
    Q2, R2 = la.qr(matriz)
    print(Q)
    print(Q2)
    print(R)
    print(R2)
