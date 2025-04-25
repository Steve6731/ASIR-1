#####################################
#   programa para trabajar con python
#   hecho por Xuan - 2025
#####################################

num=""

min=int(input("The minimun number: "))
max=int(input("The maximun number: "))

for i in range(min,max):
    num = num + str(i) 
    if (i != max):
        num = num + ","

print("Os números son:",num)
print("FIN")