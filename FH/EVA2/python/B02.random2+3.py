#####################################
#   programa para trabajar con python
#   hecho por Xuan - 2025
#####################################
#Amose un múmero aleatorio entre 1 e 10
print("\n---------START--------")

import random
switch = True

while (switch):

   num = 0
   check = True
   time = int(0)
   answer = int(random.randrange(1,10,1))

   print("\n--I have a secreat number")
   print("--you can press 0 everytime when you want give up\n")
   
   while (check):

      num = int(input("[?]Tell me what is?(you have 10 time to try): "))
      
      if num == answer:
         check = False
         time = time + 1
         print("\n[✓]Correct, You have tried",time,"time to get the number.")

      elif num == 0:
         switch = False
         check = False
         print("\nYou have tried",time,"time to get the number.")
      else:
         time = time + 1
         if time >= 10:
            print("\nYou loss the game.")
         else:
            print("\n[X]No it isn't, try again")
            print("\n[!]You only have",10-time,"more chances\n")
      


print("\n----------END---------\n")