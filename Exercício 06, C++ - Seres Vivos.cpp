#include <iostream>
#include <list>
using namespace std;

class SerVivo{
protected:
    string nome;

public:
    SerVivo(string nome){
        this->nome = nome;
    }

    virtual ~SerVivo() {}

    void setNome(string nome){
        this->nome = nome;
    }
    string getNome(){
        return this->nome;
    }

    virtual void apresentar(){
        cout << "Eu sou um ser vivo chamado " << nome << endl;
    }
};

class Humano : public SerVivo{
public:
    Humano(string nome) : SerVivo(nome) {}

    void apresentar() override{
        cout << "Olá, meu nome é " << nome << " e eu sou um Humano." << endl;
    }
};

class Elfo : public SerVivo{
public:
    Elfo(string nome) : SerVivo(nome) {}

    void apresentar() override{
        cout << "Olá, meu nome é " << nome << " e eu sou um Elfo." << endl;
    }
};

class Fada : public SerVivo{
public:
    Fada(string nome) : SerVivo(nome) {}

    void apresentar() override{
        cout << "Olá, meu nome é " << nome << " e eu sou uma Fada." << endl;
    }
};

int main(){

    SerVivo * servivo1 = new Humano("João");
    SerVivo * servivo2 = new Elfo("Elfo");
    SerVivo * servivo3 = new Fada("Fada");

    list<SerVivo*> seresVivos;
    seresVivos.push_back(servivo1);
    seresVivos.push_back(servivo2);
    seresVivos.push_back(servivo3);

    for(SerVivo* servivo : seresVivos){
        servivo->apresentar();
    }

    delete servivo1;
    delete servivo2;
    delete servivo3;

    return 0;

}