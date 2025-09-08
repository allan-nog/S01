package main

import "fmt"

func verificarLogin(usuario, senha string) bool {
  if usuario == "senha" && senha == "admin"{
    return true
  } else {
    return false
  }
}

func main(){

  var usuario, senha string

  for {
    fmt.Print("Usuário: ")
    fmt.Scanln(&usuario)
    fmt.Print("Senha: ")
    fmt.Scanln(&senha)
    if verificarLogin(usuario, senha) {
        fmt.Println("Login bem-sucedido!")
      break
    } else {
      fmt.Println("Usuário ou senha incorretos. Tente novamente.")
    }
  }

}