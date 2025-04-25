#####################################
#   programa para trabajar con python
#   hecho por Xuan - 2025
#####################################
#Amose un múmero aleatorio entre 1 e 10
print("---------START--------\n")

import random
switch = True

while (switch):
   num = 0
   check = True
   answer = int(random.randrange(1,10,1))
   print("I have a secreat number")
   print("you can press 0 everytime when you want give up")
   while (check):
      num = int(input("Tell me what is?: "))
      
      if num == answer:
         check = False
         print("¡¡¡¡¡¡¡¡¡¡Correct!!!!!!!!!!\n")
      elif num == 0:
         switch = False
         check = False
      else:
         print("[X]No it isn't, try again")



print("\n----------END---------")