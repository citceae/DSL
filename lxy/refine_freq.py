
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
        self.label = False
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
        #self.label = label
        tmpnode = self
        while tmpnode.parent != None:
            tmpnode = tmpnode.parent
        return tmpnode  
    
    def recusive_copy(self):
        newnode = Node(self.name)
        if self.label == True:
            newnode.label = True
        for sn in range(len(self.subnodes)):
            newnode.subnodes[sn] = self.subnodes[sn].recusive_copy()
            newnode.subnodes[sn].parent = newnode

        return newnode


    def clone(self,label=True):
        self.label = label
        root = self.getroot()
        root_copied = root.recusive_copy()
        bfs = [root_copied]
        while len(bfs) > 0:
            tmpnode = bfs.pop(0)
            if tmpnode.label == True:
                #tmpnode.label = False # no label
                self.label = False # no label 1
                return tmpnode
            for subnode in tmpnode.subnodes:
                bfs.append(subnode)
        assert(False)

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
       
#把上述的signal再翻译处理一下
#1.StringConst换成S
#2.如果出现了两次ParamX换成特殊的SP（表示这是同样的两个量） 给定最大的Param的范围[!]
#3.preter相同的去重
def interpreter(treenode:Node):#最大param范围
    s = treenode.getsignal()
    while "StringConst" in s:
        s = s.replace("StringConst","S")
    if s.count("Param0") > 1:
        while "Param0" in s:
            s = s.replace("Param0","S0")
    else:
        s = s.replace("Param0",'S')
    if s.count("Param1") > 1:
        while "Param1" in s:
            s = s.replace("Param1","S1")
    else:
        s = s.replace("Param1",'S')
    return s
    
def create_funcbody(treenode:Node,tmpdict:dict):
    s = ''
    #flag = False
    if len(treenode.subnodes) > 0:
        s = s + '('
    if treenode.name in tmpdict:
        s = s + chr(65 + tmpdict[treenode.name]) + ' '
    else:
        s = s + treenode.name + ' '
    
    for subnode in treenode.subnodes:
        s = s + create_funcbody(subnode,tmpdict)
        if subnode != treenode.subnodes[-1]:
            s = s + ' '
    if len(treenode.subnodes) > 0:
        s = s + ')'
    return s
    

#返回genes.py中的funcs数组 done
#函数命名，变量编号
#func0-func1-... A-B-C-...
def createonefunc(treenode:Node,idx):
    rets = '(define-fun '
    funcname = 'func'+str(idx)+' '
    rets = rets + funcname + ' '

    tmpdict = {}
    bfs = [treenode]
    cnt = 0
    cntS = 0
    cntC = 0
    cntN = 0
    sign = '('
    while len(bfs) > 0:
        t = bfs.pop(0)
        if t.name == 'S':
            t.name = t.name + str(cntS)
            cntS = cntS + 1
            sign = sign + "(" + chr(65+cnt) + ' ' + t.type.capitalize() + ") "
            tmpdict[t.name] = cnt
            cnt = cnt + 1           
        if t.name == 'StringConst':
            t.name = t.name + str(cntC)
            cntC = cntC + 1
            sign = sign + "(" + chr(65+cnt) + ' ' + t.type.capitalize() + ") "
            tmpdict[t.name] = cnt
            cnt = cnt + 1
        if t.name == "N":
            t.name = t.name + str(cntN)
            cntN = cntN + 1
            sign = sign + "(" + chr(65+cnt) + ' ' + t.type.capitalize() + ") "
            tmpdict[t.name] = cnt
            cnt = cnt + 1
        if "Param" in t.name and t.name in tmpdict:
            sign = sign + "(" + chr(65+tmpdict[t.name]) + ' ' + t.type.capitalize() + ") "
        if "Param" in t.name and t.name not in tmpdict:
            sign = sign + "(" + chr(65+cnt) + ' ' + t.type.capitalize() + ") "
            tmpdict[t.name] = cnt
            cnt = cnt + 1
        for subnode in t.subnodes:
            bfs.append(subnode)

    sign = sign + ')'
    rets = rets + sign + ' '

    if treenode.type == 'string':
        functype = 'String'
    elif treenode.type == 'int':
        functype = 'Int'
    elif treenode.type == 'bool':
        functype = 'Bool'
    else:
        assert(False)
    rets = rets + functype + ' '

    funcbody = create_funcbody(treenode,tmpdict)
    rets = rets + funcbody + ')'

    return rets


def createfunc(treelist:list[Node]):
    funcs = ['(set-logic SLIA)']
    for i in range(len(treelist)):
        funcs.append(createonefunc(treelist[i],i))
    return funcs

def createoneapp(treenode:Node,i):
    app = '(func'+str(i)
    bfs = [treenode]
    while len(bfs) > 0:
        t = bfs.pop(0)
        if len(t.subnodes) == 0:
            app = app + ' nt' + t.type.capitalize()
        for subnode in t.subnodes:
            bfs.append(subnode)
    app = app + ')'
    return app 
        


def createapp(treelist:list[Node]):#返回genes.py中的ntIntapp，ntStringapp数组，应该不会有ntBoolapp吧
    ntIntapp = []
    ntStringapp = []
    for i in range(len(treelist)):
        app = createoneapp(treelist[i],i)
        if treelist[i].type == 'int':
            ntIntapp.append(app)
        elif treelist[i].type == 'string':
            ntStringapp.append(app)
        else:
            assert(False)
    return ntIntapp,ntStringapp

def getfnins(systemtype = 'linux'):
    if systemtype == 'linux':
        slash = '/'
        path = "/mnt/d/code/DSL/lxy"
    elif systemtype == 'windows':
        slash = '/'
        path = "D:/code/DSL/lxy"
    #基于sleuth生成的频繁模式 获得经过筛选后的可用的频繁模式  
    f = open(path+"/freq_sleuth.txt")
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

    #对每一个频繁模式建所有可能的完全树 去掉等价的部分
    #处理映射关系
    f = open(path+"/dict2.txt")
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

    base_trees = getbasetree()

    treelist=[]
    for ap in refined_freq_list:
        a = ap[0]
        newnode = Node(opmap[a[0]])
        bfs = [newnode]
        for i in a[1:]:
            if i == '-1':
                newbfs = []
                for tmpnode in bfs:
                    newnode = tmpnode.parent
                    assert(newnode!=None)
                    newbfs.append(newnode)
                bfs = newbfs
                continue
            newbfs = []
            newnode = Node(opmap[i])
            while len(bfs) > 0:
                tmpnode = bfs.pop(0)
                for subnode in tmpnode.subnodes:
                    if subnode.type == newnode.type and (subnode.name == 'S' or subnode.name == 'N'):
                        p = subnode.clone().parent
                        flag = False
                        for sn in range(len(p.subnodes)):
                            if p.subnodes[sn].label == True:
                                rpnode = Node(opmap[i])
                                p.subnodes[sn] = rpnode
                                rpnode.parent = p
                                newbfs.append(rpnode)
                                #print(1)
                                flag = True
                                break
                        assert(flag)
                        subnode.label = False # no label
                
            bfs = newbfs
        #print("bfs:",len(bfs))
        for t in bfs:
            newtree = t.getroot()
            treelist.append(newtree)
            #print(interpreter(newtree))


    #print(len(treelist))                        

    '''这是带有domain knowledge的版本
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
    '''

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


    #print(len(updated_treelist))
    #for t in updated_treelist:
    #    print(interpreter(t))

    #print('----------------------------------------------------------------')
    #for t in updated_treelist:
    #    print(t.getsignal())

    #print('----------------------------------------------------------------')
    funcs = createfunc(updated_treelist)
    

    #print('----------------------------------------------------------------')
    ntIntapp,ntStringapp = createapp(updated_treelist)
    return funcs,ntIntapp,ntStringapp

# funcs,ntIntapp,ntStringapp = getfnins()
# for i in funcs:
#     print(i)
# for i in ntStringapp:
#     print(i)
# for i in ntIntapp:
#     print(i)


