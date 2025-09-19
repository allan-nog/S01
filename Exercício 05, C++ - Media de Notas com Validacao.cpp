#include <iostream>
using namespace std;

int main() {

    int quantidade;
    float nota, soma = 0;

    cout << "Quantas notas deseja inserir? ";
    cin >> quantidade;
    for (int i = 1; i <= quantidade; i++) {
        cout << "Digite a nota " << i << ": ";
        cin >> nota;

        while (nota < 0 || nota > 10) {
            cout << "Nota inválida! Digite novamente: ";
            cin >> nota;
        }

        soma += nota;
    }
    
    float media = soma / quantidade;
    cout << "Média final: " << media << endl;

    if (media >= 7) {
        cout << "Aluno Aprovado!" << endl;
    } else {
        cout << "Aluno Reprovado!" << endl;
    }

    return 0;

}
