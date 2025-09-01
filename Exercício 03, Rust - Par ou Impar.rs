use std::io;

fn eh_par(numero: i32) -> bool {
    return numero % 2 == 0
}

fn main() {
    println!("[1] - Par\n[2] - Ímpar\nEscolha:");
    let mut op = String::new();
    io::stdin().read_line(&mut op).expect("Falha ao ler entrada");
    let opcao: i32 = op.trim().parse().expect("Por favor, digite um número válido");

    println!("Digite o primeiro número: ");
    let mut num1_str = String::new();
    io::stdin().read_line(&mut num1_str).expect("Falha ao ler entrada");
    let num1: i32 = num1_str.trim().parse().expect("Por favor, digite um número válido");

    println!("Digite o segundo número: ");
    let mut num2_str = String::new();
    io::stdin().read_line(&mut num2_str).expect("Falha ao ler entrada");
    let num2: i32 = num2_str.trim().parse().expect("Por favor, digite um número válido");

    let soma = num1 + num2;
    println!("A soma dos números {} e {} é {}", num1, num2, soma);

    if (eh_par(soma) && opcao == 1) || (!eh_par(soma) && opcao == 2) {
        println!("O jogador 1 ganhou!");
    } else {
        println!("O jogador 2 ganhou!");
    }
}
