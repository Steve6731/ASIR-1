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
partidoFin = False

#ProgramaPrincipal
GPIO.setmode(GPIO.BOARD)

establecerEntrada(Boton1)
establecerEntrada(Boton2)
establecerSaida(LED)

print("Empieza el programa")
print("Game Rule:")
print("El led va apaga sobre tiempo ramdon")
print("Quien pulsa más rapido quien va ganar")
input("Cuando pulsa ENTER va empiezar el juego: ")

while not FIN:
	print("Seguiente partaido:")
	print("Espera\n")
	acender(LED)
	tiempoApaga = random.randint(3,5)
	time.sleep(tiempoApaga)
	apagar(LED)
	print("¡¡¡¡¡¡Pulsa ahora!!!!!\n")
	while not partidoFin: 
		estadoBoton1 = lerEstado(Boton1)
		estadoBoton2 = lerEstado(Boton2)
		if estadoBoton1 == 0 and not partidoFin:
			punto1 = punto1 + 1
			partidoFin = True
			print("Gana jugador 1",)
		if estadoBoton2 == 0 and not partidoFin:
			punto2 = punto2 + 1
			partidoFin = True
			print("Gana jugador 2")
	print("Punto entre dos jugadores: ",punto1," : ",punto2)
	preguntaFIN = input("\nSi quiere termiar juego pulsa 0 sino ENTER solo: ")
	if preguntaFIN == "0":
		FIN = True
		print("Terminar juego\n")
	else:
		partidoFin = False
GPIO.cleanup()
