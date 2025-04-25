#####################################
#   programa para trabajar con python
#   hecho por Xuan - 2025
#####################################

print("--------START--------")

First=int(input("The first number: "))
Last=int(input("The last number: "))
strnum=""
move=1

if(First > Last):
    move = -1

for i in range(First,Last+move,move):
    strnum = strnum + str(i) # "strnum anteriol" + "last number"
    if i != Last:
        strnum = strnum + ","# ("strnum anteriol" + "last number") + ","
    i = i + move
    
print("The list of number is: " + strnum)

print("---------FIN---------")