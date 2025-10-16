from abc import ABC, abstractmethod

class Cibernetico(ABC):
    @abstractmethod
    def realizar_hack(self):
        pass

class Implante:
    def __init__(self, custo: int, funcao: str):
        self.custo = custo
        self.funcao = funcao

class NetRunner(Cibernetico):
    def __init__(self, nome: str, custo_implante: int, funcao_implante: str):
        self.nome = nome
        self.implante = Implante(custo_implante, funcao_implante)

    def realizar_hack(self):
        print(f"{self.nome} realiza um hack usando '{self.implante.funcao}' (custo: {self.implante.custo})")

class Faccao:
    def __init__(self, membros: list[Cibernetico]):
        self.membros = membros

    def comandar_hacks(self):
        for membro in self.membros:
            membro.realizar_hack()

if __name__ == "__main__":
    nr1 = NetRunner("Nome 1", 70, "Função")
    nr2 = NetRunner("Nome 2", 40, "Função")
    nr3 = NetRunner("Nome 2", 90, "Função")

    faccao = Faccao([nr1, nr2, nr3])
    faccao.comandar_hacks()
