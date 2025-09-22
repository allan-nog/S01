#include <iostream>
using namespace std;

class Pessoa{
private:
    string nome;

public:
    Pessoa(string nome){
        this->nome = nome;
    }

    virtual ~Pessoa() {}

    void setNome(string nome){
        this->nome = nome;
    }
    string getNome(){
        return this->nome;
    }

    virtual void apresentar(){
        cout << "Olá, meu nome é " << nome << " e eu sou uma pessoa." << endl;
    }
};

class Professor : public Pessoa{
private:
    string disciplina;
public:
    Professor(string nome, string disciplina) : Pessoa(nome) {
        this->disciplina = disciplina;
    }

    string getDisciplina()  { 
        return disciplina; 
    }
    void setDisciplina(string disciplina) { 
        this->disciplina = disciplina; 
    }

    void apresentar() override{
        cout << "Olá, meu nome é " << this->getNome() << " e eu sou um professor de " << this->disciplina << endl;
    }
};

class Aluno : public Pessoa{
private:
    string curso;
    int matricula;
public:
    Aluno(string nome, string curso, int matricula) : Pessoa(nome) {
        this->curso = curso;
        this->matricula = matricula;
    }

    string getCurso()  { 
        return this->curso; 
    }
    void setCurso(string curso) {
        this->curso = curso;
    }

    int getMatricula()  { 
        return this->matricula; 
    }
    void setMatricula(int matricula) {
        this->matricula = matricula;
    }
    
    void apresentar() override{
        cout << "Olá, meu nome é " << this->getNome() << " e eu sou um aluno de " << this->curso << endl;
    }
};

int main(){

    Pessoa * pessoa1 = new Professor("Roberto", "Algoritmos II");
    Pessoa * pessoa2 = new Aluno("Alex", "Engenharia de Software", 981);

    pessoa1->apresentar();
    pessoa2->apresentar();

    delete pessoa1;
    delete pessoa2;

    return 0;

}