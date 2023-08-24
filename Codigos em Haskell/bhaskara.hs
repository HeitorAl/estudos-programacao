bhaskara :: Float -> Float -> Float -> (Float, Float)
bhaskara a b c
    | delta < 0 = error "Nao existe raiz de bhaskara para delta negativo"
    | otherwise = (bhaskaramaior, bhaskaramenor)
    where
        delta = b^2 - 4*a*c
        bhaskaramaior = ((-b) + sqrt delta)/(2*a)
        bhaskaramenor = ((-b) - sqrt delta)/(2*a)
