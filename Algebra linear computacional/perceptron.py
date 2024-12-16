###############
# Bibliotecas #
###############

# Biblioteca numerica
import numpy as np

# Biblioteca de graficos
import matplotlib.pyplot as plt

# Funcao de classificacao do Perceptron contida na biblioteca Scikit-Learn
from sklearn.linear_model import Perceptron # type: ignore

####################
# Dados de entrada #
####################

# Dados de Treinamento
X = [[-1, -1],[-2, -1],[-3,-1],[-.5,-0.5],[1, 1],[2, 1],[3,1],[1,3]]

# Rotulos
y = [-1, -1, -1, -1, 1, 1, 1, 1]

# Conjunto de teste (Conjunto de Controle)
ConjuntoTeste = [[-2,-4],[5,2],[0,-0.5],[-1,2],[3,3],[-0.8, -1],
                 [-2,2],[3,2],[5,8],[0,-5],[2,-3],[5,-2],[5,-1.75]]

#################################################
# Aplicando o SVM sobre os dados de treinamento #
#################################################
clf = Perceptron(tol=1e-10)
clf.fit(X,y)

# Aplicanco o Classificador sobre o conjunto de Teste
classificador = clf.predict(ConjuntoTeste)

# Resultado
print("classificador do Sklearn")
for i in range(len(X)):
    print(ConjuntoTeste[i],'->',classificador[i])

########################
# Plotando os Graficos #
########################

# Cores para visualizacao
cores = ['w','g','m'] # white, green, magenta

# Plotando o conjunto de treinamento
for k,p in enumerate(X):
    px = p[0]
    py = p[1]
    cor = cores[y[k]]
    plt.scatter(px,py,c=cor)

#Plotando o conjunto de testes com o classificador aplicado
cores = ['w','b','r'] # white, blue, red
for k,q in enumerate(ConjuntoTeste):
    qx = q[0]
    qy = q[1]
    indice = classificador[k]
    cor = cores[indice]
    plt.scatter(qx,qy,c=cor)

# Delimitando os pontos extremos na tela de visualização
ax = plt.gca()
xlim = ax.get_xlim()
ylim = ax.get_ylim()

# Cria a grade a ser aplicada no modelo
xx = np.linspace(xlim[0], xlim[1], 30)
yy = np.linspace(ylim[0], ylim[1], 30)
YY, XX = np.meshgrid(yy, xx)
xy = np.vstack([XX.ravel(), YY.ravel()]).T
Z = clf.decision_function(xy).reshape(XX.shape)

# Plota as margens dos conjuntos.
ax.contour(XX, YY, Z,  colors='k', levels=[-1, 0, 1],
           alpha=0.3, linestyles=['--', '-', '--'])
plt.show()
