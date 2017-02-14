def suma(valor1, valor2):
	total=0
 	for x in range(valor2):
 		total = total+valor1
 	print "El total es: ", total

print"PROGRAMA PARA MULTIPLICAR DOS NUMEROS"
print""

valor1=int(raw_input("ingrese el primer numero a multiplicar: "))
valor2=int(raw_input("ingrese el segundo numero a multiplicar: "))
suma(valor1, valor2)