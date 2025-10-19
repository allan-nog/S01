class Musico
  attr_reader :nome, :instrumento

  def initialize(nome, instrumento)
    @nome = nome
    @instrumento = instrumento
  end

  def tocar_partitura(peca)
    raise NotImplementedError, "#{self.class} deve implementar o método 'tocar_partitura'"
  end
end

class Pianista < Musico
  def tocar_partitura(peca)
    puts "#{@nome} toca a peça '#{peca}' ao piano."
  end
end

class Violinista < Musico
  def tocar_partitura(peca)
    puts "#{@nome} executa '#{peca}' ao violino."
  end
end

class Maestro
  def initialize(musicos)
    @musicos = musicos
  end

  def iniciar_ensaio(peca)
    puts "\nIniciando ensaio da peça '#{peca}' 🎶"
    @musicos.each { |m| m.tocar_partitura(peca) }
  end

  def mudar_foco(estado)
    @musicos.map { |m| "#{m.nome} agora está #{estado}!" }
  end
end

p1 = Pianista.new("Nome 1", "Piano")
v1 = Violinista.new("Nome 2", "Violino")

conjunto = [p1, v1]
maestro = Maestro.new(conjunto)

print "Nome da peça para o ensaio: "
peca = gets.chomp

maestro.iniciar_ensaio(peca)

puts "\nMudando foco dos músicos:"
puts maestro.mudar_foco("Concentrado")
