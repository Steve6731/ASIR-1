#####################################
#   programa para trabajar con python
#   hecho por Xuan - 2025
#####################################

print("---------START--------\n")
print("You can press 0 to end\n")

switch = True

while(switch):
   num = int(input("Press a number which you want to see: "))
   if num == 0:
      switch = False
   else:
      import time
      timeStart = time.time()
      Primo = True

      if num % 2 == 0:#Par number
         if num != 2:
            Primo = False

      else: #Star to use list

         with open('PrimoNumberList.txt', 'r') as fileR:#Read file to write List
            list = fileR.readlines()
         list = [line.strip() for line in list]

         lengList = len(list)
         for i in range(0,lengList): #start to check if div is prime
            if num % int(list[i]) == 0 and num > int(list[i]):
                  i = lengList #finish for loop
                  Primo = False

         if Primo == True:
               
            div = int(list[-1]) + 2
            while div < num:#start to find and check a prime number
               
               dPrimo = True
               lengList = len(list)
               for i in range(0,lengList): #start to check if div is prime
                  if div % int(list[i]) == 0 and div > int(list[i]):
                     i = lengList #finish for loop
                     dPrimo = False
               if dPrimo == True:
                  list.append (div)
                  if num % div == 0:
                     div = num #finish while loop
                     Primo = False
               div = div + 2

      timeEnd = time.time() - timeStart
      print("\nUsed:",timeEnd,"Segund and last five number for List",list[-5:-1],"Longitud for List: ",len(list),)
      
      with open('PrimoNumberList.txt', 'w') as fileW:
         for item in list:
            fileW.write(f"{item}\n")

      if Primo == True:
         print("\n[✓]This is a Prime Numbers\n")
         
      else:
         print("\n[X]This isn't a Prime Numbers\n")

print("----------END---------")

#PrimeList 的6471 有点特殊