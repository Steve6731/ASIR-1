#####################################
#   programa para trabajar con python
#   hecho por Xuan - 2025
#####################################
#Fai un programa que lea dous números por teclado. Pero num2 no siempre mayor que num1
print("---------START--------\n")

num1 = int(input("Write a number: "))
num2 = int(input("Write a other number: "))

if num1 < num2:
   i = int(num1)
   max = int(num2)
else:
   i = int(num2) 
   max = int(num1)

while i <= max:
   print(i)
   i = i + 1

#for i in range(i,num2)

print("\n----------END---------")