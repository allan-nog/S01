class MicroondasUnidade
  def aquecer_por(segundos)
    puts "Aquecendo por #{segundos} segundos"
  end
end

class DMail
  attr_reader :conteudo, :hora_envio

  def initialize(conteudo, hora_envio)
    @conteudo = conteudo
    @hora_envio = hora_envio
  end

  def to_s
    "D-Mail: '#{@conteudo}' enviado às #{@hora_envio}"
  end
end

class TelefoneDeMicroondas
  def initialize
    @unidade = MicroondasUnidade.new 
    @dmails = []                    
  end

  def enviar_dmail
    print "Conteúdo do D-Mail: "
    conteudo = gets.chomp
    print "Hora de envio (ex: 10:30): "
    hora = gets.chomp

    @unidade.aquecer_por(5)
    dmail = DMail.new(conteudo, hora)
    @dmails << dmail

    puts "D-Mail enviado!"
  end

  def listar_dmails(horario_corte)
    puts "\nD-Mails após #{horario_corte}:"
    filtrados = @dmails.select { |d| d.hora_envio > horario_corte }
    if filtrados.empty?
      puts "Nenhum D-Mail encontrado."
    else
      filtrados.each { |d| puts d }
    end
  end
end

telefone = TelefoneDeMicroondas.new

puts "\n--- Envio de D-Mails ---"
telefone.enviar_dmail
telefone.enviar_dmail

print "\nHorário de corte para listar D-Mails: "
corte = gets.chomp
telefone.listar_dmails(corte)