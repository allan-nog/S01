data Servico = Servico { nome :: String, tipo :: String, preco :: Double }
    deriving (Show)

data Status = EmAndamento | Finalizado | Cancelado
    deriving (Show, Eq)

data Atendimento = Atendimento { servicos :: [Servico], status :: Status }
    deriving (Show)

bonusEspiritual :: [Servico] -> Double
bonusEspiritual lista =
    let total = sum (map preco lista)
        qtd = length lista
        totalComBonus
            | qtd > 3        = total * 1.25
            | total > 500    = total * 0.9 
            | otherwise      = total
    in totalComBonus

valorFinalAtendimento :: Atendimento -> Double
valorFinalAtendimento at
    | status at == Cancelado = 0.0
    | otherwise              = bonusEspiritual (servicos at)

descricaoPrimeiroServico :: Atendimento -> String
descricaoPrimeiroServico at =
    case servicos at of
        []    -> "Nenhum serviço registrado."
        (x:_) -> nome x ++ " - " ++ tipo x

serv1 = Servico "Banho" "Banho" 150.0
serv2 = Servico "Massagem" "Massagem" 200.0
serv3 = Servico "Banquete" "Banquete" 250.0
serv4 = Servico "Relaxamento" "Banho" 180.0

at1 = Atendimento [serv1, serv2] EmAndamento
at2 = Atendimento [serv1, serv2, serv3, serv4] Finalizado
at3 = Atendimento [serv3, serv2, serv1] Cancelado

main :: IO ()
main = do
    putStr "Atendimento 1: "
    print (valorFinalAtendimento at1)
    putStrLn ("Primeiro serviço: " ++ descricaoPrimeiroServico at1)

    putStr "\nAtendimento 2: "
    print (valorFinalAtendimento at2)
    putStrLn ("Primeiro serviço: " ++ descricaoPrimeiroServico at2)

    putStr "\nAtendimento 3 (Cancelado): "
    print (valorFinalAtendimento at3)
    putStrLn ("Primeiro serviço: " ++ descricaoPrimeiroServico at3)