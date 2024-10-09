"""Importando módulo para a manipulação de matrizes"""
import numpy as np
from numpy import linalg as la


def metodo_potencias(A, tol=1e-18):
    """
    Função do método das potências
    Essa função irá encontrar uma
    matriz diagonal de autovalores
    """

    A = np.matrix(A)
    m, n = A.shape
    # Pela aleatoriedade do vetor os resultados podem variar
    v = np.random.rand(m)
    v /= la.norm(v)
    
    for _ in range(250):
        u = A @ v
        eig_v = la.norm(u)
        v = u/eig_v

        if la.norm(u - eig_v * v) < tol:
            break

    return eig_v, v 


M = [[1, 2], [3, 2]]

print(metodo_potencias(M))
