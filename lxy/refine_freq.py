#基于sleuth生成的频繁模式 获得经过筛选后的可用的频繁模式

f = open("/home/citceae/DSL/lxy/freq_sleuth.txt")
value = []
while True:
    lines = f.readlines(10000)
    if not lines:
        break
    for line in lines:
        value.append(line)
f.close()

freq_list = []
for v in value:
    idx = v.index(' - ')
    new_pattern = v[:idx].split()
    new_freq = []
    new_freq.append(new_pattern)
    new_freq.append(eval(v[idx+2:]))
    freq_list.append(new_freq)

#print(freq_list)
#freq_list[0] = [['0','0'],577]

#如果A是B的频繁模式延伸，且频繁度B>k(=0.8)*频繁度A，则去掉A
def testAB(A,B):
    pattern1 = A[0]
    freq1 = A[1]
    pattern2 = B[0]
    freq2 = B[1]
    if len(pattern1) > len(pattern2):
        return False
    flag = True
    for idx in range(len(pattern1)):
        if pattern1[idx] == pattern2[idx]:
            continue
        else:
            flag = False
    if flag and freq1*0.8<freq2:
        return True
    else:
        return False

labels = [1 for i in range(len(freq_list))]
l = len(freq_list)
for i in range(l-1):
    for j in range(i+1,l):
        if testAB(freq_list[i],freq_list[j]):
            labels[i] = 0
            break
        if freq_list[i][0][0] != freq_list[j][0][0]:
            break

refined_freq_list = []
for i in range(len(labels)):
    if labels[i] == 1:
        refined_freq_list.append(freq_list[i])

#for f in refined_freq_list:
#    print(f)
#print(len(refined_freq_list))

#对每一个频繁模式建所有可能的完全树 去掉等价的部分

#处理映射关系
f = open("/home/citceae/DSL/lxy/dict2.txt")
value = []
while True:
    lines = f.readlines(10000)
    if not lines:
        break
    for line in lines:
        value.append(line)
f.close()

opmap = {}
for v in value:
    idx = v.index(':')
    op = v[:idx]
    strnum = v[idx+1:].strip()
    opmap[strnum] = op
#print(opmap)

def createsubnodes(typelist,parentnode):
    for t in typelist:
        subnode = Node(t)
        parentnode.subnodes.append(subnode)
        subnode.parent = parentnode


class Node:
    def __init__(self,name) -> None:
        self.name = name
        self.subnodes = []
        self.parent = None
        if name == 'S' or name == 'StringConst' or 'Param' in name:#Param都当做string处理
            self.type = 'string'
        elif name == 'N':
            self.type = 'int'
        elif name =='str.++':
            self.type = 'string'
            createsubnodes(['S','S'],self)
        elif name == 'str.substr':#(str.substr ntString ntInt ntInt)
            self.type = 'string'
            createsubnodes(['S','N','N'],self)
        elif name == 'str.at':
            self.type = 'string'
            createsubnodes(['S','N'],self)
        elif name == 'str.indexof':#(str.indexof ntString ntString ntInt)
            self.type = 'int'
            createsubnodes(['S','S','N'],self)
        elif name == 'str.len' or name == 'str.to.int':#(str.len ntString)
            self.type = 'int'
            createsubnodes(['S'],self)
        elif name == '+' or name == '-':
            self.type = 'int'
            createsubnodes(['N','N'],self)
        elif name == 'int.to.str':
            self.type ='string'
            createsubnodes(['N'],self)
        elif name == 'str.to.int':
            self.type = 'int'
            createsubnodes(['S'],self)
        elif name == 'str.replace':#(str.replace ntString ntString ntString)
            self.type = 'string'
            createsubnodes(['S','S','S'],self)
        elif name == 'str.contains' or name == 'str.suffixof' or name == 'str.prefixof':
            self.type = 'bool'
            createsubnodes(['S','S'],self)
        elif name == '=':
            self.type = 'bool'
            createsubnodes(['N','N'],self)
        else:#常数项
            self.type = 'int'
        
    def getroot(self):
        tmpnode = self
        while tmpnode.parent != None:
            tmpnode = tmpnode.parent
        return tmpnode          

    def print(self):
        print(self.name,end='')
        if len(self.subnodes)>0:
            print('(',end='')
        for subnode in self.subnodes:
            subnode.print()
            print(' ',end='')
        if len(self.subnodes)>0:
            print(')',end='')
    
    def getsignal(self):
        s = ''
        s = s + self.name
        if len(self.subnodes)>0:
            s = s + '('
        for subnode in self.subnodes:
            s = s + subnode.getsignal()
            if subnode!= self.subnodes[-1]:
                s = s + ' '
        if len(self.subnodes)>0:
            s = s + ')'
        return s


def getbasetree():
    rettree = []
    namelist = ['str.++','str.replace','str.at','int.to.str','str.substr','+','-','str.len','str.to.int','str.indexof']
    for name in namelist:
        newtree = Node(name)
        rettree.append(newtree)
    return rettree


base_trees = getbasetree()
# base_signal = []
# for t in base_trees:
#     s = t.getsignal()
#     base_signal.append(s)
#     print(s)
       
#TODO:StringConst作为常量名的规定
#把上述的signal再翻译处理一下
#1.StringConst换成S
#2.如果出现了两次ParamX换成特殊的SP（表示这是同样的两个量） 给定最大的Param的范围
#3.preter相同的去重
def interpreter(treenode:Node):
    s = treenode.getsignal()
    while "StringConst" in s:
        s = s.replace("StringConst","S")
    if s.count("Param0") > 1:
        while "Param0" in s:
            s = s.replace("Param0","SP")
    else:
        s = s.replace("Param0",'S')
    if s.count("Param1") > 1:
        while "Param1" in s:
            s = s.replace("Param1","SP")
    else:
        s = s.replace("Param1",'S')
    return s
    

#返回genes.py中的funcs数组
#函数命名，变量编号
def createfunc():
    pass

def createapp():#返回genes.py中的ntIntapp，ntStringapp数组
    pass


treelist=[]
#treesignal = []
#虽然丑陋 但是大部分可能已经catch了 去掉无意义的或者等价的
#主要问题在 - 1 N 和 - -1 N上 打了个补丁解决了
for ap in refined_freq_list:
    a = ap[0]
    print(a)
    newtree = Node(opmap[a[0]])
    tmpnode = newtree
    for i in a[1:]:
        #print(i)
        if i == '-1':
            tmpnode = tmpnode.parent
            continue
        newnode = Node(opmap[i])
        for sn in range(len(tmpnode.subnodes)):
            if tmpnode.name == '-' and (newnode.name == '1' or newnode.name == '-1'):
                tmpnode.subnodes[1] = newnode
                newnode.parent = tmpnode
                tmpnode = newnode
                break
            if tmpnode.name == 'str.substr' and newnode.name == 'str.len':
                tmpnode.subnodes[-1] = newnode
                newnode.parent = tmpnode
                tmpnode = newnode
                break
            if tmpnode.subnodes[sn].type == newnode.type and (tmpnode.subnodes[sn].name == 'S' or tmpnode.subnodes[sn].name == 'N'):
                tmpnode.subnodes[sn] = newnode
                newnode.parent = tmpnode
                tmpnode = newnode
                break
    treelist.append(newtree)
    s = newtree.getsignal()
    #treesignal.append(s)
    print(s)      


signals = []
updated_treelist = []

for t in base_trees:
    signals.append(interpreter(t))

for t in treelist:
    newsignal = interpreter(t)
    if newsignal in signals:
        continue
    signals.append(newsignal)
    updated_treelist.append(t)

print(len(treelist))
print(len(updated_treelist))
for t in updated_treelist:
    print(interpreter(t))







