raizmaior :: Float -> Float -> Float -> Float
raizmaior a b c
  | delta < 0 = -1
  | otherwise ((-b) + sqrt delta)/(2*a)
      where delta = b^2 - 4*a*c

raizmenor :: Float -> Float -> Float -> Float
raizmenor a b c
  | delta < 0 = -1
  | otherwise = ((-b) - sqrt delta)/(2*a)
      where delta = b^2 - 4*a*c