class ArmaCorpoACorpo:
    def __init__(self, nome: str, dano: int):
        self.nome = nome
        self.dano = dano

    def __str__(self):
        return f"{self.nome} (Dano: {self.dano})"


class PhantomThieves:
    def __init__(self, nome: str, arma: ArmaCorpoACorpo):
        self.nome = nome
        self.arma = arma

    def __str__(self):
        return f"{self.nome} com {self.arma}"


class Joker:
    def __init__(self, equipe: list[PhantomThieves]):
        self.arma = ArmaCorpoACorpo("Faca", 35)
        self.equipe = equipe

    def mostrar_equipe(self):
        print("Equipe:")
        for membro in self.equipe:
            print(f" - {membro}")


if __name__ == "__main__":
    arma1 = ArmaCorpoACorpo("Arma 1", 15)
    arma2 = ArmaCorpoACorpo("Arma 2", 20)
    arma3 = ArmaCorpoACorpo("Arma 3", 18)

    membro1 = PhantomThieves("Membro 1", arma1)
    membro2 = PhantomThieves("Membro 2", arma2)
    membro3 = PhantomThieves("Membro 3", arma3)

    equipe = [membro1, membro2, membro3]

    joker = Joker(equipe)
    joker.mostrar_equipe()