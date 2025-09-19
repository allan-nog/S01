#include <iostream>
using namespace std;

double celsiusParaFahrenheit(double celsius) {
    return (celsius * 9.0 / 5.0) + 32.0;
}

double celsiusParaKelvin(double celsius) {
    return celsius + 273.15;
}

int main() {
    int opcao;
    double celsius;

    do {
        cout << "\nConversor de Temperatura" << endl;
        cout << "1 - Celsius para Fahrenheit" << endl;
        cout << "2 - Celsius para Kelvin" << endl;
        cout << "3 - Sair" << endl;
        cout << "Escolha uma opcao: ";
        cin >> opcao;

        switch (opcao) {
            case 1:
                cout << "Digite a temperatura em Celsius: ";
                cin >> celsius;
                cout << celsius << "°C = "<< celsiusParaFahrenheit(celsius) << "°F" << endl;
                break;
            case 2:
                cout << "Digite a temperatura em Celsius: ";
                cin >> celsius;
                cout << celsius << "°C = " << celsiusParaKelvin(celsius) << "K" << endl;
                break;
            case 3:
                cout << "Saindo..." << endl;
                break;
            default:
                cout << "Opcao inválida! Tente novamente." << endl;
        }

    } while (opcao != 3);

    return 0;
}
