data Bebida = Bebida { nome :: String, tipo :: String, preco :: Double }
    deriving (Show)

data StatusPedido = Aberto | Entregue | Cancelado
    deriving (Show, Eq)

data Pedido = Pedido { bebidas :: [Bebida], status :: StatusPedido }
    deriving (Show)

precoBebida :: Bebida -> Double
precoBebida (Bebida _ _ p) = p

calcularSubtotal :: [Bebida] -> Double
calcularSubtotal lista = sum (map precoBebida lista)

valorTotalPedido :: Pedido -> Double
valorTotalPedido pedido
    | status pedido == Cancelado = 0.0
    | otherwise = subtotal + taxa
    where
        subtotal = calcularSubtotal (bebidas pedido)
        taxa = 5.0

primeiraBebida :: Pedido -> String
primeiraBebida pedido =
    case bebidas pedido of
        []    -> "Nenhuma bebida no pedido."
        (x:_) -> nome x

bebida1 = Bebida "Café Expresso" "Café" 8.0
bebida2 = Bebida "Chá Verde" "Chá" 6.0
bebida3 = Bebida "Suco de Laranja" "Suco" 10.0

pedido1 = Pedido [bebida1, bebida2] Aberto
pedido2 = Pedido [bebida3] Entregue
pedido3 = Pedido [bebida1] Cancelado

main :: IO ()
main = do
    putStr "Pedido 1 - Total: R$ "
    print (valorTotalPedido pedido1)

    putStr "Pedido 2 - Total: R$ "
    print (valorTotalPedido pedido2)

    putStr "Pedido 3 (Cancelado) - Total: R$ "
    print (valorTotalPedido pedido3)

    putStrLn "\nPrimeira bebida do Pedido 1:"
    putStrLn (primeiraBebida pedido1)