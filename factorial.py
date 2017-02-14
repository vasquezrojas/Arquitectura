def factorial(valor):
	fac = 1
	for x in range(2, valor + 1):
		fac = fac * x
		print fac
	print "El factorial es: ", fac

print"PROGRAMA PARA FACTORIAL DE UN NUMERO"
print""

valor=int(raw_input("ingrese el numero a sacar el factorial: "))
factorial(valor)