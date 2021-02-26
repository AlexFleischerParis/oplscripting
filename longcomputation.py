import time

n=500
r=range(1,n+1)

d1=time.time()

su=0.0+sum(j+i-k for i in r for j in r for k in r)

d2=time.time()
print(su)

su2=0.0
for i in r:
    for j in r:
        for k in r:
            su2+=j+i-k

d3=time.time();

print(su2)

assert su==su2

print("python expression : ",d2-d1)
print("python loop : ",d3-d2)

