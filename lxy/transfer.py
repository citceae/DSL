#str.substr(Param0,0,str.indexof(Param0," ",str.len(str.++("ssp.","ssp."))))
#str.substr(Param0,+(1,str.indexof(Param0," ",0)),3)

def treetoarr(s1,dict1):
    outarr = []
    l1 = len(s1)
    i=0
    j=0
    while j < l1:
        if s1[j] != '(' and s1[j]!=')' and s1[j]!=',':
            j = j+1
        else:
            if i==j:
                outarr.append(-1)
                j=j+1
                i=j
                continue
            tmp = s1[i:j]
            if tmp in dict1:
                pass
            else:
                num = len(dict1)
                dict1[tmp] = num 
            val = dict1[tmp]
            outarr.append(val)
            if s1[j]!='(':
                outarr.append(-1)
            j=j+1
            i=j  
    return outarr

def treetoarr2(s1,dict2):#将字符串常量视为同一个参数
    outarr = []
    l1 = len(s1)
    i=0
    j=0
    while j < l1:
        if s1[j] != '(' and s1[j]!=')' and s1[j]!=',':
            j = j+1
        else:
            if i==j:
                outarr.append(-1)
                j=j+1
                i=j
                continue
            tmp = s1[i:j]
            if '"' in tmp:
                tmp = 'StringConst'
            if tmp in dict2:
                pass
            else:
                num = len(dict2)
                dict2[tmp] = num 
            val = dict2[tmp]
            outarr.append(val)
            if s1[j]!='(':
                outarr.append(-1)
            j=j+1
            i=j  
    return outarr,dict2

def getprogdict(trainset,path = "/mnt/d/code/DSL/lxy"):
    dict1 = {}
    dict2 = {}

    # a,dict2 = treetoarr2('str.substr(Param0,+(1,str.indexof(Param0," ",0)),3)',dict2)
    # print(a)
    # quit()

    s=[]
    for i in trainset:
        fname = path + "/trainset/" + str(i) + ".out" 
        fo = open(fname,'r')
        for line in fo.readlines():
            s.append(line.lstrip()[:-1])
        fo.close()

    with open(path + '/allprog.txt','w') as f:
        for si in s:
            print(si,file=f)

    outarrs = []
    for si in s:
        outarr,dict2 = treetoarr2(si,dict2)
        outarrs.append(outarr)

    with open(path + '/allarr.txt','w') as f:
        for i in range(len(outarrs)):
            outarr = outarrs[i]
            outs = str(i)+' '+str(i)+' '+str(len(outarr))
            for n in outarr:
                outs = outs + ' ' + str(n)
            print(outs,file=f)

    with open(path + '/dict2.txt','w') as f2:
        for key in dict2:
            outs = key + ':' + str(dict2[key])
            print(outs,file= f2)






    


'''
s1 ='(-1,str.indexof(Param0,"overhead",0))'
s2 = 'str.substr(Param0,0,str.indexof(Param0," ",str.len(str.++("ssp.","ssp."))))'
s3 = 'str.substr(Param0,+(-1,str.indexof(Param0,".",1)),+(1,+(1,1)))'
s4 = 'str.replace(str.substr(Param0,+(-1,+(-1,+(-1,+(-1,str.len(Param0))))),str.len(Param0)),">","")'
s5 = 'str.substr(Param0,+(1,str.indexof(Param0,"-",-(Param1,2))),str.indexof(Param0,"-",Param1))'
s6 = 'str.++(Param0,str.++("/n",str.++(Param1,str.++("/n",Param2))))'
s7 = 'str.substr(Param0,0,-(str.len(Param0),3))'
s8 = 'str.substr(Param1,0,str.indexof(Param1,"_",1))'
s9 = '-(2,str.indexof(int.to.str(+(-1,str.indexof(Param0,Param1,1))),int.to.str(2),0))'
s10 = 'str.replace(Param0,str.substr(Param0,+(1,1),+(1,+(1,1))),"")'
s11 = 'str.contains(Param0,"9999999")'
s12 = 'str.at(Param0,+(Param1,-1))'
s13 = 'str.indexof(Param1,str.at(Param0,1),+(1,1))'
s14 = 'str.replace(str.replace(str.replace(Param0,"BRD","Branding"),"DRS","Direct Response"),"LDS","Leads")'
s15 = 'str.substr(Param0,0,+(-1,str.indexof(Param0,"-",1)))'
s16 = 'str.substr(Param0,0,str.indexof(str.++(Param0,"|"),"|",1))'
s17 = 'str.substr(Param0,+(1,+(1,str.len("Name"))),str.len(Param0))'
s18 = 'ite(str.prefixof("C0",Param0),Param0,Param1)'
s19 = 'ite(str.suffixof("/",Param0),"microsoft",ite(str.suffixof("windows",Param0),"windows","mac"))'
s20 = 'str.substr(Param0,+(1,str.indexof(str.replace(str.replace(Param0,"/"," "),"/"," "),"/",1)),str.len(Param0))'
s21 = 'str.suffixof(Param1,Param0)'
s22 = 'ite(str.contains(Param0,Param2),Param0,Param1)'
s23 = 'str.replace(Param0,str.replace("that",Param0,""),"")'
s24 = 'str.replace(str.substr(Param0,0,str.indexof(Param0,"<",1)),str.++("<",str.++("b",">")),"")'
s25 = 'str.prefixof(Param0,Param1)'
s26 = 'str.++("Dr.",str.++(" ",str.substr(Param0,0,str.indexof(Param0," ",0))))'
s27 = 'str.substr(Param1,+(1,str.indexof(Param1,"_",1)),str.len(Param1))'
s28 = 'str.++(str.at(Param0,0),str.++(".",str.++(str.at(Param0,+(1,str.indexof(Param0," ",0))),".")))'
s29 = 'str.substr(Param0,+(1,str.indexof(Param0," ",0)),str.len(Param0))'
s30 = 'str.substr(Param0,0,3)'
s31 = 'str.substr(Param0,+(1,str.indexof(Param0," ",0)),3)'
s32 = 'str.substr(Param0,Param1,str.len(Param0))'
s33 = 'str.++(Param1,str.++(" ",Param0))'
s34 = 'str.substr(Param0,0,+(-1,str.indexof(Param0,"Inc",1)))'
s35 = 'str.++(Param0,str.++(".",str.++(" ",Param1)))'  #原本为‘,’,但是逗号被用于作parse，为方便直接修改 38
s36 = 'str.replace(str.replace(Param0,Param1,""),Param1,"")'
s = []
s.append(s1)
s.append(s2)
s.append(s3)
s.append(s4)
s.append(s5)
s.append(s6)
s.append(s7)
s.append(s8)
s.append(s9)
s.append(s10)
s.append(s11)
s.append(s12)
s.append(s13)
s.append(s14)
s.append(s15)
s.append(s16)
s.append(s17)
s.append(s18)
s.append(s19)
s.append(s20)
s.append(s21)
s.append(s22)
s.append(s23)
s.append(s24)
s.append(s25)
s.append(s26)
s.append(s27)
s.append(s28)
s.append(s29)
s.append(s30)
s.append(s31)
s.append(s32)
s.append(s33)
s.append(s34)
s.append(s35)
s.append(s36)
#从文件中读取并添加
'''