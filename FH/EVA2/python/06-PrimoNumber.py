#####################################
#   programa para trabajar con python
#   hecho por Xuan - 2025
#####################################

print("---------START--------\n")
print("You can press 0 to end\n")

FIN = False

while not (FIN):

   num = int(input("Press a number which you want to see: "))

   if num != 0:# va terminar si poner 0
      Primo = True

      import time
      timeStart = time.time()

      if num % 2 == 0:#si es numero par, absolutamente no es un numero primo
         if num != 2:
            Primo = False
      else:# sino comprobamos si puede dividir por los numeros impares que menor que el, y empiezamos por 3  
         factor = 3 
         while(factor < num) and Primo == True:
            if num % factor == 0:
               Primo == False
            else:
               factor = factor + 2

      timeEnd = time.time()
      timeCost = timeEnd - timeStart

      print("\nUsed:",timeEnd,"Segund")

      if Primo == True:
         print("[✓]This is a Prime Numbers")
      else:
         print("[X]This isn't a Prime Numbers")
   else:
      FIN = True

print("----------END---------")