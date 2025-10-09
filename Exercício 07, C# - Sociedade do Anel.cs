using System;

public class MembroDaSociedade {
  private string _nome;
  private string _raca;
  private string _funcao;

  public MembroDaSociedade(string nome, string raca, string funcao) {
    _nome = nome;
    _raca = raca;
    _funcao = funcao;
    Console.WriteLine($"[Novo Membro] {_nome} foi adicionado à Sociedade do Anel!");
  }

  public void Descrever() {
    Console.WriteLine($"Nome: {_nome}");
    Console.WriteLine($"Raça: {_raca}");
    Console.WriteLine($"Função: {_funcao}");
  }
}

class Program {
  public static void Main(string[] args) {
    MembroDaSociedade aragorn = new MembroDaSociedade("Aragorn", "Humano", "Guardião");
    MembroDaSociedade legolas = new MembroDaSociedade("Legolas", "Elfo", "Arqueiro");

    aragorn.Descrever();
    legolas.Descrever();
  }
}
