mudaTupla :: (Int,Int) -> (Int,Int)
mudaTupla (x,y) = (x, x+y)

inLista :: (Int,Int) -> [(Int,Int)] -> Bool
inLista _ [] = False
inLista x (y:ys)
    | x == y = True
    | otherwise = inLista x ys

atualizaLista :: (Int,Int) -> [(Int,Int)] -> [(Int,Int)]
atualizaLista (a,b) ((m,n):ls) =
    if (inLista (a,b) ((m,n):ls))
        then atualiza (a,b) ((m,n):ls)
        else (a,b):((m,n):ls)

atualiza :: (Int, Int) -> [(Int, Int)] -> [(Int, Int)]
atualiza _ [] = []
atualiza (a,b) ((m,n):ls) 
    | (a,b) == (m,n) = mudaTupla (m,n): atualiza (a,b) ls
    | otherwise = (m,n): atualiza (a,b) ls
