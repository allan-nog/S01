class IExplorador {
  explorarTerritorio() {}
}

class ODM_Gear {
  #gasRestante;

  constructor(modelo) {
    this.modelo = modelo;
    this.#gasRestante = 100;
  }

  usarGas(quantidade) {
    this.#gasRestante -= quantidade;
    if (this.#gasRestante < 0) this.#gasRestante = 0;
  }

  getGas() {
    return this.#gasRestante;
  }
}

class Soldado extends IExplorador {
  #gear;

  constructor(nome, modeloGear) {
    super();
    this.nome = nome;
    this.#gear = new ODM_Gear(modeloGear);
  }

  explorarTerritorio() {
    this.#gear.usarGas(10);
    return `${this.nome} está explorando o território.`;
  }

  verificarEquipamento() {
    return `Gear: ${this.#gear.modelo}, Gás: ${this.#gear.getGas()}`;
  }
}

class Esquadrao {
  constructor(lider, membrosIniciais = []) {
    this.lider = lider;
    this.membros = membrosIniciais;
  }

  adicionarMembro(soldado) {
    this.membros.push(soldado);
  }

  explorarTerritorio() {
    return this.membros.map(s => s.explorarTerritorio());
  }

  relatarStatus() {
    return this.membros.map(s => `${s.nome} - ${s.verificarEquipamento()}`);
  }
}

const soldado1 = new Soldado("Soldado 1", "Modelo A");
const soldado2 = new Soldado("Soldado 2", "Modelo B");
const soldado3 = new Soldado("Soldado 3", "Modelo C");

const esquadrao = new Esquadrao(soldado1, [soldado2, soldado3]);

console.log(esquadrao.explorarTerritorio().join("\n"));

console.log(esquadrao.relatarStatus().join("\n"));
