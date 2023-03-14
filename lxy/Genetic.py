#遗传算法整体框架

from genes import getsource
import random
import os

K = 50 #种群数量
L = 34 #基因长度

def getonegene():#暂时不能处理后三位
    s = ''
    for i in range(L):
        if random.random()>0.5:
            s = s + '1'
        else:
            s = s + '0'
    s_ = s[0:L-3] + '000'
    return s_

def getpoint(newgene,gene0,popdict,pointdict):
    if newgene in pointdict:
        return pointdict[newgene]
    value1 = popdict[newgene]
    value2 = popdict[gene0]
    res = 0
    assert(len(value1)==len(value2))
    for i in range(len(value1)):
        if value1[i] == 0:
            res = res + 100
        else:
            res = res + (value1[i]/value2[i]-1)
    return res

cmdline = '/home/citceae/ISTool1024/ISTool/build/executor/run_sygus /home/citceae/DSL/lxy/source.sl'

def getvalue(gene0,popdict):
    if gene0 in popdict:
        return popdict[gene0]
    getsource(gene0)
    os.system(cmdline)
    f = open("/home/citceae/DSL/lxy/result.txt")
    value = []
    while True:
        lines = f.readlines(10000)
        if not lines:
            break
        for line in lines:
            value.append(eval(line))
    f.close()
    return value

def cross(population):
    l = len(population)
    idx1 = random.randint(0,l-1)
    idx2 = random.randint(0,l-1)
    s = ''
    for i in range(L):
        if random.random()>0.5:
            s = s + population[idx1][i]
        else:
            s = s + population[idx2][i]
    return s

def change(s):
    s_ = ''
    for i in s:
        if random.random()<0.05:#变异
            if i == '1':
                s_ = s_ + '0'
            else:
                s_ = s_ + '1'
        else:
            s_ = s_ + i
    return s_

def refine(s):
    s_ = ''
    return s[0:L-3] + '000'


def getKrank(points):
    points.sort()
    return points[K]



#candgene = '1011001110101000100000000000010000'
#candgene = '0000100101111110000100000001110000'
#candgene = '0110001101101000110000000101110000'
#gene0 = '0000000000000000000000000000000000'
gene0 = '1111001101101100010000000101110000'

popdict = {}
popdict[gene0] = getvalue(gene0,popdict)
pointdict ={}
pointdict[gene0] = getpoint(gene0,gene0,popdict,pointdict)
quit()
#print(point0)

population = []
#init 
for i in range(K):
    newgene = getonegene()
    population.append(newgene)

#for p in pointdict:
#    print(p)
#    print(pointdict[p])


filename = 'programming.txt'
with open(filename, 'w') as file_object:
    runs = 20
    for r in range(runs):
        newpopulation = []
        for i in range(K):
            newg1 = cross(population)
            newg2 = change(newg1)
            newg3 = refine(newg2)
            newpopulation.append(newg3)
        for p in population:
            newpopulation.append(p)
        for g in newpopulation:
            popdict[g] = getvalue(g,popdict)
            pointdict[g] = getpoint(g,gene0,popdict,pointdict)
        points = []
        for g in newpopulation:
            points.append(pointdict[g])
        Krank = getKrank(points)
        population = []
        for g in newpopulation:
            if pointdict[g] <= Krank:
                population.append(g)

        for g in population:
            file_object.write(g+"\n") 
            file_object.write(str(pointdict[g])+"\n") 
        file_object.write("-----------------------------------------------------------\n")
    


    

    
    