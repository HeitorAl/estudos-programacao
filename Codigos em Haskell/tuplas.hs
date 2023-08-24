maxOcorre :: Int ->  Int -> (Int, Int)
maxOcorre x y
    | x == y = (x, 2)
    | otherwise = ((max x y), 1)

maxOcorre3 :: Int -> Int -> Int -> (Int, Int)
maxOcorre3 a b c
    | a == b && a == c = (a, 3)
    | a == fst (maxOcorre b c) = (a, 2)
    | otherwise = (max a (fst (maxOcorre b c)), snd (maxOcorre b c))

ordenacao :: (Int, Int, Int) -> (Int, Int, Int)
ordenacao (x, y, z)
    | x > y = ordenacao (y, x, z)
    | y > z = ordenacao (x, z, y)
    | otherwise = (x, y, z)

triangulo :: Int -> Int -> Int -> (String, String)
triangulo x y z
    | (x > (y+z)) || (z > (x+y)) || (y > (x+z)) = ("Invalido", " ")
    | (x == y) && (x == z) = ("Valido", "Equilatero")
    | (x /= y) && (y /= z) && (x /= z) = ("Valido", "Escaleno")
    | otherwise = ("Valido", "Isoceles")

conversao :: Float -> ((String, Float), (String, Float), (String, Float), (String, Float))
conversao valor = if (valor < 0) then error "Nao existe dinheiro negativo" else (("Real", valor), ("Dolar", valor*0.21), ("Iene", valor*30.00), ("Euro", valor*0.19))
