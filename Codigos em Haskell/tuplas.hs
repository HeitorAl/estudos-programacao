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
