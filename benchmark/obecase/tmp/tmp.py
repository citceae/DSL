list = [chr(i) for i in range(97,122)]
s = ["L"+i for i in list]
#print(s)
#quit()
k = len(s)
for i in range(0,k):
    for j in range(i+1,k):
        print("(and "+ s[i]+ ' '+s[j]+ ')')
for i in range(0,k):
    for j in range(i+1,k):
        print("(or "+ s[i]+ ' '+s[j]+ ')')