import numpy as np

def troca_linha(a,i,j):
    a[[i,j]] = a[[j,i]]

def multiplica_linha(a,i,l):
    a[i] *= l

def soma_linha(a,i,j,l):
    a[i] += l*a[j]

def troca_coluna(a, i, j):
    a[:,[i,j]] = a[:,[j,i]]

def multiplica_coluna(a, i, l):
    a[:,i] *= l

def soma_coluna(a, i, j, l):
    a[:,i] += l*a[:,j]

def conta_colunas(A,m):
    _,n = A.shape

    cont = 0
    for j in range(n):
        coluna = A[:m,j]
        zero = False
        for valor in coluna:
            if np.round(valor,10) != 0:
                zero = True
                break
        if zero:
            cont += 1
    
    return cont

def bases_aumentadas(Matriz, m):

    zeros = conta_colunas(Matriz,m)
    Im = Matriz[:m,:zeros].T
    Im = completar_base(Im)
    Ker = Matriz[m:,:].T

    return Im,Ker

def completar_base(A):
    m,n = A.shape
    while m != n:
        linha_adicional = np.zeros((1,n), dtype = float)
        A = np.concatenate((A,linha_adicional), axis=0)
        m,n = A.shape
    for i in range(m):
        pivo = A[i,i]
        if pivo == 0:
            A[i,i] = 1
            base_nucleo = guardando_gauss_jordan(A,i)
            A[i] = base_nucleo
    # ... (código para encontrar soluções particulares)
    
    return A

def guardando_gauss_jordan(A,indice):
    _,n = A.shape
    valores = []
    for col in range(indice,n):
        for linha in range(col+1, n):
            soma_linha(A, col, linha, -A[linha,col])
            valores.append(-A[linha,col])
        for linha in range(col):
            valores.append(-A[linha,col])
        valores.append(A[linha,linha]) 
        return np.matrix(valores,dtype=float)

def eliminacao_gauss(A, tol=1e-10):
    m,n = A.shape
    I = np.eye(n,dtype = float)
    M = np.vstack((A,I))
    

    for linha in range(m):
        if np.round(np.abs(M[linha,linha]),10) <= tol:
            for col in range(linha+1, n):
                if np.round(np.abs(M[linha,col]),10) != 0:
                    troca_coluna(M, col, linha)
                    break
                    
        if np.round(np.abs(M[linha,linha]),10) > tol:
            multiplica_coluna(M, linha, 1/M[linha,linha])

        for col in range(linha+1, n):
            soma_coluna(M, col, linha, -M[linha,col])
        for col in range(linha):
            soma_coluna(M, col, linha, -M[linha,col])

    Im, Ker = bases_aumentadas(M, m)
    #Arredondando os valores das matrizes para 12 casas decimais
    Im, Ker = Im.round(10), Ker.round(10) 
    return Im,Ker

def norma(u):
    soma = np.sum(u**2)
    modulo = np.sqrt(soma)
    return modulo

def normaliza_vet(v):
    modulo = norma(v)
    v /= modulo

def gram_Schmidt(v1,v2):
    p_i = (v1@v2)/(v2@v2)
    w = v1 - v2*p_i
    return w

def normalizar(M):
    m,_ = M.shape
    
    for linha in range(m):
        normaliza_vet(M[linha])

    return M

def ortogonalizar(M):
    m,n = M.shape
    V = np.zeros((m,n))

    for linha in range(m):
        V[linha] = M[linha]
        for col in range(linha-1,-1,-1):
            V[linha] = gram_Schmidt(V[linha], V[col])
    
    V = normalizar(V)
    return V.round(10)

def transformacao_ortogonal(w1,w2,mat_t):
    transformacao = np.dot(np.dot(w1,mat_t),w2)
    
    return transformacao.round(10)

B = np.matrix([[-0.17, -0.05, -0.46, -0.05, -0.39,  0.,   -0.01,  0.33, -0.38,  0.37, -0.23, -0.08],
 [ 0.15,  0.09, -0.12, -0.46, -0.34,  0.38, -0.08, -0.09, -0.13,  0.05,  0.17,  0.15],
 [-0.26,  0.04, -0.1,   0.22, -0.32,  0.03,  0.13,  0.27, -0.25,  0.43, -0.29, -0.04],
 [-0.45,  0.12,  0.54, -0.14,  0.26,  0.26, -0.14, -0.23,  0.24, -0.17, -0.22, -0.01],
 [-0.02,  0.03,  0.03, -0.52, -0.29,  0.47, -0.11, -0.08, -0.06, -0.06,  0.24,  0.17],
 [ 0.31,  0.57, -0.18, -0.3,  -0.35,  0.21, -0.15,  0.24,  0.04, -0.07, -0.25, -0.07],
 [-0.19,  0.24,  0.16, -0.31, -0.29,  0.19,  0.04,  0.26,  0.22,  0.,   -0.35,  0.06],
 [ 0.15,  0.43, -0.26, -0.45, -0.4,   0.05, -0.06,  0.34,  0.13,  0.03, -0.53, -0.04],
 [ 0.23,  0.29, -0.3,  -0.22, -0.3,  -0.14,  0.03,  0.36,  0.12,  0.03, -0.4,  -0.05],
 [ 0.56, -0.1,  -0.48,  0.09,  0.08, -0.23, -0.09, -0.02, -0.19, -0.16,  0.45, -0.07]])

Im, Nuc = eliminacao_gauss(B)[0], eliminacao_gauss(B)[1]
w1, w2 = ortogonalizar(Im), ortogonalizar(Nuc)

print(transformacao_ortogonal(w1,w2, B))