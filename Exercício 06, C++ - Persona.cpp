#include <iostream>
using namespace std;

class Pessoa{
private:
    string nome;
    int idade;

public:
    Pessoa(string nome, int idade){
        this->nome = nome;
        this->idade = idade;
    }

    void setNome(string nome){
        this->nome = nome;
    }
    string getNome(){
        return this->nome;
    }

    void setIdade(int idade){
        this->idade = idade;
    }
    int getIdade(){
        return this->idade;
    }
};

class Protagonista : public Pessoa{
private:
    int nivel;
public:
    Protagonista(string nome, int idade, int nivel) : Pessoa(nome, idade) {
        this->nivel = nivel;
    }

    int getNivel()  { 
        return nivel; 
    }
    void setNivel(int nivel) { 
        this->nivel = nivel; 
    }
};

class Personagem : public Pessoa{
private:
    int rank;
public:
    Personagem(string nome, int idade, int rank) : Pessoa(nome, idade) {
        if (rank >= 0 && rank <= 10) {
            this->rank = rank;
        } else {
            this->rank = 0; 
        }
    }

    int getRank()  { 
        return rank; 
    }
    void setRank(int rank) {
        if (rank >= 0 && rank <= 10) {
            this->rank = rank;
        }
    }
};

int main(){

    Protagonista protagonista("Protagonista", 22, 8);
    Personagem personagem("Personagem", 18, 7);

    cout << "Protagonista: " << endl;
    cout << "Nome: " << protagonista.getNome() << " | Idade: " << protagonista.getIdade() << " | Nível: " << protagonista.getNivel() << endl;

    cout << "\nPersonagem: " << endl;
    cout << "Nome: " << personagem.getNome() << " | Idade: " << personagem.getIdade() << " | Rank: " << personagem.getRank() << endl;

    return 0;

}