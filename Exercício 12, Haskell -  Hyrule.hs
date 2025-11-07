data Item = Item {
    nome :: String,
    categoria :: String,
    preco :: Double
} deriving (Show)

data CompraZelda = CompraZelda {
    itens :: [Item]
} deriving (Show)

calculaDesconto :: [Item] -> Double
calculaDesconto lista
    | total > 200 = total * 0.9
    | otherwise   = total
    where total = sum [preco i | i <- lista]

valorFinal :: CompraZelda -> Double
valorFinal (CompraZelda lista)
    | total > 200 = total
    | otherwise   = total + 15.0
    where total = calculaDesconto lista

main :: IO ()
main = do
    let item1 = Item "Espada de Ferro" "Arma" 150.0
    let item2 = Item "Pocao de Vida" "Pocao" 60.0
    let item3 = Item "Escudo" "Equipamento" 40.0

    let compra1 = CompraZelda [item1, item2] 
    let compra2 = CompraZelda [item3]   
    
    putStrLn "----- COMPRA 1 -----"
    print (itens compra1)
    putStrLn ("Valor final: " ++ show (valorFinal compra1))

    putStrLn "\n----- COMPRA 2 -----"
    print (itens compra2)
    putStrLn ("Valor final: " ++ show (valorFinal compra2))