#include <iostream>
using namespace std;

class Personagem{
public:
    string nome;
    int nivel;
    int dano;
    int vida;

    Personagem(string nome, int nivel, int dano, int vida){
        this->nome = nome;
        this->nivel = nivel;
        this->dano = dano;
        this->vida = vida;
    }

    void atacar(Personagem &alvo){
        cout << this->nome << " está atacando " << alvo.nome << endl;
        cout << "Casou " << this->dano << " de dano!" << endl;
        alvo.vida -= this->dano;
    }

    void mostrarInfo(){
        cout << "Personagem: " << this->nome 
             << " | Nível: " << this->nivel 
             << " | Dano: " << this->dano 
             << " | Vida: " << this->vida << endl;
    }
};

int main(){

    Personagem jogador1("Jogador 1", 5, 20, 100);
    Personagem jogador2("Jogador 2", 6, 25, 120);

    cout << "Status Inicial" << endl;
    jogador1.mostrarInfo();
    jogador2.mostrarInfo();
    cout << endl;

    jogador1.atacar(jogador2);

    cout << endl << "Status Após Combate" << endl;
    jogador1.mostrarInfo();
    jogador2.mostrarInfo();

    return 0;

}