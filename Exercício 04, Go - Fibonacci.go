package main

import "fmt"

func fibonacci(n int){
  a, b := 0, 1

  for i := 0; i < n; i++ {
      fmt.Print(a, " ")
      a, b = b, a+b
  }
}

func main(){

  var n int

  fmt.Print("Quantos números da sequência? ")
  fmt.Scanln(&n)

  fibonacci(n)

}