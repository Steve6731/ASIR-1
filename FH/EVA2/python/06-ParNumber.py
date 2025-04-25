#####################################
#   programa para trabajar con python
#   hecho por Xuan - 2025
#####################################

print("--------START--------")

par = True

while (par):
   num = int(input("Press a number which you want to see:"))
   if num % 2 == 0:
      print("This a par number")
      par = False
   else:
      print("This isn't a par number")

print("---------END---------")