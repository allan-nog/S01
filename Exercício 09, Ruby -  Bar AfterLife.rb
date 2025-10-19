class Drink
  attr_reader :nome

  def initialize(nome, preco_base)
    @nome = nome
    @preco_base = preco_base
  end

  def preco_base
    @preco_base
  end

  def preco_base=(valor)
    @preco_base = valor if valor.is_a?(Numeric) && valor.positive?
  end

  def to_s
    "Drink: #{@nome}, Preço base: $#{@preco_base}"
  end
end

class DrinkLenda < Drink
  def initialize(nome, preco_base, anos_desde_criacao)
    super(nome, preco_base)
    @anos_desde_criacao = anos_desde_criacao
  end

  def preco_final
    @preco_base + (@anos_desde_criacao * 5)
  end

  def to_s
    "Drink Lenda: #{@nome} com #{@anos_desde_criacao} anos - Preço final: $#{preco_final}"
  end
end


print "Nome do drink: "
nome = gets.chomp

print "Preço base ($): "
preco = gets.chomp.to_f

print "Anos desde a criação: "
anos = gets.chomp.to_i

drink = DrinkLenda.new(nome, preco, anos)
puts "\n#{drink}"
