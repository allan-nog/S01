using System;
using System.Collections.Generic;

public class Pokemon {
  public string Nome { get; set; }

  public Pokemon(string nome) {
    this.Nome = nome;
    Console.WriteLine($"[Novo Pokémon] {Nome} foi adicionado à Pokédex!");
  }

  public virtual void Atacar() {
    Console.WriteLine($"\n{Nome} usa um ataque genérico...");
  }
}

public class PokemonDeFogo : Pokemon {
  public PokemonDeFogo(string nome) : base(nome) {}

  public override void Atacar() {
    Console.WriteLine($"\n{Nome} lança uma labareda de fogo!");
  }
}

public class PokemonDeAgua : Pokemon {
  public PokemonDeAgua(string nome) : base(nome) {}

  public override void Atacar() {
    Console.WriteLine($"\n{Nome} dispara um jato de água!");
  }
}

class Program {
  public static void Main(string[] args) {

    List<Pokemon> equipe = new List<Pokemon>();

    Pokemon charizard = new PokemonDeFogo("Charizard");
    Pokemon blastoise = new PokemonDeAgua("Blastoise");

    equipe.Add(charizard);
    equipe.Add(blastoise);

    foreach (var pokemon in equipe) {
      pokemon.Atacar();
    }
  }
}
