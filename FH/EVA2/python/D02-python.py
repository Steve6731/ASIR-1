def triple(number1,number2):
   if number2 == 3*number1:
      check = True
   else:
      check = False
   return check

FIN = False
time = 1
while not FIN:
   num1 = int(input("Intruduce un nº: "))
   num2 = int(input("Intruduce outro nº: "))
   if triple(num1,num2):
      print("intentos",time)
      FIN = True
   else:
      time = time + 1
