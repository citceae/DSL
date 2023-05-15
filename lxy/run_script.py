import os
from genes import createfile
import random


inputpath = '/home/citceae/DSL/lxy/generalization/modify/'
outputpath = '/home/citceae/DSL/lxy/generalization/modify_out/'
filesname = os.listdir(inputpath)

cnt = 0
for f in filesname:
    print("step:"+str(cnt)+"---------------------------------")
    cnt = cnt + 1
    inputname = inputpath + f
    outputname = outputpath + f[:-3] + '.out'
    cmdline = '/home/citceae/ISTool0109max/ISTool/build/executor/run_sygus ' + inputname + ' ' + outputname + ' ' + 'obe'
    os.system(cmdline)
    



    





'''
for i in range(1,41):
    cmdline = '/home/citceae/ISTool0109max/ISTool/build/executor/run_sygus /home/citceae/DSL/lxy/genesfile/{}_.sl /home/citceae/DSL/lxy/genesfile/{}_m.out maxflash'.format(str(i),str(i))
    os.system(cmdline)
'''

'''
gene = '1111011101100001011100001001110000'
cmdline = 'mkdir /home/citceae/DSL/lxy/candgenes/'+gene
os.system(cmdline)
path = '/home/citceae/DSL/lxy/candgenes/' + gene + '/'
for i in range(1,41):
    print("step:"+str(i)+"---------------------------------")
    createfile(gene,i,path)
    cmdline = '/home/citceae/ISTool0109max/ISTool/build/executor/run_sygus /home/citceae/DSL/lxy/candgenes/{}/{}_.sl /home/citceae/DSL/lxy/candgenes/{}/{}_.out obe'.format(gene,str(i),gene,str(i))
    os.system(cmdline)



#0作为填充 timeout = 300
origintime = [0,0.7515900000,5.6525250000,0.6447880000,5.7919210000,178.1173020000,300,300,6.9934610000,0.2790840000,0.1671380000,221.2818950000,7.5104600000,0.0014780000,0.0358410000,0.5104630000,300,2.0721160000,3.2959690000,300,15.0850400000,0.0713870000,300,300,0.0066230000,0.0810620000,0.1262040000,300,0.0063890000,54.8227170000,8.0320400000,300,0.6648390000,0.0045580000,19.2783880000,0.0205090000,0.0096350000,37.0810610000,0.2290330000,300,0.1385460000]

#标记所有.sl文件 打开对应的.out 如果有两行则读取第二行转换为float然后求加速比
samplepath = '/home/citceae/DSL/lxy/candgenes/'+gene+'/'
filesname = os.listdir(samplepath)
ratio = []
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
            ratio.append(value2/value1)
            f.close()
        else:
            value1 = 300
            value2 = origintime[curnum]
            ratio.append(value2/value1)
    else:
        continue
#print(len(ratio))
ratio.sort()
ret = 1.0
for r in ratio:
    ret = ret*r
ret = ret**(1/len(ratio))
print(ret)
#ret = 1.0
#for i in range(8):
#    ret = ret*ratio[i]
#ret = ret**(1/8)
#print(ret)
#ret = 1.0
#for i in range(8):
#    ret = ret*ratio[0-i]
#ret = ret**(1/8)
#print(ret)
'''
quit()


L = 34
def getonegene():#暂时不能处理后三位
    s = ''
    for i in range(L):
        if random.random()>0.5:
            s = s + '1'
        else:
            s = s + '0'
    s_ = s[0:L-3] + '000'
    return s_

#gene = '0110001101101000110000000101110000'

#随机生成一些sample而不是取用所有40个测试？
for i in range(6):
    gene = getonegene()
    path = '/home/citceae/DSL/lxy/NewNetGene/'+ gene + '/'

    if not os.path.isdir(path):
        cmdline = 'mkdir /home/citceae/DSL/lxy/NewNetGene/'+ gene
        os.system(cmdline)
    else:
        continue

    #candset = []
    #for i in range(8):
    #    newcand = random.randint(1,40)
    #    if newcand not in candset:
    #        candset.append(newcand)
    for i in range(1,41):#1,41
    #for i in candset:
        print("step:"+str(i)+"---------------------------------")
        createfile(gene,i,path)
        cmdline = '/home/citceae/ISTool0109max/ISTool/build/executor/run_sygus /home/citceae/DSL/lxy/NewNetGene/{}/{}_.sl /home/citceae/DSL/lxy/NewNetGene/{}/{}_.out obe'.format(gene,str(i),gene,str(i))
        os.system(cmdline)
