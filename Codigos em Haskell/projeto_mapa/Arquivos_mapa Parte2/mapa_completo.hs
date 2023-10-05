-- Criacao de tipos
{-# OPTIONS_GHC -Wno-incomplete-patterns #-}

import Mapa

-- Funcoes auxiliares

obterNome :: Cidade -> Nome
obterNome (nome, _, _) = nome


obterLocal :: Cidade -> Localizacao
obterLocal (_, coord, _) = coord


obterEstradas :: Cidade -> Rotas
obterEstradas (_, _, estradas) = estradas


obterCidade :: Mapa -> Nome -> Cidade
obterCidade [] _ = error "Nao existe nenhuma cidade com esse nome"
obterCidade (m:ms) nome
    | nome == obterNome m = m
    | otherwise = obterCidade ms nome


obterEstradasNome :: Mapa -> Nome -> Rotas
obterEstradasNome [] _ = error "O mapa esta vazio"
obterEstradasNome mapa nome 
    | not (existeCidade nome mapa) = error "A cidade nao existe no mapa" 
    | otherwise = obterEstradas (obterCidade mapa nome)


existeCidade :: Nome -> Mapa -> Bool
existeCidade _ [] = False
existeCidade cidade (c:cs)
    | cidade == obterNome c = True
    | otherwise = existeCidade cidade cs


existemCidades :: Nome -> Nome -> Mapa -> Bool 
existemCidades nome1 nome2 mapa = (existeCidade nome1 mapa) && (existeCidade nome2 mapa)


existeEstrada :: Mapa -> Nome -> Nome -> Bool
existeEstrada [] _ _ = error "O mapa esta vazio"
existeEstrada mapa nome1 nome2
    | not (existemCidades nome1 nome2 mapa) = error "Uma das cidades nao existe no mapa"
    | otherwise = percorrerEstrada 
    where
        percorrerEstrada = elem nome1 (obterEstradasNome mapa nome2) 


encontraRota :: Mapa -> Nome -> Nome -> Rotas -> Rotas
encontraRota mapa origem destino visitadas
    | origem == destino = [origem] ++ visitadas  
    | elem origem visitadas = []  
    | otherwise      = if rotasFinais == [] then [] else (head rotasFinais)
    where
        estradas     = obterEstradasNome mapa origem
        rotas        = [encontraRota mapa proxima destino (origem : visitadas) | proxima <- estradas]
        rotasFinais  = [rota | rota <- rotas, rota /= []]


atualizarEstradas :: Nome -> Rotas -> Rotas
atualizarEstradas _ [] = []
atualizarEstradas cidade (x : xs)
    | cidade == x = atualizarEstradas cidade xs
    | otherwise   = x : atualizarEstradas cidade xs


calculoEuclidiano :: Localizacao -> Localizacao -> Double
calculoEuclidiano (p1, p2) (q1, q2) = sqrt ((p1 - q1)^2 + (p2 - q2)^2)


------------------------------------------------------------------------------------------------------------

-- 1 º Etapa:

--  Funcao que inicia/cria um mapa

mapaInit :: Mapa
mapaInit = []

--  Funcao que adiciona cidade ao mapa
{-  A funcao verifica se a cidade dada como entrada existe no mapa, 
    se existir ela retorna o mapa como estava, 
    senao ela adiciona a cidade no inicio do mapa
-}

adicionarCidade :: Mapa -> Nome -> Localizacao -> Mapa
adicionarCidade mapa cidade coord = 
    if (existeCidade cidade mapa)
        then mapa
        else (cidade, coord, []): mapa

{-  Funcao para remover uma cidade do mapa
    Caso o mapa esteja vazio ou a cidade nao exista no mapa, nada e feito
    Caso a cidade passada para a remocao for encontrada, 
    entao percorre a lista recursivamente para remove-la das outras listas de estradas

    Para atualizar a lista de conexoes foi usada a funcao auxiliar atualizarEstradas
-}

removerCidade :: Nome -> Mapa -> Mapa
removerCidade _ [] = []
removerCidade cidade ((nome, coord, estradas) : resto)
  | cidade == nome = removerCidade cidade resto
  | otherwise = (nome, coord, estradasAtualizadas) : removerCidade cidade resto
  where
    estradasAtualizadas = atualizarEstradas cidade estradas

{-  Funcao pra adiconar uma estrada entre duas cidades
    Caso o mapa esteja vazio ou as cidades nao existam, nada e feito
    Caso contrario, a lista de conexoes das cidades sera atualizada
    incluindo as cidades na lista de estradas
-} 

adicionarEstrada :: Mapa -> Nome -> Nome -> Mapa
adicionarEstrada mapa origem destino = 
    if ((existemCidades origem destino mapa) && (origem /= destino) && not (existeEstrada mapa origem destino) )
        then inserir mapa origem destino
        else mapa
    where
        inserir :: Mapa -> Nome -> Nome -> Mapa 
        inserir [] _ _  = []
        inserir ((nome, coord, estradas) : resto) origem destino  
            | origem    == nome = (nome, coord, destino:estradas) : inserir resto origem destino
            | destino   == nome = (nome, coord, origem:estradas) : inserir resto origem destino
            | otherwise         = (nome, coord, estradas) : inserir resto origem destino


{- Para remover uma estrada de uma cidade pra outra, a funcao verifica se as cidades existem no mapa, 
    se existirem usamos uma funcao auxiliar para atualizar lista de conexoes, 
    removendo as cidades atraves de uma funcao auxiliar
-}

removerEstrada :: Mapa -> Nome -> Nome -> Mapa
removerEstrada mapa origem destino =
    if (existemCidades origem destino mapa)
        then remover mapa origem destino
        else mapa
    where
        remover :: Mapa -> Nome -> Nome -> Mapa
        remover [] _ _  = []
        remover ((nome, coord, estradas):resto) origem destino
            | origem    == nome = (nome, coord, atualizarEstradas destino estradas) : remover resto origem destino 
            | destino   == nome = (nome, coord, atualizarEstradas origem estradas) : remover resto origem destino
            | otherwise         = (nome, coord, estradas) : remover resto origem destino


-- 2 º Etapa:

-- Calcula a distancia euclidiana de duas cidades

calcularDistancia :: Mapa -> Nome -> Nome -> Double
calcularDistancia ms cidade1 cidade2
    | cidade1 == cidade2 = 0
    | existemCidades cidade1 cidade2 ms = calculoEuclidiano local1 local2
    | otherwise = error "Uma das cidades nao existem no mapa"
    where
        local1 = obterLocal $ obterCidade ms cidade1
        local2 = obterLocal $ obterCidade ms cidade2

-- Funcao que encontra as rotas que conectam duas cidades em um mapa. 

rotaEntreCidades :: Mapa -> Nome -> Nome -> Rotas
rotaEntreCidades mapa origem destino
    | origem == destino = [origem]  
    | otherwise = reverse $ encontraRota mapa origem destino []

-- Funcao que realiza a soma entre as rotas de uma cidade a outra, realizando a soma em 2 em 2.

calcularDistanciaRota :: Mapa -> Nome -> Nome -> Double
calcularDistanciaRota [] _ _ = error "O mapa esta vazio"
calcularDistanciaRota mapa origem destino
    | not (existemCidades origem destino mapa) = error "Uma das cidades nao existe no mapa"
    | origem == destino  = 0
    | elem origem (obterEstradasNome mapa destino) = calcularDistancia mapa origem destino
    | otherwise = soma2 mapa (rotaEntreCidades mapa origem destino)
    where
        soma2 :: Mapa -> Rotas -> Double
        soma2 _ [] = error "Nao existe rota entre as cidades"
        soma2 mapa (x:xs)
            | length xs == 1 = calcularDistancia mapa x (head xs)
            | otherwise = (calcularDistancia mapa x (head xs)) + soma2 mapa xs

-- Funcao que verifica se existe uma rota entre duas cidades

existeRota :: Mapa -> Nome -> Nome -> Bool
existeRota [] _ _ = error "O mapa esta vazio"
existeRota mapa nome1 nome2
    | not (existemCidades nome1 nome2 mapa) = error "Uma das cidades nao existe no mapa"
    | rota == [] = False
    | otherwise  = True
    where
        rota = encontraRota mapa nome1 nome2 []


-- Testando as funcoes

main :: IO ()
main = do
  let mapa = mapaInit

  let mapaAtualizado = adicionarCidade (adicionarCidade (adicionarCidade (adicionarCidade mapa "Sao Cristovao" (4.0, 8.0)) "Aracaju" (2.0, 5.0)) "Itabaiana" (8.0, 6.0)) "Barra dos Coqueiros" (3.0, 6.0)
  print (mapaAtualizado)
  putStrLn "\n--------------------------------------------------------------------------------------\n"

  let mapaAtualizado2 = removerCidade "Itabaiana" mapaAtualizado
  print (mapaAtualizado2)
  putStrLn "\n--------------------------------------------------------------------------------------\n"

  let mapaAtualizado3 = adicionarEstrada mapaAtualizado2 "Aracaju" "Sao Cristovao"
  print (mapaAtualizado3)
  putStrLn "\n--------------------------------------------------------------------------------------\n"

  let mapaAtualizado4 = adicionarEstrada mapaAtualizado3 "Barra dos Coqueiros" "Aracaju"
  print (mapaAtualizado4)
  putStrLn "\n--------------------------------------------------------------------------------------\n"

  let mapaAtualizado5 = removerEstrada mapaAtualizado4 "Aracaju" "Sao Cristovao"
  print (mapaAtualizado5)
  putStrLn "\n--------------------------------------------------------------------------------------\n"
    
  let mapaAtualizado6 = removerEstrada mapaAtualizado5 "Aracaju" "Barra"
  print(mapaAtualizado6)
  putStrLn "\n--------------------------------------------------------------------------------------\n"

