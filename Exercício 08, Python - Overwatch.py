from abc import ABC, abstractmethod

class Heroi(ABC):
    def __init__(self, nome: str, funcao: str):
        self.nome = nome
        self.funcao = funcao

    @abstractmethod
    def usar_ultimate(self):
        pass

    def __str__(self):
        return f"{self.nome} ({self.funcao})"


class Tanque(Heroi):
    def __init__(self, nome: str):
        Heroi.__init__(self, nome, "Tanque")

    def usar_ultimate(self):
        print(f"{self.nome} ativa o escudo impenetrável!")


class Dano(Heroi):
    def __init__(self, nome: str):
        Heroi.__init__(self, nome, "Dano")

    def usar_ultimate(self):
        print(f"{self.nome} dispara uma rajada devastadora!")


if __name__ == "__main__":
    herois = [
        Tanque("Reinhardt"),
        Dano("Soldado: 76"),
        Dano("Ashe")
    ]

    for heroi in herois:
        print(heroi)
        heroi.usar_ultimate()

