-- Criacao de tipos
{-# OPTIONS_GHC -Wno-incomplete-patterns #-}

import Mapa

-- Funcoes auxiliares

obterNome :: Cidade -> Nome
obterNome (n, _, _) = n

obterLocal :: Cidade -> Localizacao
obterLocal (_, c, _) = c

obterRota :: Cidade -> Rotas
obterRota (_, _, r) = r

obterCidade :: Mapa -> Nome -> Cidade
obterCidade [] _ = error "Nao existe nenhuma cidade com esse nome"
obterCidade ((c,l,r):ms) name
    | name == c = (c,l,r)
    | otherwise = obterCidade ms name

existeCidade :: Nome -> Mapa -> Bool
existeCidade _ [] = False
existeCidade name (c:cs)
    | name == obterNome c = True
    | otherwise = existeCidade name cs

-- Funcao que inicia/cria um mapa

mapa_init :: Mapa
mapa_init = []

-- Funcao que adicioma cidade ao mapa
-- Usei o operador cons para adicionar uma tupla (que a cidade) ao inicio da lista (que e o mapa)
-- Tambem adicionei um erro se a cidade ja tiver no mapa

addCidade :: Mapa -> Nome -> Localizacao -> Mapa
addCidade map name coord = 
    if (existeCidade name map)
        then map
        else (name, coord, []): map

-- Funcao para remover uma cidade do mapa
-- Se mapa tiver vazio nao ha nada a se fazer
-- Se a cidade passada para a remocao for encontrada, entao percorre a lista para remove-la das outras rotas
-- A funcao e passada recursivamente ate encontrar a cidade, caso nao encontre o mapa sera retornado exatamente como foi usado no parametro
-- Para atualizar a lista de conexoes foi usada uma funcao auxiliar que se a cidade for a que eu quero so ignoro e se n for concateno e analiso os proximos elementos

-- Eu acho que se usar a funcao filter da pra tirar essa funcao auxiliar mas eu n sei usar ainda, a professora ainda vai explicar como funciona
rmRota :: Nome -> Rotas -> Rotas
rmRota _ [] = []
rmRota cidade (x : xs)
  | cidade == x = rmRota cidade xs
  | otherwise = x : rmRota cidade xs

rmCidade :: Nome -> Mapa -> Mapa
rmCidade _ [] = []
rmCidade cidade ((nome, coord, conexoes) : resto)
  | cidade == nome = rmCidade cidade resto
  | otherwise = (nome, coord, conexoesAtualizadas) : rmCidade cidade resto
  where
    conexoesAtualizadas = rmRota cidade conexoes

-- Funcao pra adiconar uma estrada entre duas cidades
-- Se o mapa tiver vazio nao ha nada a se fazer
-- Se nao estiver ele vai percorrer o mapa e verificar se as cidades estao no mapa, se estiverem ela vai atualizar a lista de conexoes das cidades incluindo as cidades na lista de estradas

addEstrada :: Mapa -> Nome -> Nome -> Mapa
addEstrada [] _ _ = []
addEstrada ((nome, coord, conexoes) : resto) cidade1 cidade2
  | cidade1 == nome = (nome, coord, cidade2 : conexoes) : addEstrada resto cidade1 cidade2
  | cidade2 == nome = (nome, coord, cidade1 : conexoes) : addEstrada resto cidade1 cidade2
  | otherwise = (nome, coord, conexoes) : addEstrada resto cidade1 cidade2

rmEstrada :: Mapa -> Nome -> Nome -> Mapa
rmEstrada [] _ _ = []
rmEstrada ((nome, coord, conexoes) : resto) cidade1 cidade2
  | cidade1 == nome = (nome, coord, rmRota cidade2 conexoes) : rmEstrada resto cidade1 cidade2
  | cidade2 == nome = (nome, coord, rmRota cidade1 conexoes) : rmEstrada resto cidade1 cidade2
  | otherwise = (nome, coord, conexoes) : rmEstrada resto cidade1 cidade2

-- Testando as funcoes

main :: IO ()
main = do
  let mapa = mapa_init

  let mapaAtualizado = addCidade (addCidade (addCidade (addCidade mapa "Sao Cristovao" (4.0, 8.0)) "Aracaju" (2.0, 5.0)) "Itabaiana" (8.0, 6.0)) "Barra dos Coqueiros" (3.0, 6.0)
  print (mapaAtualizado)
  print("-------------------------------------------------")

  let mapaAtualizado2 = rmCidade "Itabaiana" mapaAtualizado
  print (mapaAtualizado2)
  print("-------------------------------------------------")

  let mapaAtualizado3 = addEstrada mapaAtualizado2 "Aracaju" "Sao Cristovao"
  print (mapaAtualizado3)
  print("-------------------------------------------------")

  let mapaAtualizado4 = addEstrada mapaAtualizado3 "Barra dos Coqueiros" "Aracaju"
  print (mapaAtualizado4)
  print("-------------------------------------------------")

  let mapaAtualizado5 = rmEstrada mapaAtualizado4 "Aracaju" "Sao Cristovao"
  print (mapaAtualizado5)
  print("-------------------------------------------------")
