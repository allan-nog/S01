10 INPUT "Digite a temperatura em grus Celsius:"; celsius
20 LET kelvin = VAL(celsius) + 273.15
30 LET fahrenheit = (celsius * 1.8) + 32
40 PRINT "Celsius = " + celsius + "°C"
50 PRINT "Kelvin = " + kelvin + "K"
60 PRINT "Fahrenheit = " + fahrenheit + "°F"
70 END