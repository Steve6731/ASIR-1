#####################################
#   programa para trabajar con python
#   hecho por Xuan - 2025
#####################################
#Fai un programa que lea dous números por teclado. Pero num2 no siempre mayor que num1,y dice no hace nada si dos num son igual
print("---------START--------\n")

num1 = int(input("Write a number: "))
num2 = int(input("Write a other number: "))
sta = 0
max = 1

if num1 == num2:
   print("\nI can't do any thing, while they are same.")
   sta = 2
else:
   if num1 < num2:
      sta = int(num1)
      max = int(num2)
   else:
      sta = int(num2) 
      max = int(num1)

while sta <= max:
   print(sta)
   sta = sta + 1

print("\n----------END---------")