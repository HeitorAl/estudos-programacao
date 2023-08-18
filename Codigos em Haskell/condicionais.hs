menorif :: Int -> Int -> Int
menorif x y = if x <= y then x else y

menorif2 :: Int -> Int -> Int -> Int
menorif2 x y z = if (x < y && x < z) then x else if (y < z && y <x) then y else z

menorguarda :: Int -> Int -> Int
menorguarda x y
  | x <= y = x
  | otherwise = y

menorguarda2 :: Int -> Int -> Int -> Int
menorguarda2 x y z
  | x < y && x < z = x
  | y < x && y < z = y
  | otherwise = z

nAnd :: Bool -> Bool -> Bool
nAnd True True = False
nAnd _ _ = True

raizMaior :: Float -> Float -> Float -> Float
raizMaior a b c
  | delta < 0 = error "Raiz de delta não existe"
  | otherwise = ((-b) + sqrt delta)/(2*a)
  where delta = b^2 - 4*a*c

raizMenor :: Float -> Float -> Float -> Float
raizMenor a b c
  | delta < 0 = error "Raiz de delta não existe"
  | otherwise = ((-b) - sqrt delta)/(2*a)
  where delta = b^2 - 4*a*c

