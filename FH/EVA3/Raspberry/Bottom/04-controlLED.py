#!/usr/bin/env python
# Este arquivo emprega encoding: utf-8
import RPi.GPIO as GPIO # type: ignore
import time

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
Boton = 3
LED = 5
tiempoInicial = time.time()

#ProgramaPrincipal
GPIO.setmode(GPIO.BOARD)

establecerEntrada(Boton)
establecerSaida(LED)

apagar(LED)

print("Empieza el programa.")
print("si hace 5 segundo no pulsa Boton va terminar programa")
while not FIN:
	estadoBoton = lerEstado(Boton)
	if estadoBoton == 0:
		acender(LED)
		time.sleep(0.2)
		tiempoInicial = time.time()
	else:
		apagar(LED)
	tiempoDuraba = time.time() - tiempoInicial
	if tiempoDuraba >= 5:
		FIN = True
		print("Ya hace 5 segundo no pulsa Boton")
GPIO.cleanup()
