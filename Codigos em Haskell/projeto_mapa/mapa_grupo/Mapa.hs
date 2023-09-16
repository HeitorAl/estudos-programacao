module Mapa(salvarMapa, carregarMapa, Mapa, Cidade, Rotas, Localizacao, Nome) where

import GHC.IO.Handle
import GHC.IO.IOMode (IOMode(ReadMode, WriteMode))
import GHC.IO.Handle.FD (openFile)
import Control.Exception (try, catch, SomeException (SomeException))

type Nome = String
type Localizacao = (Double, Double)
type Rotas = [Nome]
type Cidade = (Nome, Localizacao, Rotas)
type Mapa = [Cidade]

caminhoArquivoCidades :: FilePath
caminhoArquivoCidades = "cidades.mapa"

carregarMapa :: FilePath -> IO Mapa
carregarMapa = carregarMapaDoArquivo

-- Salva um mapa no arquivo especificado, retorna True caso o processo tenha occorrido sem erros
-- e retorna False caso um erro tenha ocorrido no processo, escrevendo tambem o motivo do erro
salvarMapa :: Mapa -> FilePath -> IO Bool
salvarMapa mapa caminho = catch 
    (do salvarMapaNoArquivo caminho mapa; return True) 
    (\e -> do 
        let err = show (e::SomeException)
        putStrLn "Nao foi possivel salvar o mapa"
        putStrLn ("erro: " ++ err)
        return False)

-- Carrega o Mapa salvo no arquivo do caminho passado
carregarMapaDoArquivo :: FilePath -> IO Mapa
carregarMapaDoArquivo caminho = do
    arquivoLeitura <- openFile caminho ReadMode
    cidades <- hCarregarMapa arquivoLeitura
    hClose arquivoLeitura
    return cidades

-- Carrega o Mapa salvo no arquivo passado
hCarregarMapa :: Handle -> IO Mapa
hCarregarMapa handle = do
    conteudo <- hGetContents' handle
    let linhas = filter (not . null) (splitOn '\n' conteudo) -- O filter remove as possiveis linhas vazias (literalmente vazias, espacos sao caracteres)
    let componentes = map (splitOn ',') linhas
    return (paraMapa componentes)

-- Tenta converter uma lista de lista de String num Mapa válido. Para o programa caso uma das listas seja insuficiente para criar uma cidade
paraMapa :: [[String]] -> Mapa
paraMapa = map paraCidade

-- Tenta converter uma lista de String numa cidade válida. Faz o programa parar caso o tamanho da lista seja insuficiente
paraCidade :: [String] -> Cidade
paraCidade [] = error "linha vazia"
paraCidade [""] = error "linha vazia"
paraCidade [nome] = error ("Cidade: <" ++ nome ++ "> nao possui Localizacao")
paraCidade [nome,_] = error ("Localizacao da Cidade: <" ++ nome ++ "> nao possui eixo Y")
paraCidade (nome : x : y : rotas) = (nome, (read x :: Double, read y :: Double), rotas)

-- Sobreescreve o conteudo do arquivo no caminho especificado com um Mapa
salvarMapaNoArquivo :: FilePath -> Mapa -> IO ()
salvarMapaNoArquivo caminho mapa = do
    arquivoEscrita <- openFile caminho WriteMode
    hSalvarMapa arquivoEscrita mapa
    hClose arquivoEscrita

-- Sobreescreve o conteudo do arquivo com um Mapa 
hSalvarMapa :: Handle -> Mapa -> IO ()
hSalvarMapa arquivo mapa = hPutStr arquivo (mapaStr mapa) 

-- Converte um Mapa ([Cidade])
mapaStr :: Mapa -> String
mapaStr mapa = unlines (map cidadeStr mapa)

-- Converte uma cidade ((String, (Double, Double), [String])) para String
cidadeStr :: Cidade -> String
cidadeStr (nome, (x, y), rotas) = joinWith "," [nome, show x, show y, joinWith "," rotas]

-- Concatena uma lista de Strings com uma outra String entre cada um dos elementos da lista
joinWith :: String -> [String] -> String
joinWith _ [] = ""
joinWith _ [a] = a
joinWith toInsert ss = foldr1 (\m n -> m ++ toInsert ++ n) ss

splitOn :: (Eq a) => a -> [a] -> [[a]]
splitOn _ [] = []
splitOn a [x]
 | a == x = [[]]
 | otherwise = [[x]]

splitOn a (x:xs)
 | a == x = [] : tailSplit
 | otherwise = (x : head tailSplit) : tail tailSplit
 where tailSplit = splitOn a xs

-- It's-a-me, Mario!
-- Hello!
