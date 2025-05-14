#!/usr/bin/env python
# Este arquivo emprega encoding: utf-8
import RPi.GPIO as GPIO
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


#ProgramaPrincipal
GPIO.setmode(GPIO.BOARD)
FIN=False
LedVerde=3
acender(LedVerde)
while FIN==False:
	num=int(input("Dame un numero:"))
	if num==0:
		FIN=True
		apagar(LedVerde)

GPIO.cleanup()
