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
