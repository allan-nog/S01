io.write("Início: ")
local m = tonumber(io.read())

io.write("Fim: ")
local n = tonumber(io.read())

io.write("Digite o número X: ")
local x = io.read("*n")

print("Múltiplos de " .. x .. " entre " .. m .. " e " .. n .. ":")

local encontrou = false
for i = m, n do
    if i % x == 0 then
        print(i)
        encontrou = true
    end
end

if not encontrou then
    print("Nenhum múltiplo encontrado no intervalo.")
end