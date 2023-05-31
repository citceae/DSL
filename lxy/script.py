'''
traingen：根据编号求解每个对应文件的100个解
获取所有json文件脚本
记录string benchmark前后名称映射的脚本
根据指定json文件序号获取对应header、tailer和string常数、int常数的函数 gethtsi
根据基因、目标文件编号、和对应的header等信息在path处生成基因对应的.sl文件 createfile
'''
import os
import json
import random 

def traingen(trainset,execpath = "/mnt/d/code/ISTool/ISTool/build/executor/test",filepath="/mnt/d/code/DSL/lxy"):
    trainsetpath = filepath+'/trainset'
    if os.path.exists(trainsetpath):
        cmdline = 'rm -rf ' + trainsetpath
        os.system(cmdline)
        cmdline = 'mkdir ' + trainsetpath
        os.system(cmdline)
    else:
        cmdline = 'mkdir ' + trainsetpath
        os.system(cmdline)

    benchmark_path = filepath + '/benchmark_string'
    output_path = filepath + '/trainset'
    for i in trainset:
        print("start "+str(i)+':')
        cmdline = execpath + ' ' + benchmark_path + '/' + str(i) + '.sl' + ' > ' + output_path + '/' + str(i) + '.out'
        os.system(cmdline)


def getstringjson(path = "/mnt/d/code/DSL/lxy",cnt = 209):#一次性无需修改
    inputpath = path + '/benchmark_string'
    outputpath = path + '/string_json'
    pyfile = path + '/python/main.py'
    for i in range(cnt):
        inputfile = inputpath + '/' + str(i) + '.sl'
        outputfile = outputpath + '/' + str(i) + '.json'
        cmdline = 'python3 ' + pyfile + ' ' + inputfile + ' ' + outputfile
        print(cmdline)
        os.system(cmdline)

#getstringjson()

#benchmark重命名以及记录映射关系，方便根据名称直接划分训练集数据集
def rename(path = "/mnt/d/code/DSL/lxy"):#左右斜杠 一次性无需修改
    path = path + '/' + 'benchmark_string'
    filesname = os.listdir(path)
    recordmap = {}
    cnt = 0
    for fname in filesname:
        recordmap[cnt] = fname
        cmdline = 'mv ' + path + '/' + fname + ' ' + str(cnt) + '.sl'
        cnt = cnt + 1
        os.system(cmdline)
    for key in recordmap:
        print(str(key)+':'+str(recordmap[key]))
    return 

def create_one_sci(arr):#arr = tmp[1][4][1]
    sci =''
    for it in arr[2]:
        if type(it) != type([]):
            sci = sci + it
        elif it[0] == 'String':
            sci = sci + '"' + it[1] + '"'
        else:
            break
        if it != arr[2][-1]:
            sci = sci + ' '
    return sci

def create_stringconsti(allarr):#allarr = tmp[1][4][1]的组合
    ntSci = []
    for arr in allarr:
        onesci = create_one_sci(arr)
        ntSci.append(onesci)
    return ntSci

def create_one_ici(arr):#arr = tmp[1][4][2]
    ici = ''
    for it in arr[2]:
        if type(it) != type([]):
            ici = ici + it
        elif it[0] == 'Int':
            ici = ici + str(it[1])
        else:
            break
        if it != arr[2][-1]:
            ici = ici + ' '
    return ici

def create_intconsti(allarr):#allarr = tmp[1][4][2]的组合
    ntIci = []
    for arr in allarr:
        onesci = create_one_ici(arr)
        ntIci.append(onesci)
    return ntIci

def create_one_header(arr): #arr = tmp[1]
    s = '('
    assert(arr[0]=='synth-fun')
    s = s + 'synth-fun'
    assert(arr[1]=='f')
    s = s + ' f'

    assert(len(arr[2]) > 0) #param
    s = s + ' ('
    for pa in arr[2]: 
        s = s + '(' + pa[0] + ' ' + pa[1] + ')'
        if pa != arr[2][-1]:
            s = s + ' '
    s = s + ')'

    s = s + ' ' + arr[3]
    s1 = s 

    s = ''
    s = '( ('
    startarr = arr[4][0]
    s = s + startarr[0] + ' ' + startarr[1] + ' ' + '(' + startarr[2][0] + '))'
    s2 = s
    return [s1,s2]


def create_header(allarr):# allarr = tmp[1]的组合
    header = []
    for arr in allarr:
        oneheader = create_one_header(arr)
        header.append(oneheader)
    return header

def create_one_tailer(arr):# arr = tmp[2:]
    ret = []
    ret.append('))')
    for t in arr:
        if t[0] == 'constraint':
            ct = '(constraint ('
            assert(t[1][0] ==  '=') #限制条件暂时都为=给出的
            ct = ct + '= ('
            ct = ct + t[1][1][0] + ' ' #'f'
            for pa in t[1][1][1:]:
                if pa[0] == 'String':
                    ct = ct + '"' + pa[1] + '"'
                elif pa[0] == 'Int':
                    ct = ct + str(pa[1])
                else:
                    assert(False)
                if pa!=t[1][1][-1]:
                    ct = ct + ' '
            ct = ct + ') '
            if t[1][2][0] == 'String':
                ct = ct + '"' + t[1][2][1] + '"'
            elif t[1][2][0] == 'Int':
                ct = ct + str(t[1][2][1])
            elif t[1][2][0] == 'Bool':
                ct = ct + t[1][2][1]
                #assert(False)
            else:
                assert(False)
            ct = ct + '))'
            ret.append(ct)
        elif t[0] == 'check-synth':
            ct = '(check-synth)'
            ret.append(ct)
        elif t[0] == 'define-fun':
            pass#不加答案
        elif t[0] == 'declare-var':
            pass#应该也不需要变量名
        else:
            print(t)
            assert(False)
    return ret

def create_tailer(allarr):# allarr = tmp[2:]的组合
    tailer = []
    for arr in allarr:
        onetailer = create_one_tailer(arr)
        tailer.append(onetailer)
    return tailer

def gethtsi(cntlist = [0,5],path = "/mnt/d/code/DSL/lxy/string_json"):#cntlist应为全集
    headerarr = []# allarr = tmp[1]的组合
    tailerarr = []# allarr = tmp[2:]的组合
    sciarr = []#allarr = tmp[1][4][1]的组合
    iciarr = []#allarr = tmp[1][4][2]的组合
    for cnt in cntlist:
        filepath = path + '/' + str(cnt) + '.json'
        with open(filepath, 'r') as f:
            tmp = json.load(f)
        headerarr.append(tmp[1])
        tailerarr.append(tmp[2:])
        sciarr.append(tmp[1][4][1])
        iciarr.append(tmp[1][4][2])
    header = create_header(headerarr)
    tailer = create_tailer(tailerarr)
    sci = create_stringconsti(sciarr)
    ici = create_intconsti(iciarr)
    return header,tailer,sci,ici
    
#根据json文件获取所需要的信息，应对所有文件保留对应记录
# with open('0.json', 'r') as f: #一个tmp是一个文件信息
#     tmp = json.load(f) #1中包含了常量、函数体信息；2往后包含了约束条件信息

# print(tmp[1][4])
# print(tmp[1][4][2][2])


# # a=create_header([tmp[1]])
# # print(a)
# b = create_stringconsti([tmp[1][4][1]])
# for i in b:
#     print(i)
# b = create_intconsti([tmp[1][4][2]])
# for i in b:
#     print(i)

# header,tailer,sci,ici = gethtsi()
# print(header)
# print(tailer)
# print(sci)
# print(ici)


def createfile(genes,num,path,ntIci,ntIntapp,ntSci,ntStringapp,funcs,header,tailer):
    t = '	'
    ntIntbase = [
    '(+ ntInt ntInt)',
    '(- ntInt ntInt)',
    '(str.len ntString)',
    '(str.to.int ntString)',
    '(ite ntBool ntInt ntInt)',
    '(str.indexof ntString ntString ntInt)']

    ntStringbase = [
    '(str.++ ntString ntString)',
    '(str.replace ntString ntString ntString)',
    '(str.at ntString ntInt)',
    '(int.to.str ntInt)',
    '(ite ntBool ntString ntString)',
    '(str.substr ntString ntInt ntInt)']

    ntBoolconst = 'true false'    
    ntBoolbase = [
    '(= ntInt ntInt)',
	'(str.prefixof ntString ntString)',
	'(str.suffixof ntString ntString)',
	'(str.contains ntString ntString)']

    ntStringfinal = []
    #print(num)
    ntStringfinal.append(ntSci[num]) #num直接对应
    len1 = len(ntStringapp)#目前仅有ntStringapp和ntIntapp且按照此顺序
    for i in range(0,len1):
        if genes[i] == '1':
            ntStringfinal.append(ntStringapp[i])

    ntIntfinal = []
    ntIntfinal.append(ntIci[num])
    len2 = len1 + len(ntIntapp)
    for i in range(len1,len2):
        if genes[i] == '1':
            ntIntfinal.append(ntIntapp[i-len1])        

    ntStringbasecp = ntStringbase.copy()
    len3 = len2 + len(ntStringbase)
    for i in range(len2,len3):
        #if i == 19:#ite 保留
        #    continue
        if 'ite' in ntStringbase[i-len2]:
            continue 
        if genes[i] == '1':
            ntStringbasecp.remove(ntStringbase[i-len2])
    for nt in ntStringbasecp:
        ntStringfinal.append(nt)

    

    ntIntbasecp = ntIntbase.copy()
    len4 = len3 + len(ntIntbase)
    for i in range(len3,len4):#这里的ite不需要保留吗
        if genes[i] == '1':
            ntIntbasecp.remove(ntIntbase[i-len3])
    for nt in ntIntbasecp:
        ntIntfinal.append(nt)

    
    ntBoolfinal = []
    ntBoolfinal.append(ntBoolconst)
    ntBoolbasecp = ntBoolbase.copy()
    len5 = len4 + len(ntBoolbase)
    #assert(len5 == LenGene)
    for i in range(len4,len5):
        if genes[i] == '1':
            ntBoolbasecp.remove(ntBoolbase[i-len4])
    for nt in ntBoolbasecp:
        ntBoolfinal.append(nt)
    
    filename = path + '/' + str(num) + '_.sl'
    with open(filename,'w') as f:
        for p in funcs:
            print(p,file=f)
        for p in header[num]:
            print(p,file=f)
        #if genes[31] == '1':
        #    p = ' (ntString@30 String ('
        #else:
        p = ' (ntString String ('
        print(p,file=f)
        for p in ntStringfinal:
            p_= t+p
            print(p_,file=f)
        print('))',file=f)
        #if genes[32] =='1':
        #    p = ' (ntInt@14 Int ('
        #else:
        p = ' (ntInt Int ('
        print(p,file=f)
        for p in ntIntfinal:
            p_ = t+p
            print(p_,file=f)
        print('))',file=f)
        #if genes[33] =='1':
        #    p = ' (ntBool@10 Bool ('
        #else:
        p = ' (ntBool Bool ('
        print(p,file=f)
        for p in ntBoolfinal:
            p_=t+p
            print(p_,file=f)
        print('))',file=f)
        for p in tailer[num]:
            print(p,file=f)

def getonegene(LenGene):#无限制深度
    s = ''
    for i in range(LenGene):
        if random.random()>0.5:
            s = s + '1'
        else:
            s = s + '0'
    return s

def getvalue(gene,popdict,PATH, exepath,train_set):#path1 = PATH,path2 = run_sygus
    if gene in popdict:
        return popdict[gene]
    
    resultpath = PATH + "/result.txt"
    cmdline = 'rm ' + resultpath
    os.system(cmdline)
    cmdline = 'touch ' + resultpath
    os.system(cmdline)

    for file_id in train_set:
        cmdline = exepath + ' ' + gene + ' ' + file_id
        os.system(cmdline)
    f = open(resultpath)
    value = []
    while True:
        lines = f.readlines(10000)
        if not lines:
            break
        for line in lines:
            value.append(eval(line))

    return value

def listratio(sample,popdict,PATH,exepath,train_set):#29个比例作为特征值
    value1 = getvalue(sample,popdict,PATH,exepath,train_set)
    value2 = getvalue('0'*len(sample),popdict,PATH,exepath,train_set)
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

def countdelete():
    pass

def countappend():
    pass

def countfails():
    pass

def getfeature(sample,feature_map,popdict,PATH,exepath,train_set):#字典是引用
    if sample in feature_map:
        return feature_map[sample]
    feature = []
    ratio = listratio(sample,popdict,PATH,exepath,train_set) 
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

def get_real_timelist(TrainGenePath,gene,train_set,timeout = 300):
    timelist = []
    samplepath = TrainGenePath + '/' + gene
    #filesname = os.listdir(samplepath)
    for file_id in train_set:
        outfilename = samplepath + '/' + str(file_id) + '_.out'
        f = open(outfilename)
        lines = f.readlines()
        if len(lines) == 0:
            timelist.append(timeout)
        elif len(lines) == 4:
            timelist.append(eval(lines[3]))
        f.close()
    return timelist

def get_real_ratio(basetimelist,TrainGenePath,gene,train_set):
    if len(basetimelist) == 0:
        basetimelist = get_real_timelist(TrainGenePath,'0'*len(gene),train_set)
    selftimelist = get_real_timelist(TrainGenePath,gene,train_set)
    ratio = 1.0
    for i in range(len(selftimelist)):
        ratio = ratio * basetimelist[i]/selftimelist[i]
    ratio = ratio**(1/len(train_set))
    return ratio

def get_max_min_ratio(TrainGenePath,LenGene,train_set):
    basetimelist = get_real_timelist(TrainGenePath,'0'*LenGene,train_set)
    base_ratio = 1.0
    cnt_max = 0
    cnt_min = 0
    max_ratio = 1.0
    min_ratio = 1.0
    max_gene = '0'*LenGene
    min_gene = max_gene
    genenames = os.listdir(TrainGenePath)
    for gene in genenames:
        if gene =='cache':
            continue
        new_ratio = get_real_ratio(basetimelist,TrainGenePath,gene,train_set)
        if new_ratio > max_ratio:
            max_ratio = new_ratio
            max_gene = gene
        if new_ratio < min_ratio:
            min_ratio = new_ratio
            min_gene = gene
        if new_ratio >= base_ratio:
            cnt_max = cnt_max + 1
        else:
            cnt_min = cnt_min + 1
    return max_ratio,max_gene,cnt_max,min_ratio,min_gene,cnt_min



def create_csv(TrainGenePath,PATH,exepath,train_set):#TrainGenePath = .../TrainGenes
    GenePath = TrainGenePath
    genesname = os.listdir(GenePath)
    pop_dict ={}
    sample_feature_map = {}
    feature_map = {}
    for sample in genesname:
        if sample == 'cache':#if len(sample)==5
            continue
        feature = getfeature(sample,feature_map,pop_dict,PATH,exepath,train_set)
