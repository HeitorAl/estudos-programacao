import Data.Char

replicar :: Int -> a -> [a]
replicar 0 _ = []
replicar x y = y: replicar (x-1) y

aNd :: [Bool] -> Bool
aNd [] = True
aNd (x:xs) = (x && aNd xs)

oR :: [Bool] -> Bool
oR [] = False
oR (x:xs) = (x || oR xs)

dRop :: Int -> [a] -> [a]
dRop y (x:xs)
    | y == 0 = (x:xs)
    | otherwise = dRop (y-1) xs

unZip :: [(a,b)] -> ([a], [b])
unZip [] = ([],[])
unZip ((a,b):ls) = (a:(fst (unZip ls)), b:(snd (unZip ls)))

somaPares :: [Int] -> Int
somaPares [] = 0
somaPares (x:xs)
    | even x = x + somaPares xs
    | otherwise = somaPares xs

somaImpares :: [Int] -> Int
somaImpares [] = 0
somaImpares (y:ys)
    | (even y) == False = y + somaImpares ys
    | otherwise = somaImpares ys

soDigitos :: [Char] -> String
soDigitos [] = []
soDigitos (x:xs)
    | isDigit x = x: (soDigitos xs)
    | otherwise = soDigitos xs

elemNum :: [Int] -> Int -> Int
elemNum [] _ = 0
elemNum (x:xs) a
    | x == a = 1 + elemNum xs a
    | otherwise = elemNum xs a

unicos :: [Int] -> [Int]
unicos xs = [x | x <- xs, (elemNum xs x == 1)]

naLista :: Int -> [Int] -> Bool
naLista _ [] = False
naLista x (l:ls)
    | x == l = True
    | otherwise = naLista x ls
