import random 
import os
from refine_freq import getfnins
from script import gethtsi,createfile,getonegene,get_max_min_ratio

CASES = 209
TRAIN_CASES = 40
PATH="/mnt/d/code/DSL/lxy"
New_GEN_DATA = 0

#TRAIN_SET = random.sample([i for i in range(CASES)],TRAIN_CASES).sort()
#print(s)
#print(len(s))
TRAIN_SET = [3, 9, 13, 28, 38, 59, 72, 73, 76, 77, 87, 91, 92, 96, 97, 101, 102, 113, 115, 118, 128, 130, 135, 137, 139, 140, 145, 146, 149, 152, 165, 167, 169, 181, 184, 186, 187, 192, 193, 196]

#from script import traingen
#traingen(TRAIN_SET) #一次性行为

# from transfer import getprogdict
# getprogdict(TRAIN_SET) #一次性行为

#cmdline = PATH + '/SLEUTH-master/sleuth -i allarr.txt -S 400 -I -O -o > tmp' #一次性行为
#os.system(cmdline)
#cp part of tmp to freq.txt tmp中部分内容copy到freq_sleuth中进行下一步

funcs,ntIntapp,ntStringapp = getfnins()
# for i in funcs:
#     print(i)
# for i in ntStringapp:
#     print(i)
# for i in ntIntapp:
#     print(i)

LenBase = 16
LenGene = len(funcs) + LenBase #84+16 = 100

header,tailer,ntSci,ntIci = gethtsi(cntlist= [i for i in range(CASES)])

#testgene = '1111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111'
#createfile(testgene,1,path=PATH,ntIci=ntIci,ntIntapp=ntIntapp,ntSci=ntSci,ntStringapp=ntStringapp,funcs=funcs,header=header,tailer=tailer)

# while(生成数量不足)：
# 生成新基因，对TRAIN_SET的所有文件生成对应文件，并调用并行obe运行(main.py中目前仅仅是obe)
# 完成后即训练集结束 先测一个试试
num = 0
while num < New_GEN_DATA:
    gene = getonegene(LenGene=LenGene)
    #gene = '0'*LenGene
    path_traingene = PATH + '/TrainGenes/' + gene #编码的命名 改一次需要清空#TODO
    if not os.path.isdir(path_traingene):
        cmdline = 'mkdir ' + path_traingene
        os.system(cmdline)
    else:
        continue

    num = num + 1
    for i in TRAIN_SET:
        createfile(gene,i,path_traingene,ntIci=ntIci,ntIntapp=ntIntapp,ntSci=ntSci,ntStringapp=ntStringapp,funcs=funcs,header=header,tailer=tailer)
    cmdline = 'python3 /mnt/d/code/ISTool/ISTool/runner/python/main.py {}'.format(gene)
    os.system(cmdline)


#对于生成的所有训练数据，生成对应的feature-ratio .csv文件
TrainGenePath = PATH + '/TrainGenes'
max_ratio,max_gene,cnt_max,min_ratio,min_gene,cnt_min = get_max_min_ratio(TrainGenePath,LenGene,TRAIN_SET)
print(max_ratio)
print(max_gene)
print(min_ratio)
print(min_gene)
print(cnt_max)
print(cnt_min)









