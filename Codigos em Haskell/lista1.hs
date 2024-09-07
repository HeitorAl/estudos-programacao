saudacao :: String -> String
saudacao nome = 
   "Ola, " ++ nome ++ ", boa tarde!"
   
delta :: Float -> Float -> Float -> Float
delta a b c = b*b - 4*a*c   

baskharaMaior :: Float -> Float -> Float -> Float
baskharaMaior a b c 
   | meu_delta >= 0 = ((-b) + sqrt (meu_delta))/ (2 * a) 
   | otherwise = error "Equação não possui raiz"
   where meu_delta = delta a b c
   
baskharaMenor :: Float -> Float -> Float -> Float
baskharaMenor a b c =
   if (meu_delta >= 0) then
      ((-b) - sqrt (meu_delta))/ (2 * a) 
   else 
      error "Equação não possui raiz"
   where meu_delta = delta a b c
   
resultado2 :: Float -> Float -> String    
resultado2 salario aumento = 
   "Valor do aumento: " ++ show (salario*aumento) ++ 
   ". \nNovo salario: " ++ show (salario*(1+aumento)) ++ ".\n"

promocao :: Int -> Float -> String
promocao codigo salario = 
   "Este(a) funcionario(a) e um " ++
   case codigo of
   1-> "Escriturario. " ++ resultado salario 0.5
   2-> "Secretario(a). "++ resultado salario 0.35
   3-> "Caixa. "        ++ resultado salario 0.2
   4-> "Gerente. "      ++ resultado salario 0.1
   5-> "Diretor. "      ++ resultado salario 0.0
   _-> error "Código inválido"
   where resultado :: Float -> Float -> String    
         resultado salario aumento = 
           "Valor do aumento: " ++ show (salario*aumento) ++ 
           ". \nNovo salario: " ++ show (salario*(1+aumento)) ++ ".\n"

