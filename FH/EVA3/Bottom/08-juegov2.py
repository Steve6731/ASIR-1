#!/usr/bin/env python
# Este arquivo emprega encoding: utf-8
import RPi.GPIO as GPIO # type: ignore
import time
import random
#Definimos as funcións
def establecerSaida(pin):
	GPIO.setup(pin, GPIO.OUT)
def establecerEntrada(pin):
	GPIO.setup(pin, GPIO.IN, pull_up_down=GPIO.PUD_UP)
def acender(pin):
	GPIO.output(pin, GPIO.HIGH)
def apagar(pin):
	GPIO.output(pin, GPIO.LOW)
def lerEstado(pin):
	estado=GPIO.input(pin)
	return estado

#Definimos as variables
FIN = False

Boton1 = 3 #cable rojo
LED = 5	#led rojo
Boton2 = 7 #cable azul
punto1 = 0
punto2 = 0
partido = 1
partidoFIN = False

#ProgramaPrincipal
GPIO.setmode(GPIO.BOARD)

establecerEntrada(Boton1)
establecerEntrada(Boton2)
establecerSaida(LED)

print("Empieza el programa")
print("Game Rule:")
print("Hay 5 partido")
print("El led va apaga sobre tiempo ramdon")
print("Cuando el LED apaga Quien pulsa más rapido suma un punto ")
print("Cuando termina 5 partido quien tiene mas punto quien gana.")
input("\nCuando pulsa ENTER va empiezar el juego: ")

jugador1 = str(input("\nPon el nombre de jugador 1º: "))
jugador2 = str(input("Pon el nombre de jugador 2º: "))

while not FIN:
	print("\n",str(partido)+"º partaido:")
	print("\nEspera\n")
	acender(LED)
	tiempoApaga = random.randint(3,5)
	time.sleep(tiempoApaga)
	apagar(LED)
	print("¡¡¡¡¡¡Pulsa ahora!!!!!\n")
	while partido <= 5 and not partidoFIN: 
		estadoBoton1 = lerEstado(Boton1)
		estadoBoton2 = lerEstado(Boton2)
		if estadoBoton1 == 0 and not partidoFIN:
			punto1 = punto1 + 1
			partidoFIN = True
			print(jugador1,"gana 1 punto\n",)
		if estadoBoton2 == 0 and not partidoFIN:
			punto2 = punto2 + 1
			partidoFIN = True
			print(jugador2,"gana 1 punto\n")
	print("Punto entre dos jugadores: ",punto1," : ",punto2)
	partido = partido + 1
	if partido <= 5 and punto1 < 3 and punto2 < 3:
		partidoFIN = False
	else:
		FIN = True
		if punto1 > punto2:
			print(jugador1,"gana el juego!!!")
		else:
			print(jugador2,"gana el juego!!!")
GPIO.cleanup()
