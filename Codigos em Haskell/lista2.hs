area_retangulo :: Int -> Int -> Int
area_retangulo x y = x*y

cambioEuro :: Float -> Float -> Float
cambioEuro x y = x*y

fahrenheitCelcius :: Float -> Float
fahrenheitCelcius x = (x-32)/1.8

saudacao :: String -> String
saudacao nome = "Ola, " ++ nome ++ ", seja bem-vindo!"

aprovacao :: Float -> String
aprovacao x = if (x>=5) then "Aluno aprovado" else "Aluno reprovado"

validar :: Float -> String
validar valor = if (valor>=0) && (valor<=10) then "Valido" else "Invalido"

mediaAritmetica :: Float -> Float -> Float -> String
mediaAritmetica n1 n2 n3
  | media >= 7.0 = "Aprovado"
  | media >= 3.0 = "Prova Final"
  | otherwise = "Reprovado"
  where
      media = (n1+n2+n3)/3.0

mediaPonderada :: Float -> Float -> Float
mediaPonderada n1 n2 = (n1*3.5+n2*7.5)/11

cargoSalario :: Int -> Float -> String
cargoSalario codigo salario =
   case codigo of
      1 -> "Escrituario, valor do aumento: " ++ show(salario*0.5) ++ "; Novo salario: " ++ show(salario*1.5)
      2 -> "Secretario, valor do aumento: " ++ show(salario*0.35) ++ "; Novo salario: " ++ show(salario*1.35)
      3 -> "Caixa, valor do aumento: " ++ show(salario*0.2) ++ "; Novo salario: " ++ show(salario*1.2)
      4 -> "Gerente, valor do aumento: " ++ show(salario*0.1) ++ "; Novo salario: " ++ show(salario*1.1)
      5 -> "Diretor, para esse cargo nao existe aumento"
      _ -> error "Nao existe cargo para esse codigo"

passagemAviao :: Int -> Float -> Float
passagemAviao idade preco_passagem
  | idade >= 60 = preco_passagem*0.6
  | idade <= 10 = preco_passagem*0.5
  | idade <= 2 = preco_passagem*0.1
  | otherwise = preco_passagem

mediaConceito :: Float -> Float -> Float -> String
mediaConceito n1 n2 n3
  | media >= 8 = "A"
  | media >= 7 = "B"
  | otherwise = "C"
  where
      media = (n1*2+n2*3+n3*5)/10
