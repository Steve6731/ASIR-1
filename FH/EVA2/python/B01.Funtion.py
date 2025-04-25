#####################################
#   programa para trabajar con python
#   hecho por Xuan - 2025
#####################################
#Amose un múmero aleatorio entre 1 e 10
print("---------START--------\n")

import random
switch = True
while(switch):
   check = True
   while (check):
      i = int(input("Press 0 to end, 1 to continuo: "))
      if i != 0 and i !=1:
         check=True
      else:
         check=False
   if i == 1:
      num = int(random.randrange(1,10,1))
      print("This a random number: ",num)
   else:
      switch = False

print("\n----------END---------")