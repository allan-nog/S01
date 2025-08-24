local numeros = {}
local numero

while true do
    io.write("Digite um número (0 para parar): ")
    numero = io.read("*n")
    if numero == 0 then
        break
    end
    table.insert(numeros, numero)
end

local function maiorElemento(tabela)
    local maior = tabela[1]
    for i = 2, #tabela do
        if tabela[i] > maior then
            maior = tabela[i]
        end
    end
    return maior
end

local maior = maiorElemento(numeros)
print("O maior valor é: " .. maior)