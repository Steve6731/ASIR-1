#####################################
#   programa para trabajar con python
#   hecho por Xuan - 2025
#####################################
#Amose un múmero aleatorio entre 1 e 10
print("\n---------START--------")

import os

def mayor(num1,num2,num3):
#   if num1 > num2:
#      if num1 > num3:
#         return num1
#      else:
#         return num3
#   else:
#      if num2 > num3:
#         return num2
#      else:
#         return num3
   if num1 > num2:
      may = num1
   else:
      may = num2
   if num3 > may:
      may = num3
   return may
      
os.sytem("clear")
numero1 = input("dame number 1: ")
numero2 = input("dame number 2: ")
numero3 = input("dame number 3: ")
resulta = mayor(numero1,numero2,numero3)

print("El numero mas grande es",resulta)

print("\n----------END---------")