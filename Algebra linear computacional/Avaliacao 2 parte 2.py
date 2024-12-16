# Bibliotecas
import numpy as np
from numpy import linalg as la
import matplotlib.pyplot as plt
from sklearn.linear_model import Perceptron # type: ignore

# Altura x Peso ideal para mulheres
M = np.array([
    [1.47,50],[1.5,51],[1.52,52],[1.56,54],[1.57,55],
    [1.6,56],[1.63,63],[1.65,64],[1.68,65],[1.7,67],
    [1.73,68],[1.75,69],[1.78,71],[1.8,72],[1.83,73]])

# Altura x peso ideal para homens
H = np.array([
    [1.57,64],[1.6,65],[1.63,66],[1.65,73],[1.68,74],
    [1.7,76],[1.73,78],[1.75,80],[1.78,82],[1.8,83],
    [1.83,85],[1.85,87],[1.88,89],[1.91,92],[1.95,94]])

# 1 Questão
X = np.concatenate((H,M), axis=0)
y_m = -np.ones((M.shape[0], 1))
y_h = np.ones((H.shape[0], 1))
y = np.concatenate((y_h, y_m), axis=None)

X_b = np.hstack([X, np.ones((X.shape[0], 1))])

beta = la.inv(X_b.T @ X_b) @ X_b.T @ y
a, b, c = beta
x1_vals = np.linspace(1.45, 1.95, 100) # delimitando comprimento da reta de ajuste
x2_vals = -(a * x1_vals + c) / b

# Fonte https://99dicas.com.br/peso-ideal-para-homens/

# Altura x peso coletados de indivíduos aleatórios
A = np.array([
    [1.67,89.33],[1.91,84.73],[1.84,93.90],[1.68,83.29],[1.80,92.28],
    [1.91,55.24],[1.90,93.55],[1.73,58.47],[1.69,77.31],[1.94,56.99],
    [1.76,78.87],[1.80,90.54],[1.94,81.06],[1.85,86.52],[1.56,50.82],
    [1.89,57.35],[1.53,79.49],[1.57,91.27],[1.55,69.45],[1.87,71.47],
    [1.94,51.30],[1.61,53.48],[1.91,55.33],[1.95,52.31],[1.73,50.02],
    [1.94,75.86],[1.94,58.40],[1.50,88.43],[1.93,58.65],[1.83,68.12]])


# Dados plotados no plano
plt.plot(M[:,0], M[:,1], 'o', label='Mulheres', markersize=10)
plt.plot(H[:,0], H[:,1], 'o', label='Homens', markersize=10)
plt.plot(A[:, 0], A[:, 1], 'o', color='m', markersize=10)
plt.plot(x1_vals, x2_vals, 'r', color='green', label='Reta ajustada (Separação)')
plt.legend()
plt.show()

# 2 Questão
clf = Perceptron(tol=1e-10)
clf.fit(X,y)

M = A.copy()
M[:, 0] *= 100
classificador = clf.predict(M)

for i in range(len(X)):
    print(A[i], '->', classificador[i])

for k, p in enumerate(X):
    px = p[0]
    py = p[1]
    plt.scatter(px,py,c='blue')
   
for k,q in enumerate(M):
    qx = q[0]
    qy = q[1]
    plt.scatter(qx, qy, c='red')

ax = plt.gca()
xlim = ax.get_xlim()
ylim = ax.get_ylim()

xx = np.linspace(xlim[0], xlim[1], 30)
yy = np.linspace(ylim[0], ylim[1], 30)
YY, XX = np.meshgrid(yy,xx)
xy = np.vstack([XX.ravel(), YY.ravel()]).T
Z = clf.decision_function(xy).reshape(XX.shape)

ax.contour(XX, YY, Z, colors='green', levels=[-1,1], alpha=0.3, linestyles=['--','-','--'])
plt.show()

# 3 Questão
A_c = A - np.mean(A, axis=0)
U, S, V = la.svd(A_c, full_matrices=False)

plt.scatter(A[:,0], A[:,1], label='Dados de teste', color='blue')
origem = np.mean(A, axis=0)
for i in range(V.shape[1]):
    plt.quiver(*origem, V[0,i], V[1,i], angles='xy', scale=0.5, scale_units='xy', color='red', label=f'Componente {i+1}')

plt.xlabel('Altura (m)')
plt.ylabel('Peso (kg)')
plt.legend()

plt.grid(True)
plt.axis('equal')
plt.show()