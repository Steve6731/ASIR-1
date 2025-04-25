#####################################
#   programa para trabajar con python
#   hecho por Xuan - 2025
#####################################

print("---------START--------\n")
print("You can press 0 to end\n")

FIN = False
iList = int(0)

def CalPrime(number,Primelist):
   check = True
   lengList = len(Primelist)
   for i in range(0,lengList): #start to check if number is prime
      if number % int(Primelist[i]) == 0 and number > int(Primelist[i]):
         i = lengList #finish the for loop
         check = False
   return check

while not (FIN):
   num = int(input("Press a number which you want to see: "))
   if num != 0:
      Primo = True
      import time
      timeStart = time.time()

      if num % 2 == 0:#is a par number
         if num != 2:
            Primo = False

      else: #use list mode
         with open('PrimoNumberList.txt', 'r') as fileR:#Read file to write List
            list = fileR.readlines()
         list = [line.strip() for line in list]

         Primo = CalPrime(num,list)  #calule with list of prime

         if num > int(list[-1]) and Primo == True:            
            div = int(list[-1]) + 2
            while div < num and Primo == True:#start to find and check a prime number               
               dPrimo = True
               dPrimo = CalPrime(div,list)

               if dPrimo == True:
                  list.append (div)
                  if num % div == 0:
                     Primo = False
               div = div + 2

      timeEnd = time.time()
      timeAll = timeEnd - timeStart

      print("\nUsed:",timeEnd,"Longitud for List: ",len(list))

      with open('PrimoNumberList.txt', 'w') as fileW:
         for item in list:
            fileW.write(f"{item}\n")

      if Primo == True:
         print("\n[✓]This is a Prime Numbers\n")      
      else:
         print("\n[X]This isn't a Prime Numbers\n")         
   else:
      FIN = False

print("----------END---------")

#PrimeList 的6471 有点特殊