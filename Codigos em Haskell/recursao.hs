mult2 :: Int -> Int -> Int
mult2 0 _ = 0
mult2 _ 0 = 0
mult2 a b = a + mult a (b-1)

mult :: Int -> Int -> Int
mult a b = if (b>0) then mult2 a b else -mult2 a (-b)

pot2 :: Int -> Int
pot2 0 = 1
pot2 x = 2*pot2 (x-1)

pot :: Int -> Int -> Int
pot _ 0 = 1
pot m n = m* pot m (n-1)

fat :: Int -> Int
fat 0 = 1
fat a = a*fat (a-1)

somafat :: Int -> Int
somafat 0 = 1
somafat a = fat a + somafat (a-1)
 
somapot2 :: Int -> Int
somapot2 0 = 0
somapot2 x = pot2 x + somapot2 (x-1)

seriefat :: Int -> Double 
seriefat 1 = 1
seriefat n = 1/fromIntegral(fat (n-1)) + seriefat(n-1)

quociente :: Int -> Int -> Int
quociente x y
    | x < y = 0
    | otherwise = 1 + quociente (x-y) y

resto :: Int -> Int -> Int
resto x y
    | x < y = x
    | otherwise = resto (x-y) y

somarecursiva :: Int -> Int -> Int
somarecursiva a b
    | b < 0 = -somarecursiva (-a) (-b) 
    | b == 0 = a
    | otherwise = somarecursiva (succ a) (pred b)

fatorial_duplo :: Int -> Int
fatorial_duplo a
    | (a == 1) || (a == 0) = 1
    | otherwise = a * fatorial_duplo (a-2)

produto_intervalo :: Float -> Float -> Float
produto_intervalo m n
    | (m == n+1) = 1
    | (m > n) = produto_intervalo n m
    | otherwise = m * produto_intervalo (m+1) n

raiz :: Int -> Int
raiz n
    | n <= 1 = 0 
    | otherwise = 1 + raiz (div n 2)

raiz_inteira :: Int -> Int
raiz_inteira n
    | n < 0 = error "Nao existe raiz de numero negativo"
    | n == 1 = 1
    | n == 0 = 0
    | otherwise = raiz n
