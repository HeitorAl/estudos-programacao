infixr 8 *+
(*+) :: Int -> Int -> Int
a *+ b = 2*(a+b) 

infix 6 +- 
(+-) :: Bool -> Bool -> Bool
a +- b = a /= b

infixl 7 ^*
(^*) :: Int -> Int -> Int
a ^* b = (a*b)^2

graurad :: Float -> Float
graurad a = (a*pi)/180

sen2 :: Float -> Float
sen2 a = sin (graurad a)

cos2 :: Float -> Float
cos2 a = cos (graurad a) 
