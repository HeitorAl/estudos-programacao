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
obterCidade ((nome,coord,estradas):resto) cidade
    | cidade == nome = (nome,coord,estradas)
    | otherwise = obterCidade cidade

existeCidade :: Nome -> Mapa -> Bool
existeCidade _ [] = False
existeCidade cidade (c:cs)
    | cidade == obterNome c = True
    | otherwise = existeCidade cidade cs

-- Funcao que inicia/cria um mapa

mapaInit :: Mapa
mapaInit = []

-- Funcao que adicioma cidade ao mapa
-- A funcao verifica se a cidade dada como entrada existe no map, se existir ela retorna o mapa como estava, senao ela adiciona a cidade no inicio do mapa

adicionarCidade :: Mapa -> Nome -> Localizacao -> Mapa
adicionarCidade mapa cidade coord = 
    if (existeCidade cidade mapa)
        then mapa
        else (cidade, coord, []): mapa

-- Funcao para remover uma cidade do mapa
-- Se mapa tiver vazio nao ha nada a se fazer
-- Se a cidade passada para a remocao for encontrada, entao percorre a lista para remove-la das outras listas de estradas
-- A funcao eh passada recursivamente ate encontrar a cidade, caso nao encontre o mapa sera retornado exatamente como foi usado no parametro
-- Para atualizar a lista de conexoes foi usada uma funcao auxiliar que se a cidade for a que eu quero so ignoro e se n for concateno e analiso os proximos elementos

-- Eu acho que se usar a funcao filter da pra tirar essa funcao auxiliar mas eu n sei usar ainda, a professora ainda vai explicar como funciona
atualizarEstradas:: Nome -> Rotas -> Rotas
atualizarEstradas _ [] = []
atualizarEstradas cidade (x : xs)
  | cidade == x = atualizarEstradas cidade xs
  | otherwise = x : atualizarEstradas cidade xs

removerCidade :: Nome -> Mapa -> Mapa
removerCidade _ [] = []
removerCidade cidade ((nome, coord, estradas) : resto)
  | cidade == nome = removerCidade cidade resto
  | otherwise = (nome, coord, estradasAtualizadas) : removerCidade cidade resto
  where
    estradasAtualizadas = atualizarEstradas cidade estradas

-- Funcao pra adiconar uma estrada entre duas cidades
-- Se o mapa tiver vazio nao ha nada a se fazer
-- Se nao estiver ele vai percorrer o mapa e verificar se as cidades estao no mapa, se estiverem ela vai atualizar a lista de conexoes das cidades incluindo as cidades na lista de estradas

adicionarEstrada :: Mapa -> Nome -> Nome -> Mapa
adicionarEstrada mapa origem destino = 
    if (existeCidade origem mapa && existeCidade destino mapa)
        then inserir mapa origem destino
        else error "Origem e Destino nao existem"
    where 
        inserir :: Mapa -> Nome -> Nome -> Mapa 
        inserir [] _ _ = []
        inserir ((nome, coord, estradas) : resto) origem destino  
            | origem == nome = (nome, coord, destino:estradas) : inserir resto origem destino
            | destino == nome = (nome, coord, origem:estradas) : inserir resto origem destino
            | otherwise = (nome, coord, estradas) : inserir resto origem destino

removerEstrada :: Mapa -> Nome -> Nome -> Mapa
removerEstrada [] _ _ = []
removerEstrada ((nome, coord, estradas) : resto) origem destino
  | origem == nome = (nome, coord, atualizarEstradas destino estradas) : removerEstrada resto origem destino 
  | destino == nome = (nome, coord, atualizarEstradas origem estradas) : removerEstrada resto origem destino
  | otherwise = (nome, coord, estradas) : removerEstrada resto origem destino 

-- Testando as funcoes

main :: IO ()
main = do
  let mapa = mapaInit

  let mapaAtualizado = adicionarCidade (adicionarCidade (adicionarCidade (adicionarCidade mapa "Sao Cristovao" (4.0, 8.0)) "Aracaju" (2.0, 5.0)) "Itabaiana" (8.0, 6.0)) "Barra dos Coqueiros" (3.0, 6.0)
  print (mapaAtualizado)
  print("-------------------------------------------------")

  let mapaAtualizado2 = removerCidade "Itabaiana" mapaAtualizado
  print (mapaAtualizado2)
  print("-------------------------------------------------")

  let mapaAtualizado3 = adicionarEstrada mapaAtualizado2 "Aracaju" "Sao Cristovao"
  print (mapaAtualizado3)
  print("-------------------------------------------------")

  let mapaAtualizado4 = adicionarEstrada mapaAtualizado3 "Barra dos Coqueiros" "Aracaju"
  print (mapaAtualizado4)
  print("-------------------------------------------------")

  let mapaAtualizado5 = removerEstrada mapaAtualizado4 "Aracaju" "Sao Cristovao"
  print (mapaAtualizado5)
  print("-------------------------------------------------")
