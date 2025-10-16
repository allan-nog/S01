from abc import ABC

class Personagem(ABC):
    def __init__(self, vida: int, resistencia: int):
        self._vida = vida
        self._resistencia = resistencia

    def get_vida(self):
        return self._vida

    def set_vida(self, nova_vida):
        if nova_vida >= 0:
            self._vida = nova_vida
        else:
            print("A vida não pode ser negativa.")

    def __str__(self):
        return f"Personagem com {self._vida} de vida e {self._resistencia} de resistência"


class Cavaleiro(Personagem):
    def __init__(self, vida: int, resistencia: int, armadura_pesada: bool):
        Personagem.__init__(self, vida, resistencia)
        self.armadura_pesada = armadura_pesada

    def __str__(self):
        return f"Cavaleiro com {self._vida} de vida, {self._resistencia} de resistência e armadura pesada: {self.armadura_pesada}"


if __name__ == "__main__":
    p1 = Personagem(100, 50)
    c1 = Cavaleiro(120, 70, True)

    print(p1)
    print(c1)

    c1.set_vida(90)
    print("Vida atualizada:", c1.get_vida())
