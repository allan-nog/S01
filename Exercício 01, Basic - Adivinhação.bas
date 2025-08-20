10 LET numero = RND(100) + 1
20 PRINT "====== Jogo da Adivinhação ======"
30 PRINT "Pensei em um número de 1 a 100"
40 PRINT "Digite 0 para sair"
50 PRINT "================================="
60 PRINT ""

70 INPUT "Tente adivinhar:"; tentativa

80 IF tentativa = 0 THEN GOTO 150
90 IF tentativa = numero THEN GOTO 130
100 IF tentativa > numero THEN PRINT "ERROU! O número é menor"
110 IF tentativa < numero THEN PRINT "ERROU! O número é maior"
120 GOTO 70

130 PRINT "PARABÉNS! Você acertou!"
140 GOTO 160

150 PRINT "Você desistiu do jogo!"
160 END