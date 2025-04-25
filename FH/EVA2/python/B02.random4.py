#####################################
#   programa para trabajar con python
#   hecho por Xuan - 2025
#####################################
#Amose un múmero aleatorio entre 1 e 10
print("\n---------START--------")

import random
switch = True
sgtime = ""

while (switch):

   num = 0
   ToTry = True
   time = int(0)
   answer = int(random.randrange(1,10,1))

   print("\n--I have a"+sgtime+"secreat number (1-10)")
   print("--you can press 0 everytime when you want give up\n")

   while (ToTry):
      check = True
      while(check):

         num = int(input("[?]Tell me what is?: "))

         if num >= 0 and num <= 10:
            check = False
         else:
            print("You only can write 0 to 10")
      
      if num == answer:
         ToTry = False
         time = time + 1
         if time <= 2:
            print("\n[✓]Correct, How fast are you.")
         elif time <= 5:
            print("\n[✓]Correct, Very good")
         else:
            print("\n[✓]Correct, but too slow ")

         print("\n[?]Do you want to try again this game?")
         againNum = int(input("[?]If you want you can try 1 to continuo: "))
         if againNum != 1:
            switch = False
         else:
            sgtime = " new "
            
      elif num == 0:
         switch = False
         ToTry = False
         print("\nYou have tried",time,"time to get the number.")
      else:
         time = time + 1
         if time >= 10:
            print("\nYou loss the game.")
         else:
            print("\n[X]No it isn't, try again")
            print("\n[!]You only have",10-time,"more chances\n")

print("\n----------END---------")