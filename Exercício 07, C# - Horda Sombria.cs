using System;

public abstract class MonstroSombrio {
  public string Nome { get; set; }

  public MonstroSombrio(string nome) {
    Nome = nome;
    Console.WriteLine($"[Monstro] {Nome} criado...");
  }

  public virtual void Mover() {
    Console.WriteLine($"{Nome} se move...");
  }
}

public class Zumbi : MonstroSombrio {
  public Zumbi(string nome) : base(nome) {}

  public override void Mover() {
    Console.WriteLine($"\n{Nome} move em sua direção...");
  }
}

public class Espectro : MonstroSombrio {
  public Espectro(string nome) : base(nome) {}

  public override void Mover() {
    Console.WriteLine($"\n{Nome} desliza rapidamente!");
  }
}

class Program {
  public static void Main(string[] args) {
    MonstroSombrio[] horda = new MonstroSombrio[3];
    horda[0] = new Zumbi("Zumbi Lento");
    horda[1] = new Espectro("Espectro Rápido");
    horda[2] = new Zumbi("Zumbi Faminto");

    foreach (MonstroSombrio monstro in horda) {
      monstro.Mover();
    }
  }
}
