a=0;num=0
print("hello world\n")
while num<10087:
    a+=num
    num=num+1

print(a)

for _a in range(1,6):
    for space in range(1,6-_a):
        print(" ",end="")
    for col in range(1,_a+1):
        print("* ",end="")
    print()


for x in range(1,10):  #x=1
    for j in range(1,x+1): #j [1,2)
        print("%dx%d=%d"%(j,x,x*j),end="\t")
    print()