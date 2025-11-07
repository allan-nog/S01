data Banda = Banda {
    nome :: String,
    genero :: String,
    cache :: Double
} deriving (Show)

data Status = Ativo | Encerrado | Cancelado deriving (Show, Eq)

data Evento = Evento {
    bandas :: [Banda],
    status :: Status
} deriving (Show)

custoTotalEvento :: Evento -> Double
custoTotalEvento (Evento _ Cancelado) = 0.0
custoTotalEvento (Evento lista _) =
    let total = sum [cache b | b <- lista]
    in total * 1.2

bandaAbertura :: Evento -> String
bandaAbertura (Evento [] _) = "Nenhuma banda para abrir o evento."
bandaAbertura (Evento (b:_) _) = "Banda de abertura: " ++ nome b

bandaEncerramento :: Evento -> String
bandaEncerramento (Evento [] _) = "Nenhuma banda para encerrar o evento."
bandaEncerramento (Evento lista _) = "Banda de encerramento: " ++ nome (last lista)

main :: IO ()
main = do
    let b1 = Banda "Banda de Rock" "Rock" 8000.0
    let b2 = Banda "Banda de Jazz" "Jazz" 5000.0
    let b3 = Banda "Banda de Eletronica" "Eletronica" 6000.0
    let b4 = Banda "Banda de Pop" "Pop" 4000.0

    let eventoAtivo = Evento [b1, b2, b3] Ativo
    let eventoEncerrado = Evento [b4, b3] Encerrado
    let eventoCancelado = Evento [b1, b4] Cancelado

    putStrLn "----- EVENTO ATIVO -----"
    print (bandas eventoAtivo)
    putStrLn (bandaAbertura eventoAtivo)
    putStrLn (bandaEncerramento eventoAtivo)
    putStrLn ("Custo total: R$ " ++ show (custoTotalEvento eventoAtivo))

    putStrLn "\n----- EVENTO ENCERRADO -----"
    print (bandas eventoEncerrado)
    putStrLn (bandaAbertura eventoEncerrado)
    putStrLn (bandaEncerramento eventoEncerrado)
    putStrLn ("Custo total: R$ " ++ show (custoTotalEvento eventoEncerrado))

    putStrLn "\n----- EVENTO CANCELADO -----"
    print (bandas eventoCancelado)
    putStrLn (bandaAbertura eventoCancelado)
    putStrLn (bandaEncerramento eventoCancelado)
    putStrLn ("Custo total: R$ " ++ show (custoTotalEvento eventoCancelado))