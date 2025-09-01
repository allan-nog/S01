use std::io;

fn verificar_senha(senha: &str) -> bool{
  if senha.len() >= 8 && senha.chars().any(|c| c.is_ascii_digit()) && senha.chars().any(|c| c.is_ascii_uppercase()) {
    return true
  }
  return false
}

fn main(){
  println!("Digite sua senha: ");
  let mut senha = String::new();
  io::stdin().read_line(&mut senha).expect("Falha ao ler a senha");
  senha = senha.trim().to_string();

  loop {
    if verificar_senha(&senha) == true {
      println!("Senha válida! Acesso concedido.");
      break;
    } else {
      println!("Senha inválida. Tente novamente: ");
      senha = String::new();
      io::stdin().read_line(&mut senha).expect("Falha ao ler a senha");
      senha = senha.trim().to_string();
    }
  }
}