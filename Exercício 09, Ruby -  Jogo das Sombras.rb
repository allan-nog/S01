module Rastreavel
  def obter_localizacao(hora)
    "#{@nome} foi localizado às #{hora} em #{@localizacao}."
  end
end

module Perigoso
  def calcular_risco
    "Nível de risco de #{@nome}: #{@nivel_perigo}"
  end
end

class Participante
  attr_accessor :nome, :localizacao

  def initialize(nome)
    @nome = nome
  end

  def to_s
    "#{@nome}"
  end
end

class Detetive < Participante
  include Rastreavel

  def initialize(nome)
    super(nome)
  end
end

class MestreDoCrime < Participante
  include Rastreavel
  include Perigoso

  def initialize(nome, nivel_perigo)
    super(nome)
    @nivel_perigo = nivel_perigo
  end
end

class Cenario
  def initialize(participantes = [])
    @participantes = participantes
  end

  def identificar_ameacas
    @participantes.select { |p| p.respond_to?(:calcular_risco) }
  end

  def listar_localizacoes(hora)
    @participantes.each do |p|
      puts p.obter_localizacao(hora) if p.respond_to?(:obter_localizacao)
    end
  end
end

print "Localização atual de Sherlock: "
loc_sherlock = gets.chomp
print "Localização atual de Moriarty: "
loc_moriarty = gets.chomp

sherlock = Detetive.new("Sherlock Holmes")
sherlock.localizacao = loc_sherlock

moriarty = MestreDoCrime.new("Moriarty", "Extremo")
moriarty.localizacao = loc_moriarty

cenario = Cenario.new([sherlock, moriarty])

print "\nHorário da verificação: "
hora = gets.chomp

puts "\n--- Rastreamento ---"
cenario.listar_localizacoes(hora)

puts "\n--- Ameaças Detectadas ---"
cenario.identificar_ameacas.each do |a|
  puts a.calcular_risco
end