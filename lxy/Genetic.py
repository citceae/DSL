#遗传算法整体框架

from genes import getsource
import numpy as np
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
            res = res - 1e9
        else:
            #res = res + (value1[i]/value2[i]-1)越小越好
            res = res + (value2[i]/value1[i])#越大越好
    return res/(len(value1))

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
#candgene = '1010010000001000110000000101010000'
gene0 = '0000000000000000000000000000000000'
#gene0 = '0110001101100010110100000101110000'
#nbgene = '1100010111100100111100111001100000' 平均加速比1.757

#getsource(nbgene)
#quit()

popdict = {}
popdict[gene0] = getvalue(gene0,popdict)
pointdict ={}
pointdict[gene0] = getpoint(gene0,gene0,popdict,pointdict)


#quit()
#print(point0)

#sample-feature
def countappend(sample):#0-14
    cnt = 0
    for i in range(0,15):
        if sample[i] == '1':
            cnt = cnt + 1
    return cnt

def countdelete(sample):#15-30
    cnt = 0
    for i in range(15,31):
        if sample[i] == '1':
            cnt = cnt + 1
    return cnt

def countfails(sample):
    cnt = 0
    value = getvalue(sample,popdict)
    for v in value:
        if v == 0:
            cnt = cnt + 1
    return cnt

def listratio(sample):#29个比例作为特征值
    value1 = getvalue(sample,popdict)
    value2 = getvalue(gene0,popdict)
    cntlist = []
    for i in range(len(value1)):
        if value1[i] == 0:
            #res = value2[i]/timeout     #buggy
            res = 0
            cntlist.append(res)
        else:
            res = value2[i]/value1[i]
            cntlist.append(res)
    return cntlist


feature_map = {}

def getfeature(sample):
    if sample in feature_map:
        return feature_map[sample]
    feature = []
    ratio = listratio(sample)
    for f in ratio:
        feature.append(f)
    cntdelete = countdelete(sample)
    feature.append(cntdelete)
    cntappend = countappend(sample)
    feature.append(cntappend)
    cntfail = countfails(sample)
    feature.append(cntfail)
    for i in sample:
        feature.append(int(i))
    feature_map[sample] = feature
    return feature

'''
GenePath = '/home/citceae/DSL/lxy/NewNetGene'
genesname = os.listdir(GenePath)
#genesname = genesname[:2] #for test
sample_feature_map = {}

for sample in genesname:
    #print(sample)
    #print(len(sample))
    feature = getfeature(sample)
    #print(feature)
    sample_feature_map[sample] = feature
#以上获得了sample——feature的pair
print("feature done")


#sample-真实加速比 利用之前选用的40个case
#0作为填充 timrout = 300
origintime = [0,0.7515900000,5.6525250000,0.6447880000,5.7919210000,178.1173020000,300,300,6.9934610000,0.2790840000,0.1671380000,221.2818950000,7.5104600000,0.0014780000,0.0358410000,0.5104630000,300,2.0721160000,3.2959690000,300,15.0850400000,0.0713870000,300,300,0.0066230000,0.0810620000,0.1262040000,300,0.0063890000,54.8227170000,8.0320400000,300,0.6648390000,0.0045580000,19.2783880000,0.0205090000,0.0096350000,37.0810610000,0.2290330000,300,0.1385460000]

#标记所有.sl文件 打开对应的.out 如果有两行则读取第二行转换为float然后求加速比
sample_ratio_map ={}
for sample in genesname:
    samplepath = GenePath+'/'+sample
    filesname = os.listdir(samplepath)
    ratio = 1.0
    cnt = 0
    for f in filesname:#12_.sl
        if f[-4:] == "_.sl":
            cnt = cnt + 1
            curnum = (int)(f[:-4])
            outfilename = f[:-4]+'_.out'
            if outfilename in filesname:
                abspath = samplepath+'/'+outfilename
                f = open(abspath)
                lines = f.readlines()
                assert(len(lines) == 2)
                value1 = eval(lines[1])
                value2 = origintime[curnum]
                ratio = ratio * value2/value1
                f.close()
            else:
                value1 = 300
                value2 = origintime[curnum]
                ratio = ratio * value2/value1
        else:
            continue
    ratio = ratio**(1/cnt)
    sample_ratio_map[sample] = ratio
#以上获得sample-加速比ratio（部分样例采样）的pair
print('ratio_done')

#将上述数据存储至csv表格
#利用上述数据，构造sample-feature-ratio的csv文件或利用sklearn直接用代码在此处检验

outdata = []
for sample in genesname:
    newdata = []
    newdata.append(sample)
    newfeature = sample_feature_map[sample]
    #print(newfeature)
    for f in newfeature:
        newdata.append(f)
    newratio = sample_ratio_map[sample]
    newdata.append(newratio)
    outdata.append(newdata)

#print(outdata[0])

import csv
with open('/home/citceae/DSL/lxy/sklearn/data.csv','w',encoding='utf-8') as f:
    csv_writer = csv.writer(f)
    csv_writer.writerows(outdata)

quit()
'''


population = []
#init 
for i in range(K):
    newgene = getonegene()
    population.append(newgene)

import pickle
with open("/home/citceae/DSL/lxy/sklearn/xgbreg","rb") as f:
    regr = pickle.load(f)

#with open("stddsl",'rb') as f:
#    std = pickle.load(f)

reg_point = {}
feature_gene0 = np.array(getfeature(gene0))
feature = feature_gene0
#feature = feature_gene0[:32]
#print(len(feature))
#feature_std = std.transform(feature.reshape(1,-1))
reg_point[gene0] = regr.predict(feature.reshape(1,-1))[0]
#print(reg_point[gene0])




filename = 'programming.txt'
with open(filename, 'w') as file_object:
    runs = 30
    for r in range(runs):
        print("runs:"+str(r)+'-------------------------')
        newpopulation = []
        for i in range(K):
            newg1 = cross(population)
            newg2 = change(newg1)
            newg3 = refine(newg2)
            newpopulation.append(newg3)
        for p in population:
            newpopulation.append(p)
        for g in newpopulation:
            #popdict[g] = getvalue(g,popdict)
            feature_gene = np.array(getfeature(g))
            feature = feature_gene
            #feature_std = std.transform(feature.reshape(1,-1))
            reg_point[g] = regr.predict(feature.reshape(1,-1))[0]
            #pointdict[g] = getpoint(g,gene0,popdict,pointdict)
        points = []
        for g in newpopulation:
            points.append(reg_point[g])
        Krank = getKrank(points)
        population = []
        for g in newpopulation:
            if reg_point[g] >= Krank:#用新的适应度 加速比
                population.append(g)

        for g in population:
            file_object.write(g+":         ") 
            file_object.write(str(reg_point[g])+"\n") 
        file_object.write("-----------------------------------------------------------\n")

#for p in pointdict:
#    print(p)
#    print(pointdict[p])

'''
filename = 'programming.txt'
with open(filename, 'w') as file_object:
    runs = 30
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
            if pointdict[g] >= Krank:#用新的适应度 加速比
                population.append(g)

        for g in population:
            file_object.write(g+"\n") 
            file_object.write(str(pointdict[g])+"\n") 
        file_object.write("-----------------------------------------------------------\n")
'''

    

    
    