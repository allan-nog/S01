#include <iostream>
using namespace std;

float somarArray(float arr[], int tamanho){
    float soma = 0.0;
    for (int i = 0; i < tamanho; i++) {
        soma += arr[i];
    }
    return soma;
}

int main() {

    int n;

    cout << "Digite o tamanho do array: ";
    cin >> n;

    float arr[n]; 

    for (int i = 0; i < n; i++) {
        cout << "Elemento " << i+1 << ": ";
        cin >> arr[i];
    }

    float resultado = somarArray(arr, n);

    cout << "A soma dos elementos do array é: " << resultado << endl;

    return 0;
}