local function calculadora(num1, num2, op)
  if op == "+" then
    return num1 + num2
  elseif op == "-" then
    return num1 - num2
  elseif op == "*" then
    return num1 * num2
  elseif op == "/" then
    if num2 == 0 then
      print("Erro: divisão por zero!")
      return nil
    end
    return num1 / num2
  else
    print("Operação inválida!")
    return nil
  end
end

io.write("Digite o primeiro número: ")
local num1 = tonumber(io.read())
io.write("Digite o segundo número: ")
local num2 = tonumber(io.read())
io.write("Digite a operação (+, -, *, /): ")
local op = io.read()

local resultado = calculadora(num1, num2, op)
if resultado then
    print("O resultado de " .. num1 .. " " .. op .. " " .. num2 .. " é " .. resultado)
end