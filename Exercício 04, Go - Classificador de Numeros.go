package main

import "fmt"

func classificar_numero(num int) string{
  if num == 0{
    return "Zero"
  } else if num > 0{
    return "Positivo"
  } else {
    return "Negativo"
  }
}

func main(){
  
  var num int

  fmt.Print("Digite um número: ")
  fmt.Scanln(&num)

  fmt.Println("O número é", classificar_numero(num))
  
}