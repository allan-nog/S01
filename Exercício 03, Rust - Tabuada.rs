use std::io;

fn imprimir_tabuada(numero: i32, limite_inferior: i32, limite_superior: i32) {
  for i in limite_inferior..=limite_superior {
      println!("{} x {} = {}", numero, i, numero*i);
  }
}

fn main(){
  println!("Número da tabuada: ");
  let mut num = String::new();
  io::stdin().read_line(&mut num).expect("Falha ao ler entrada");
  let numero: i32 = num.trim().parse().expect("Por favor, digite um número válido");

  println!("Limite inferior: ");
  let mut inf = String::new();
  io::stdin().read_line(&mut inf).expect("Falha ao ler entrada");
  let limite_inferior: i32 = inf.trim().parse().expect("Por favor, digite um número válido");

  println!("Limite superior: ");
  let mut sup = String::new();
  io::stdin().read_line(&mut sup).expect("Falha ao ler entrada");
  let limite_superior: i32 = sup.trim().parse().expect("Por favor, digite um número válido");

  imprimir_tabuada(numero, limite_inferior, limite_superior);
}