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

local function filtrarPares(tabela)
  local pares = {}
  for i = 1, #tabela do
    if tabela[i] % 2 == 0 then
      table.insert(pares, tabela[i])
    end
  end
  return pares
end

local tabelaPares = filtrarPares(numeros)

print("Números pares encontrados:")
for i, v in ipairs(tabelaPares) do
    print(v)
end