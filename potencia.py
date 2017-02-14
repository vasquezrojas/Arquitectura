def suma(valor1, valor2):
	total=0
 	for x in range(valor2):
 		total = total + valor1
 		print "Valor total: ", total
 	return total

def potencia(num, pot):
 	z = 0
 	for x in range(pot):
 		print "valor de x: ", x
 		z = z + suma(num, num)
 		print "valor de z: ", z
 	print "la potencia es ", z

print"PROGRAMA PARA POTENCIA"
print""

num=int(raw_input("ingrese el numero: "))
pot=int(raw_input("ingrese la potencia: "))
potencia(num, pot)