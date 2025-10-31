class Criatura {
  constructor(nome, perigosa) {
    this.nome = nome;
    this.perigosa = perigosa;
  }
}

class Diario {
  #autorSecreto;
  #enigmas;
  #criaturasAvistadas;

  constructor(autor) {
    this.#autorSecreto = autor;
    this.#enigmas = new Map();
    this.#criaturasAvistadas = [];
  }

  getAutor() {
    return this.#autorSecreto;
  }

  adicionarEnigma(num, enigma) {
    this.#enigmas.set(num, enigma);
  }

  decodificar(chave, num) {
    if (chave !== this.#autorSecreto) {
      return "Acesso negado. Chave incorreta.";
    }

    if (!this.#enigmas.has(num)) {
      return "Enigma não encontrado.";
    }

    return `Decodificação #${num}: ${this.#enigmas.get(num)}`;
  }

  adicionarCriatura(criatura) {
    this.#criaturasAvistadas.push(criatura);
  }

  listarCriaturas() {
    return this.#criaturasAvistadas.map(c => `${c.nome} (${c.perigosa ? "Perigosa" : "Inofensiva"})`);
  }
}

class Personagem {
  constructor(nome, idade) {
    this.nome = nome;
    this.idade = idade;
  }
}

class Protagonista extends Personagem {
  constructor(nome, idade, diario) {
    super(nome, idade);
    this.diario = diario;
  }
}

class CabanaMisterio {
  constructor(diario) {
    this.diario = diario;
    this.visitantes = [];
    this.funcionarios = [];
  }

  adicionarFuncionario(personagem) {
    this.funcionarios.push(personagem);
  }

  listarFuncionarios() {
    return this.funcionarios.map(p => `${p.nome}, ${p.idade} anos`);
  }
}

const diarioDipper = new Diario("Dipper Pines");
diarioDipper.adicionarEnigma(1, "O monstro da floresta só aparece à noite.");
diarioDipper.adicionarEnigma(2, "Há um portal escondido sob o porão.");

const criatura1 = new Criatura("Gnomo", false);
const criatura2 = new Criatura("Besta Sombria", true);
diarioDipper.adicionarCriatura(criatura1);
diarioDipper.adicionarCriatura(criatura2);

const dipper = new Protagonista("Dipper", 12, diarioDipper);
const mabel = new Personagem("Mabel", 12);
const stan = new Personagem("Tio Stan", 60);

const cabana = new CabanaMisterio(diarioDipper);
cabana.adicionarFuncionario(dipper);
cabana.adicionarFuncionario(mabel);
cabana.adicionarFuncionario(stan);

console.log("Decodificação de enigmas:");
console.log(diarioDipper.decodificar("Dipper Pines", 1));
console.log(diarioDipper.decodificar("Dipper Pines", 2));
console.log(diarioDipper.decodificar("Bill Cipher", 1)); 

console.log("\nCriaturas registradas:");
console.log(diarioDipper.listarCriaturas().join("\n"));

console.log("\nFuncionários da Cabana do Mistério:");
console.log(cabana.listarFuncionarios().join("\n"));
