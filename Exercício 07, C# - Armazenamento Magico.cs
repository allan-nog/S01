using System;
using System.Collections.Generic;

public class Feitico {
  public string Nome { get; set; }

  public Feitico(string nome) {
    Nome = nome;
    Console.WriteLine($"[Feitiço] \"{Nome}\" foi aprendido!");
  }
}

public class Grimorio {
  private List<Feitico> _feiticos;

  public Grimorio() {
    _feiticos = new List<Feitico>();
    Console.WriteLine("[Grimório] Um novo grimório mágico foi criado.");
  }

  public void AdicionarFeitico(Feitico f) {
    _feiticos.Add(f);
    Console.WriteLine($"[Grimório] O feitiço \"{f.Nome}\" foi adicionado ao grimório.");
  }

  public void ListarFeiticos() {
    Console.WriteLine("\nFeitiços no Grimório:");
    foreach (var f in _feiticos) {
      Console.WriteLine($"- {f.Nome}");
    }
  }
}

public class Ferramenta {
  public string Nome { get; set; }

  public Ferramenta(string nome) {
    Nome = nome;
    Console.WriteLine($"[Ferramenta] {Nome} foi adicionada à mochila.");
  }
}

public class Maga {
  public string Nome { get; set; } = "Frieren";

  private Grimorio _grimorio;

  private List<Ferramenta> _ferramentas;

  public Maga(List<Ferramenta> ferramentas) {
    _grimorio = new Grimorio(); 
    _ferramentas = ferramentas; 
    Console.WriteLine($"\n[Maga] {Nome} está pronta para a jornada!");
  }

  public void AprenderFeitico(string nomeFeitico) {
    _grimorio.AdicionarFeitico(new Feitico(nomeFeitico));
  }

  public void MostrarFerramentas() {
    Console.WriteLine("\nFerramentas de Sobrevivência:");
    foreach (var f in _ferramentas) {
      Console.WriteLine($"- {f.Nome}");
    }
  }

  public void MostrarGrimorio() {
    _grimorio.ListarFeiticos();
  }
}

class Program {
  public static void Main(string[] args) {
    List<Ferramenta> ferramentasFrieren = new List<Ferramenta>() {
      new Ferramenta("Lanterna"),
      new Ferramenta("Capacete"),
    };
    
    Maga frieren = new Maga(ferramentasFrieren);

    frieren.AprenderFeitico("Feitiço 1");
    frieren.AprenderFeitico("Feitiço 2");

    frieren.MostrarFerramentas();
    frieren.MostrarGrimorio();
  }
}
