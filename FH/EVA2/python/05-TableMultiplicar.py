#####################################
#   programa para trabajar con python
#   hecho por Xuan - 2025
#####################################

print("--------START--------")

i=int(1)
MaxRow = int(10) #; Maxcol = int(1)
num = int(input("Press a number to create the table(press 0 to end): "))
time = int(0)

while num != 0:
   for i in range(1,MaxRow):
      print(num,"x",i,"=",num*i)
      i = i+1
   num = int(input("Press a number to create the table(press 0 to end): "))
   time = time + 1

print("Your have asked ",time," time the table what you want")

print("---------END---------")
