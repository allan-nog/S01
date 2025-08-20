10 INPUT "Digite a 1° nota:"; np1
20 INPUT "Digite a 2° nota:"; np2
30 LET media = (VAL(np1) + VAL(np2))/2

40 IF media > 60 THEN GOTO 70
50 IF media < 30 THEN GOTO 90
60 IF (media >= 30) AND (media <= 60) THEN GOTO 200

70 PRINT "Aprovado direto"
80 END

90 PRINT "Reprovado direto"
100 END

200 INPUT "Digite a nota da NP3:"; np3
210 media = (media + VAL(np3)) / 2
220 IF media >= 50 THEN PRINT "Aprovado pela NP3"
230 IF media < 50 THEN PRINT "Reprovado na NP3"
240 END