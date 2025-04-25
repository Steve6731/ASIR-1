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
GPIO.setup(3, GPIO.OUT)
for i in range(0,5):
	GPIO.output(3, GPIO.HIGH)# 3.3v
	time.sleep(2)
	GPIO.output(3, GPIO.LOW) # 0v
	time.sleep(2)


	

GPIO.cleanup()
