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
Boton1 = 3 #cable rojo
LED1 = 5	#led rojo
Boton2 = 7 #cable azul
LED2 = 8 #led verde
tiempoInicial = time.time()

#ProgramaPrincipal
GPIO.setmode(GPIO.BOARD)

establecerEntrada(Boton1)
establecerEntrada(Boton2)
establecerSaida(LED1)
establecerSaida(LED2)
apagar(LED1)
apagar(LED2)
estadoLED1 = False
estadoLED2 = False

print("Empieza el programa.")
print("si hace 5 segundo no pulsa Boton va terminar programa")

while not FIN:
	estadoBoton1 = lerEstado(Boton1)
	estadoBoton2 = lerEstado(Boton2)
	if estadoBoton1 == 0:
		if estadoLED1:
			apagar(LED1)
			estadoLED1 = False 
		else:
			acender(LED1)
			estadoLED1 = True
		tiempoInicial = time.time()
		print("Cambiado Estado de LED1")
		time.sleep(0.5)
	if estadoBoton2 == 0:
		if estadoLED2:
			apagar(LED2)
			estadoLED2 = False 
		else:
			acender(LED2)
			estadoLED2 = True
		tiempoInicial = time.time()
		print("Cambiado Estado de LED2")
		time.sleep(0.5)

	tiempoDuraba = time.time() - tiempoInicial
	if tiempoDuraba >= 5:
		FIN = True
		print("Ya hace 5 segundo no pulsa Boton")
GPIO.cleanup()
