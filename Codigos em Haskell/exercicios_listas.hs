type Nome = String
type Idade = Int
type Estado = String
type Capital = String

produtoPares :: [Int] -> Int 
produtoPares [] = 1
produtoPares (x:xs) 
    | even x = x*produtoPares xs
    | otherwise = produtoPares xs

palindromo :: String -> String -> Bool
palindromo a b
    | (a == reverse a) && (b == reverse b) = True
    | otherwise = False

dadosPessoais :: [Nome] -> [Idade] -> [(Nome,Idade)]
dadosPessoais [] [] = []
dadosPessoais (n:ns) (i:is) = (n,i): dadosPessoais ns is

local :: [(Estado, Capital)] -> ([Estado], [Capital])
local [] = ([],[])
local ((e,c):ls) = (e: (fst (local ls)), c: (snd (local ls)))

somaMaiores :: [Float] -> Float
somaMaiores [] = 0
somaMaiores (x:xs)
    | x >= 5.0 = x + somaMaiores xs
    | otherwise = somaMaiores xs

mediaReal :: [Float] -> Float
mediaReal xs = (sum xs)/ fromIntegral (length xs)

notasMedia :: [Float] -> [Float]
notasMedia xs = [x | x <- xs, x >= media]
    where media = (sum xs)/ fromIntegral (length xs)

barraN :: String -> String
barraN a = a ++ "\n"

concatenaN :: [String] -> String
concatenaN [] = ""
concatenaN (x:xs) = barraN x ++ concatenaN xs

imprimeLista :: [String] -> IO () 
imprimeLista xs = putStr (concatenaN xs)

stringMax :: String -> Int -> String
stringMax _ 0 = ""
stringMax s y
    | (y - length s) > 0 = " " ++ stringMax s (y-1)
    | (y - length s) == 0 = s
    | otherwise = take y s
