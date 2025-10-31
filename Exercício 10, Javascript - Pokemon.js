class Pokemon {
  #vida;

  constructor(nome, tipo, vidaInicial) {
    this.nome = nome;
    this.tipo = tipo;
    this.#vida = vidaInicial;
  }

  getVida() {
    return this.#vida;
  }

  receberDano(dano) {
    this.#vida -= dano;
    if (this.#vida < 0) this.#vida = 0;
  }

  atacar(alvo) {
    console.log(`${this.nome} ataca ${alvo.nome}!`);
    alvo.receberDano(10);
  }
}

class PokemonFogo extends Pokemon {
  constructor(nome, vidaInicial, bonus) {
    super(nome, "Fogo", vidaInicial);
    this.bonusAtaque = bonus;
  }

  atacar(alvo) {
    console.log(`${this.nome} lança uma rajada de fogo em ${alvo.nome}!`);
    alvo.receberDano(15 + this.bonusAtaque);
  }
}

class PokemonAgua extends Pokemon {
  #curaBase;

  constructor(nome, vidaInicial, curaBase) {
    super(nome, "Água", vidaInicial);
    this.#curaBase = curaBase;
  }

  atacar(alvo) {
    console.log(`${this.nome} lança um jato de água em ${alvo.nome}!`);
    alvo.receberDano(12);
    console.log(`${this.nome} se cura em ${this.#curaBase} pontos.`);
  }
}

const charizard = new PokemonFogo("Charizard", 100, 5);
const blastoise = new PokemonAgua("Blastoise", 100, 3);

charizard.atacar(blastoise);
console.log(`Vida de ${blastoise.nome}: ${blastoise.getVida()}`);

blastoise.atacar(charizard);
console.log(`Vida de ${charizard.nome}: ${charizard.getVida()}`);
