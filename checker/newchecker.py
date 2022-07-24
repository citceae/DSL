'''
S->S+S|x|y|z|IF B then S else S
B->S<S
'''

from re import X
from socket import timeout

from z3 import *
import json
import copy as cp
import sys
import time
from numpy import *

t0=time.perf_counter() 
f=open('depth=2_op1_tl=10.txt','w')
old=sys.stdout #将当前系统输出储存到临时变量
sys.stdout=f #输出重定向到文件

'''
1.任意一条表达式的表示方法（树结构） 列表记录同一个非终结符的产生式 Done
2.展开方法：拿到某一个根节点 利用基础产生式进行一次展开 Done
3.读取表达式并根据其中的非终结符个数进行映射 映射可以直接和一个固定的变量列表做遍历  一侧固定 另一侧按数量遍历 生成对应的z3表达式
'''

nonterm = ["S","B"] 
term = ['x','y','z','0','1'] #TODO:常数的处理  

intlist = ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z']
boollist = ['A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z']
A = []

dict_fuck = {"x":"X","y":"Y","z":"Z"}
trash = "(define-fun func"
func = -5

vari0 = 0
vari1 = 0
intname = 'a'
boolname = 'b'
Z3TIMEOUT=10

def permute(nums):

    length = len(nums)

    permutations = []

    def _permute(index=0):

        if index == length:
            permutations.append(nums[0:length])
        
        for i in range(index,length):
            nums[i],nums[index] = nums[index],nums[i]
            _permute(index+1)
            nums[i],nums[index] = nums[index],nums[i]
            
    _permute()

    return permutations

for k in range(9):
    nums = [i for i in range(k)]
    P = permute(nums)
    A.append(P)

#print(A)

gg = "-----------------------"
timerecord = []

def prove(f):
    s = Solver()
    s.add(Not(f))
    s.set(timeout=Z3TIMEOUT)
    #print(f)
    if s.check() == unsat:
        #print(f)
        #print("proved")
        return True
    else:
        #print("failed to prove")
        return False
    

class Node:
    def __init__(self,Nodelist,val) -> None:
        self.Nodelist = Nodelist
        self.val = val #only when nodelist is empty the val is used to print the last term
        self.label = ''

    def nodeprint(self):
        if self.Nodelist ==[]:
            print(self.val+' ',end='')
        else:
            print("(",end='')
            if self.val == "If":
                print("ite ",end ='')
            else:
                print(self.val+' ',end='')
            for n in self.Nodelist:
                    n.nodeprint()
            print(")",end='')
    
    def bodyprint(self): #TODO:head和body连在一起写
        global vari0
        global vari1 
        global dict_fuck
        if self.Nodelist ==[]:
            if self.val == "S":
                vari0 +=1
                print(intname+str(vari0)+' ',end='')
            elif self.val == "B":
                vari1 +=1
                print(boolname+str(vari1)+' ',end='')
            else:
                if self.val in dict_fuck:
                    print(dict_fuck[self.val]+' ',end='')
                else:
                    print(self.val+" ",end='')
        else:
            print("(",end='')
            if self.val == "If":
                print("ite ",end ='')
            else:
                print(self.val+' ',end='')
            for n in self.Nodelist:
                    n.bodyprint()
            print(")",end='')

    def headprint(self):
        global vari0
        global vari1
        global dict_fuck
        if self.Nodelist ==[]:
            if self.val == "S":
                print("(",end='')
                vari0 +=1
                print(intname+str(vari0)+" Int) ",end='')
            elif self.val == "B":
                print("(",end='')
                vari1 +=1
                print(boolname+str(vari1)+" Bool) ",end='')
            else:
                if self.val in dict_fuck:
                    print("("+dict_fuck[self.val] + " Int) ",end='') #因为x,y,z不能直接被识别


        else:
            for n in self.Nodelist:
                    n.headprint()
        
    def typeprint(self):
        global dict_fuck
        if self.Nodelist ==[]:
            if self.val == "S":
                print('Start ',end='')
            elif self.val == "B":
                print('StartBool ',end='')
            else:
                if self.val in dict_fuck:
                    print(dict_fuck[self.val]+' ',end='')
        else:
            for n in self.Nodelist:
                    n.typeprint()


    def copy(self):
        newNode = Node([],self.val)
        for n in self.Nodelist:
            newNode.Nodelist.append(n.copy())
        return newNode

class Rule:
    def __init__(self,left,right) -> None:
        self.left = left
        self.right = right

    def ruleprint(self):
        print(self.left + '->',end='')
        self.right.nodeprint()
        print("") 

    def bodyprint(self):
        global vari0
        global vari1 
        vari0 = 0
        vari1 = 0
        self.right.bodyprint()
        
    def lefttypeprint(self):
        if self.left == "S":
            print("Int ",end='')
        elif self.left == "B":
            print("Bool ",end = '')
        else:
            assert(False)
    
    def righttypeprint(self):
        self.right.typeprint()

    def headprint(self):
        global vari0
        global vari1
        vari0=0
        vari1=0
        print("(",end='')
        self.right.headprint()
        print(") ",end='')


    def getaimNode(self,cnt,nonterm):
        tmpcnt = 0
        if self.right.val in nonterm:
            if tmpcnt == cnt:
                return self.right
            else:
                tmpcnt = tmpcnt + 1
        idx = 0
        searchlist = [] 
        for n in self.right.Nodelist:
            searchlist.append(n)
        while len(searchlist)>idx:
            fn = searchlist[idx]
            if fn.val in nonterm:
                if tmpcnt == cnt:
                    #print("fn-----------",end='')
                    #print(id(fn))
                    return fn#!!!是否拿到的是引用可以直接修改
                else:
                    tmpcnt=tmpcnt+1
            for nn in fn.Nodelist:
                searchlist.append(nn)
            idx = idx + 1
        return None
    
    def copy(self):
        newrule = Rule(self.left,self.right.copy())
        return newrule

class DSL:
    def __init__(self,nonterm,term,rule,startterm):
        self.nonterm = nonterm
        self.term = term
        self.rule = rule
        self.startterm = startterm
    
    def dslprint(self):
        for r in self.rule:
            r.ruleprint()
    
    def newprint(self):
        global func 
        func = -5
        for r in self.rule:
            func += 1
            print(trash+str(func)+' ',end='')
            r.headprint()
            r.lefttypeprint()
            r.bodyprint()
            print(')')

    def secondprint(self):
        global func
        func = -5
        for r in self.rule:
            func +=1
            print("(func"+str(func)+' ',end='')
            r.righttypeprint()
            print(')')

    
'''
    def speprint(self):
        assert(spec=='')
        for r in self.rule:
            r.speprint()
'''
    
def extendDSL(dsl:DSL, rule:list):
    nonterm = dsl.nonterm
    term = dsl.term
    startterm = dsl.startterm

    newrule = []
    for r in dsl.rule:
        #print('r-----------',end='')
        #r.ruleprint()
        aimcnt = 0
        while True:
        #遍历right（树形nodelist）中的所有节点 如果是一个非终结符 用对应的非终结符展开式展开一层 重新构造一棵树形rule加入到newrule中
            tmprule=r.copy()
            #print("first-----------",end='')
            #tmprule.ruleprint()
            n = tmprule.getaimNode(aimcnt,nonterm)
            #print("second-----------",end='')
            #tmprule.ruleprint()
            #print("n---------",end='')
            #print(id(n))
            if n == None:
                break
            else:
                aimcnt = aimcnt + 1
            aimnonterm = n.val
            for initrule in rule:
                if aimnonterm == initrule.left:
                    #print("initrule---------",end='')
                    #initrule.ruleprint()
                    n.Nodelist = cp.deepcopy(initrule.right.Nodelist)
                    n.val = initrule.right.val
                    #print('newn------------',end='')
                    #n.nodeprint()
                    onenewrule = tmprule.copy()
                    #tmprule.ruleprint()
                    #print("onenewrule------------",end='')
                    #onenewrule.ruleprint()
                    #print("finish---------------")
                    newrule.append(onenewrule)
        if aimcnt == 0:
            newrule.append(r)    
    newdsl = DSL(nonterm,term,newrule,startterm)
    return newdsl


def helptrans(nodei:Node):
    if nodei.val == "If":
        assert(len(nodei.Nodelist)==3)
        return If(helptrans(nodei.Nodelist[0]),helptrans(nodei.Nodelist[1]),helptrans(nodei.Nodelist[2]))
    elif nodei.val == "+":
        assert(len(nodei.Nodelist)==2)
        return helptrans(nodei.Nodelist[0]) + helptrans(nodei.Nodelist[1])
    elif nodei.val == "-":
        assert(len(nodei.Nodelist)==2)
        return helptrans(nodei.Nodelist[0]) - helptrans(nodei.Nodelist[1])
    elif nodei.val =="and":
        assert(len(nodei.Nodelist)==2)
        return And(helptrans(nodei.Nodelist[0]),helptrans(nodei.Nodelist[1]))
    elif nodei.val =="or":
        assert(len(nodei.Nodelist)==2)
        return Or(helptrans(nodei.Nodelist[0]),helptrans(nodei.Nodelist[1]))
    elif nodei.val =="not":
        assert(len(nodei.Nodelist)==1)
        return Not(helptrans(nodei.Nodelist[0]))
    elif nodei.val == "<":
        assert(len(nodei.Nodelist)==2)
        return helptrans(nodei.Nodelist[0]) < helptrans(nodei.Nodelist[1])
    elif nodei.val == "=":
        assert(len(nodei.Nodelist)==2)
        return helptrans(nodei.Nodelist[0]) == helptrans(nodei.Nodelist[1])
    elif nodei.val == "<=":
        assert(len(nodei.Nodelist)==2)
        return helptrans(nodei.Nodelist[0]) <= helptrans(nodei.Nodelist[1])
    else:
        if nodei.val in term:
            if nodei.val == '0':
                return 0
            elif nodei.val == '1':
                return 1
            else:
                x = Int(nodei.val)
                return x
        else:
            assert(nodei.val in nonterm)
            assert(nodei.label!='')
            if nodei.val == 'S':
                x = Int(nodei.label)
            else:
                x = Bool(nodei.label)
            return x


def trans(nodei:Node,intper,boolper):
    searchlist = [] 
    for n in nodei.Nodelist:
        searchlist.append(n)
    intcnt = 0
    boolcnt = 0
    while searchlist != []:
        fn = searchlist.pop(0)
        if fn.val in nonterm:
            if fn.val == nonterm[0]:
                fn.label = intlist[intper[intcnt]]
                intcnt = intcnt + 1
            elif fn.val == nonterm[1]:
                fn.label = boollist[boolper[boolcnt]]
                boolcnt = boolcnt+1
            else:
                assert(False)
        for nn in fn.Nodelist:
            searchlist.append(nn)
    #把所有label给出
    ret = helptrans(nodei)
    return ret
    
    

def transall(nodei:Node): #所有映射
    searchlist = [] 
    for n in nodei.Nodelist:
        searchlist.append(n)
    intcnt = 0
    boolcnt = 0
    while searchlist != []:
        fn = searchlist.pop(0)
        if fn.val in nonterm:
            if fn.val == nonterm[0]:
                intcnt = intcnt + 1
            elif fn.val == nonterm[1]:
                boolcnt = boolcnt+1
            else:
                assert(False)
        for nn in fn.Nodelist:
            searchlist.append(nn)
    
    ret = []
    for i in range(len(A[intcnt])):
        for j in range(len(A[boolcnt])):
            hs = trans(nodei,A[intcnt][i],A[boolcnt][j])
            ret.append(hs)
    return ret
    
def transone(nodei:Node):#第一个映射
    searchlist = [] 
    for n in nodei.Nodelist:
        searchlist.append(n)
    intcnt = 0
    boolcnt = 0
    while searchlist != []:
        fn = searchlist.pop(0)
        if fn.val in nonterm:
            if fn.val == nonterm[0]:
                intcnt = intcnt + 1
            elif fn.val == nonterm[1]:
                boolcnt = boolcnt+1
            else:
                assert(False)
        for nn in fn.Nodelist:
            searchlist.append(nn)
    return trans(nodei, A[intcnt][0],A[boolcnt][0])

def getNontermNum(nodei:Node):
    searchlist = [] 
    for n in nodei.Nodelist:
        searchlist.append(n)
    intcnt = 0
    boolcnt = 0
    while searchlist != []:
        fn = searchlist.pop(0)
        if fn.val in nonterm:
            if fn.val == nonterm[0]:
                intcnt = intcnt + 1
            elif fn.val == nonterm[1]:
                boolcnt = boolcnt+1
            else:
                assert(False)
        for nn in fn.Nodelist:
            searchlist.append(nn)
    return intcnt,boolcnt

def checkrule(rule,starti):#TODO
    flag = False
    for i in range(starti,len(rule)):
        lhscnt1,lhscnt2 = getNontermNum(rule[i].right)
        lhslist = transall(rule[i].right)
        for j in range(i+1,len(rule)):
            rhscnt1,rhscnt2 = getNontermNum(rule[j].right)
            if lhscnt1!=rhscnt1 or lhscnt2!=rhscnt2:
                continue
            if rule[i].left == rule[j].left:
                rhs = transone(rule[j].right)
                for lhs in lhslist:                                                    
                    aim = lhs == rhs
                    p = time.perf_counter()
                    flag = prove(aim)
                    q = time.perf_counter()
                    timerecord.append(q-p)
                    if flag:
                        rule.remove(rule[j])
                        return rule,flag,i
    return rule,flag,len(rule)-1

def checkDSL(dsl:DSL):
    nonterm = dsl.nonterm
    term = dsl.term
    startterm = dsl.startterm

    newrule = dsl.rule.copy()
    newi = 0
    while True:
        newrule,flag,newi = checkrule(newrule,newi)
        if not flag:
            break
    newdsl = DSL(nonterm,term,newrule,startterm)
    return newdsl
'''
rule =[] 
rule1 = Rule("S",Node([Node([],"S"),Node([],"S")],"+"))
rule2 = Rule("S",Node([],'x'))
rule3 = Rule("S",Node([],'y'))
rule4 = Rule("S",Node([],'z'))
rule5 = Rule("S",Node([Node([],'B'),Node([],'S'),Node([],'S')],'If'))   
rule6 = Rule("B",Node([Node([],'S'),Node([],'S')],'<'))
rule.append(rule1)
rule.append(rule2)
rule.append(rule3)
rule.append(rule4)
rule.append(rule5)
rule.append(rule6)
'''
rule =[] 
rule1 = Rule("S",Node([],'x'))
rule2 = Rule("S",Node([],'y'))
rule3 = Rule("S",Node([],'z'))
rule4 = Rule("S",Node([],'0'))
rule5 = Rule("S",Node([],'1'))
rule6 = Rule("S",Node([Node([],"S"),Node([],"S")],"+"))
rule7 = Rule("S",Node([Node([],"S"),Node([],"S")],"-"))
rule8 = Rule("S",Node([Node([],'B'),Node([],'S'),Node([],'S')],'If'))  
rule9 = Rule("B",Node([Node([],'B'),Node([],'B')],'and'))
rule10 = Rule("B",Node([Node([],'B'),Node([],'B')],'or'))
rule11 = Rule("B",Node([Node([],'B')],'not'))
rule12 = Rule("B",Node([Node([],'S'),Node([],'S')],'<'))
rule13 = Rule("B",Node([Node([],'S'),Node([],'S')],'='))
rule14 = Rule("B",Node([Node([],'S'),Node([],'S')],'<='))
rule.append(rule1)
rule.append(rule2)
rule.append(rule3)
rule.append(rule4)
rule.append(rule5)
rule.append(rule6)
rule.append(rule7)
rule.append(rule8)
rule.append(rule9)
rule.append(rule10)
rule.append(rule11)
rule.append(rule12)
rule.append(rule13)
rule.append(rule14)


dsl0 = DSL(nonterm,term,rule,"S")
#dsl0.dslprint()
#print(gg)

#print('----------------dsl1----------------')
dsl1 = extendDSL(dsl0,rule)
#dsl1.dslprint()
#print(gg)

t1 = time.perf_counter()
gap1 = t1 - t0

dsl1_ = checkDSL(dsl1)
t2 = time.perf_counter()
gap2 = t2 - t1

dsl1_.dslprint()
print(gg)
dsl1_.newprint()
print(gg)
dsl1_.secondprint()


print('----------------dsl2----------------')
dsl2 = extendDSL(dsl1_,rule)
dsl2.dslprint()



dsl2_ = checkDSL(dsl2)
print(gg)
t3 = time.perf_counter() 
gap3=t3-t2

dsl2_.dslprint()
print(gg)
dsl2_.newprint()
print(gg)
dsl2_.secondprint()


#print(timerecord)
print("max:",max(timerecord),"\nmin:",min(timerecord),"\nmean:",mean(timerecord),"\nsum:",sum(timerecord))
cnt = 0
for t in timerecord:
    if t > 0.01:
        cnt = cnt+1
print("time>10ms:",cnt," total:",len(timerecord))
print("time used for gen:",gap1)
print("time used for check:",gap2)
print("time used for gen and check2:",gap3)
sys.stdout=old  #还原系统输出
f.close()


















'''
x1=Int("x1")
x2=Int("x2")
lhs = x1 + x2
rhs = x2 + x1
aim = lhs == rhs
prove(aim)

lhs = If(x1>x2,x1,x2)
rhs = x1
aim = lhs==rhs
prove(aim)

x1=Bool("f")
x2=Int('f')
aim = x1==x2
prove(aim)

a=Int("a")
b=Int('b')
c = a<b
d = b<a
e = a<=b
#print(e)
aim = c == e
prove(aim)
'''