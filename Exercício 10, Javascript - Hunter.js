class IRastreavel {
  rastrearLocal(latitude, longitude) {}
}

class Hunter extends IRastreavel {
  #nome;
  #idade;
  #localizacao;

  constructor(nome, local, idade) {
    super();
    this.#nome = nome;
    this.#idade = idade;
    this.#localizacao = local;
  }

  getNome() {
    return this.#nome;
  }

  getIdade() {
    return this.#idade;
  }

  getLocalizacao() {
    return this.#localizacao;
  }

  setLocalizacao(novaLocal) {
    this.#localizacao = novaLocal;
  }

  rastrearLocal(lat, long) {
    return `${this.#nome} está na localização (${lat}, ${long}).`;
  }
}

class Especialista extends Hunter {
  #habilidadeNen;

  constructor(nome, habilidade, idade, local) {
    super(nome, local, idade);
    this.#habilidadeNen = habilidade;
  }

  rastrearLocal(lat, long) {
    this.setLocalizacao(`${lat}, ${long}`);
    return `${this.getNome()} (Especialista) usou sua habilidade "${this.#habilidadeNen}" para rastrear o local ${lat}, ${long}.`;
  }
}

class Manipulador extends Hunter {
  #alvoAtual;

  constructor(nome, idade, local, alvo = null) {
    super(nome, local, idade);
    this.#alvoAtual = alvo;
  }

  definirAlvo(hunter) {
    this.#alvoAtual = hunter;
  }

  rastrearLocal(lat, long) {
    this.setLocalizacao(`${lat}, ${long}`);
    const alvoInfo = this.#alvoAtual ? ` Alvo atual: ${this.#alvoAtual.getNome()}.` : "";
    return `${this.getNome()} (Manipulador) rastreou coordenadas ${lat}, ${long}.${alvoInfo}`;
  }
}

class Batalhao {
  #hunters;

  constructor() {
    this.#hunters = new Set();
  }

  adicionarHunter(hunter) {
    for (let h of this.#hunters) {
      if (h.getNome() === hunter.getNome()) {
        console.log('Hunter duplicado.');
        return;
      }
    }
    this.#hunters.add(hunter);
  }

  getNumHunters() {
    return this.#hunters.size;
  }

  iniciarRastreamento(lat, long) {
    const logs = [];
    for (let hunter of this.#hunters) {
      logs.push(hunter.rastrearLocal(lat, long));
    }
    return logs;
  }
}


const esp1 = new Especialista("Especialista 1", "Habilidade", 25, "Local 1");
const man1 = new Manipulador("Manipulador 1", 32, "Local 2");
const man2 = new Manipulador("Manipulador 2", 55, "Local 3");

man1.definirAlvo(man2);

const batalhao = new Batalhao();
batalhao.adicionarHunter(esp1);
batalhao.adicionarHunter(man1);
batalhao.adicionarHunter(man2);
batalhao.adicionarHunter(esp1); 

console.log(`\nTotal de Hunters: ${batalhao.getNumHunters()}`);

console.log("\nIniciando rastreamento...");
console.log(batalhao.iniciarRastreamento("30°N", "80°W").join("\n"));
