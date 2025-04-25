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
PulsadoBoton1 = False
PulsadoBoton2 = False

print("Empieza el programa.")
print("Si hace 5 segundo no pulsa boton va terminar programa")
print("Cada vez que pulsa necesita Presione y suelte")
print("Si no sulte la programa no va entender como un pulsa.")

while not FIN:
	estadoBoton1 = lerEstado(Boton1)
	if not estadoBoton1:
		PulsadoBoton1 = True
	estadoBoton2 = lerEstado(Boton2)
	if not estadoBoton2:
		PulsadoBoton2 = True

	if PulsadoBoton1 and estadoBoton1:
		if estadoLED1:
			apagar(LED1)
			estadoLED1 = False 
		else:
			acender(LED1)
			estadoLED1 = True
		tiempoInicial = time.time()
		print("Cambiado Estado de LED1")
		PulsadoBoton1 = False

	if PulsadoBoton2 and estadoBoton2:
		if estadoLED2:
			apagar(LED2)
			estadoLED2 = False 
		else:
			acender(LED2)
			estadoLED2 = True
		tiempoInicial = time.time()
		print("Cambiado Estado de LED2")
		PulsadoBoton2 = False


	tiempoDuraba = time.time() - tiempoInicial
	if tiempoDuraba >= 5:
		FIN = True
		print("Ya hace 5 segundo no pulsa Boton")
GPIO.cleanup()