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
import functools
from numpy import *

'''
f=open('repeat=1_op2_tl=10.txt','w')
old=sys.stdout #将当前系统输出储存到临时变量
sys.stdout=f #输出重定向到文件
'''

'''
1.任意一条表达式的表示方法（树结构） 列表记录同一个非终结符的产生式 Done
2.展开方法：拿到某一个根节点 利用基础产生式进行一次展开 Done
3.读取表达式并根据其中的非终结符个数进行映射 映射可以直接和一个固定的变量列表做遍历  一侧固定 另一侧按数量遍历 生成对应的z3表达式
'''

nonterm = ["S","B"] 
#term = ['x','y','z','0','1'] #TODO:常数的处理  
term = ['x','y','0','1','-1','2','-2']
boolterm = ['and','or','not','<','=','<=']
ops = ['and','or','not','<','=','<=','+','-','If']

intlist = ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z']#深度为8时数量不够
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

    def GetOpNum(self):
        cnt = 0
        if self.val in ops:
            cnt = cnt + 1
        for n in self.Nodelist:
            cnt = cnt + n.GetOpNum()
        return cnt

    def GetNodeSign(self):
        if self.Nodelist ==[]:
            #print(self.val+' ',end='')
            s = self.val + ' '
            return s
        else:
            #print("(",end='')
            s = '('
            if self.val == "If":
                #print("ite ",end ='')
                s = s + "ite "
            else:
                #print(self.val+' ',end='')
                s = s + self.val + ' '
            for n in self.Nodelist:
                s = s + n.GetNodeSign()
            #print(")",end='')
            s = s + ")"
            return s
    
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
        self.sign = self.GetRuleSign()

    def GetRuleSign(self):
        s0 = self.left+'->'
        #print(self.left + '->',end='')
        s1 = s0 + self.right.GetNodeSign()
        return s1
    
    def GetOpNum(self):
        return self.right.GetOpNum()

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


def my_compare(x,y):
    if x[0] == y[0]:
        if len(x)>len(y):
            return 1
        elif len(x)<len(y):
            return -1
        if x>y:
            return 1
        else:
            return -1
    else:
        if x[0] == 'S':
            return -1
        else:
            return 1
    return 0

toprintdict ={'+':0,'-':1,'i':2}
def my_compare_toprint(x,y):#TODO:顺序还是有问题
    if x[0] == y[0]:
        #assert(len(x)>=4)
        #assert(len(y)>=4)
        if x[3] != '(' and y[3] != '(':
            if x>y:#调整参数顺序
                return 1
            else:
                return -1
        elif x[3] !='(' or y[3] != '(':
            return len(x)-len(y)
        else:
            if x[4] in toprintdict:
                tmp = toprintdict[x[4]]-toprintdict[y[4]]
                if tmp!=0:
                    return tmp              
        if len(x)>len(y):
            return 1
        elif len(x)<len(y):
            return -1
        if x>y:
            return 1
        else:
            return -1
    else:
        if x[0] == 'S':
            return -1
        else:
            return 1
    return 0   

#alpha_b = {' ':0,'x':1,'y':2,'z':3,'0':4,'1':5,'+':6,'-':7,'i':8,'a':9,'o':10,'n':11,'<':12,'=':13,'S':14,'B':15,'t':16,'e':16,'r':16,'d':16,'(':17,')':18,'>':1000}#顺便也改回xyz01吧 换一个case都需要改 TODO
alpha_b = {' ':0,'x':1,'y':2,'0':4,'1':5,'-1':5.1,'2':5.2,'-2':5.3,'+':6,'-':7,'i':8,'a':9,'o':10,'n':11,'<':12,'=':13,'S':14,'B':15,'t':16,'e':16,'r':16,'d':16,'(':17,')':18,'>':1000}#顺便也改回xyz01吧 换一个case都需要改 TODO

#<和<=
def my_compare_final(x:str,y:str):
    len1 = len(x)
    len2 = len(y)
    for i in range(min(len1,len2)):
        tmp = alpha_b[x[i]] - alpha_b[y[i]]
        if tmp != 0:
            return tmp
    return len1-len2


class DSL:
    def __init__(self,nonterm,term,rule,startterm):
        self.nonterm = nonterm
        self.term = term
        self.rule = rule
        self.startterm = startterm
        self.DSLsign = dict()
        for r in rule:
            self.DSLsign[r.sign] = r
        #self.DSLsignsort()
        self.extendedrule = []

    def getrule(self):
        rules = []
        for sign in self.DSLsign:
            rules.append(self.DSLsign[sign])
        return rules    

    def DSLsignsort(self):#仅仅为了输出打印 根据长度原则
        return sorted(self.DSLsign,key=functools.cmp_to_key(my_compare))
        #for i in self.DSLsign:
        #    print(i)
    
    def DSLsignsorttoprint(self):#这才是为了输出打印 顺序还是有问题
        return sorted(self.DSLsign,key=functools.cmp_to_key(my_compare_toprint))

    def DSLsignsortfinal(self):#最终版！
        return sorted(self.DSLsign,key=functools.cmp_to_key(my_compare_final))

    def dslprint(self):
        for key,value in self.DSLsign.items():
            print(value.GetRuleSign())
    
    def newprint(self):
        global func 
        func = -5
        for r in self.DSLsign:#in sorted(self.DSLsign)?
            func += 1
            print(trash+str(func)+' ',end='')
            self.DSLsign[r].headprint()
            self.DSLsign[r].lefttypeprint()
            self.DSLsign[r].bodyprint()
            print(')')

    def secondprint(self):
        global func
        func = -5
        for r in self.DSLsign:
            func +=1
            print("(func"+str(func)+' ',end='')
            self.DSLsign[r].righttypeprint()
            print(')')

    def helpprintnodes(self,signtointdict,inttoNodedict):
        num = 1
        s = ''
        while(len(inttoNodedict)>0):
            assert(num in inttoNodedict)
            n = inttoNodedict.pop(num)
            if n.val in boolterm:
                ty = 'Bool'
            else:
                ty = "Int"
            s = s + '(N' + str(num) +' '+ty+' ('
            if n.val in term:
                s = s + n.val + '))\n'
            else:
                assert(len(n.Nodelist)>0)
                if n.val == "If":
                    s = s + '(ite '
                else:
                    s = s + '('+n.val
                for nn in n.Nodelist:
                    if nn.GetNodeSign() == "S ":
                        s = s + ' '+ "Start"
                    elif nn.GetNodeSign() == "B ":
                        s = s + ' '+ "StartBool"
                    else:
                        sign = nn.GetNodeSign()
                        if sign in signtointdict:
                            tmpnum = signtointdict[sign]
                            s = s + ' '+"N"+str(tmpnum)
                        else:
                            tmpnum = len(signtointdict)+1
                            signtointdict[sign] = tmpnum
                            inttoNodedict[tmpnum] = nn
                            s = s + ' '+"N"+str(tmpnum)
                s = s + ')))\n'
            num = num + 1
        return s
            


    def nontermprint(self):
        s = ''
        gaps = '        '
        signtointdict = {}
        inttoNodedict = {}
        sortedr = self.DSLsignsortfinal()
        s = s + "((Start Int (\n"
        flag = False
        for r in sortedr:
            if self.DSLsign[r].left == "B":
                if not flag:
                    s = s + gaps + '))\n'
                    s = s + '(StartBool Bool (\n'
                    flag = True
            else:
                pass
            if self.DSLsign[r].right.val in term:
                s = s + gaps + self.DSLsign[r].right.val+'\n'
            else:
                if self.DSLsign[r].right.val == "If":
                    s = s + gaps + '(' + "ite"
                else:
                    s = s + gaps + '(' + self.DSLsign[r].right.val 
                assert(len(self.DSLsign[r].right.Nodelist)>0)
                for n in self.DSLsign[r].right.Nodelist:
                    if n.GetNodeSign() == "S ":
                        s = s + ' '+ "Start"
                    elif n.GetNodeSign() == "B ":
                        s = s + ' '+ "StartBool"
                    else:
                        sign = n.GetNodeSign()
                        if sign in signtointdict:
                            num = signtointdict[sign]
                            s = s + ' '+"N"+str(num)
                        else:
                            num = len(signtointdict)+1
                            signtointdict[sign] = num
                            inttoNodedict[num] = n
                            s = s + ' '+"N"+str(num)
                s = s+')\n'
        s = s + gaps + "))\n"
        s = s + self.helpprintnodes(signtointdict,inttoNodedict)
        s = s + '))\n'
        return s 

    
            


    
def extendDSL(dsl:DSL, rule:list,aim_repeat:int):
    nonterm = dsl.nonterm
    term = dsl.term
    startterm = dsl.startterm

    labelrule = dsl.rule[0]
    now_repeat = 0
    newrule = dsl.rule.copy()
    while len(newrule) > 0:
        r = newrule.pop(0)
        #print('r-----------',end='')
        #r.GetRuleSign()

        aimcnt = 0
        while True:
        #遍历right（树形nodelist）中的所有节点 如果是一个非终结符 用对应的非终结符展开式展开一层 重新构造一棵树形rule加入到newrule中
            tmprule=r.copy()
            #print("first-----------",end='')
            #tmprule.GetRuleSign()
            n = tmprule.getaimNode(aimcnt,nonterm)
            #print("second-----------",end='')
            #tmprule.GetRuleSign()
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
                    #initrule.GetRuleSign()
                    n.Nodelist = cp.deepcopy(initrule.right.Nodelist)
                    n.val = initrule.right.val
                    #print('newn------------',end='')
                    #n.GetNodeSign()
                    onenewrule = tmprule.copy()
                    #tmprule.GetRuleSign()
                    #print("onenewrule------------",end='')
                    #onenewrule.GetRuleSign()
                    #print("finish---------------")
                    newrule.append(onenewrule)
            break #之展开一次 while结构可以去掉
        if aimcnt == 0:
            newrule.append(r) 
        if newrule[0] ==labelrule:
            now_repeat += 1
            if now_repeat >= aim_repeat:
                break   
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

def checkrule(rule,starti,proved_cnt):#TODO
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
                    #p = time.perf_counter()
                    flag = prove(aim)
                    #q = time.perf_counter()
                    #timerecord.append(q-p)
                    if flag:
                        proved_cnt = proved_cnt + 1
                        print(rule[i].GetRuleSign())
                        print(rule[j].GetRuleSign())
                        rule.remove(rule[j])
                        return rule,flag,i,proved_cnt
    return rule,flag,len(rule)-1,proved_cnt

def newcheckrule(newrule,rulelen):#允许检查长度相邻的项
    proved_cnt = 0
    marks = []
    idx1 = 0
    idx2 = idx1+1
    changedlen = rulelen[idx1] #记录第一次长度变化 这是允许的
    lhscnt1,lhscnt2 = getNontermNum(newrule[idx1].right)
    lhslist = transall(newrule[idx1].right)
    flag = False
    proveflag = False
    t = 0
    while idx1 <= len(newrule)-2:
        if idx2 > len(newrule)-1 or (flag and rulelen[idx2] != changedlen):
            t = t+1
            idx1 = idx1+1
            idx2 = idx1+1
            lhscnt1,lhscnt2 = getNontermNum(newrule[idx1].right)
            lhslist = transall(newrule[idx1].right)
            flag = False
            continue
        if not flag and rulelen[idx2] != rulelen[idx1]:
            flag = True
            changedlen = rulelen[idx2]
        rhscnt1,rhscnt2 = getNontermNum(newrule[idx2].right)
        if lhscnt1!=rhscnt1 or lhscnt2!=rhscnt2:#非终结符个数要相同
            idx2 = idx2 + 1
            continue
        if newrule[idx1].left == newrule[idx2].left:
            rhs = transone(newrule[idx2].right)
            for lhs in lhslist:                                                    
                aim = lhs == rhs
                #p = time.perf_counter()
                proveflag = prove(aim)
                #q = time.perf_counter()
                #timerecord.append(q-p)
                if proveflag:
                    print(newrule[idx1].GetRuleSign())
                    print(newrule[idx2].GetRuleSign())
                    proved_cnt = proved_cnt + 1
                    #newrule.pop(idx2)#pop时间代价大改用标签？
                    #rulelen.pop(idx2)
                    marks.append(idx2)
                    idx2 = idx2 + 1
                    break
            if proveflag:
                proveflag = False
                continue
            else:
                idx2 = idx2+1
                continue
        else:
            flag = True
            changedlen = -1
            #必然需要切换左指针
            continue
    #print(t)
    retrule = []
    for idx in range(len(newrule)):
        if idx not in marks:
            retrule.append(newrule[idx])
    return proved_cnt,retrule


            



def checkDSL(dsl:DSL):#TODO:树状去重
    nonterm = dsl.nonterm
    term = dsl.term
    startterm = dsl.startterm

    newrule = dsl.rule.copy()#
    newi = 0
    proved_cnt = 0
    while True:
        newrule,flag,newi,proved_cnt= checkrule(newrule,newi,proved_cnt)
        if not flag:
            break
    newdsl = DSL(nonterm,term,newrule,startterm)
    return newdsl,proved_cnt

def newcheckDSL(dsl:DSL):#近似
    nonterm = dsl.nonterm
    term = dsl.term
    startterm = dsl.startterm
    sortedr = dsl.DSLsignsort()
    newrule = []
    rulelen = []
    for r in sortedr:
        newrule.append(dsl.DSLsign[r].copy())
        rulelen.append(dsl.DSLsign[r].GetOpNum())
    proved_cnt,newrule = newcheckrule(newrule,rulelen)
    newdsl = DSL(nonterm,term,newrule,startterm)
    return newdsl,proved_cnt
    


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


t0=time.perf_counter() 
#print('----------------dsl1----------------')
dsl1 = extendDSL(dsl0,rule,1)
dsl1.dslprint()
print(gg)

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
'''
'''
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
'''

'''
#print(timerecord)
print("max:",max(timerecord),"\nmin:",min(timerecord),"\nmean:",mean(timerecord),"\nsum:",sum(timerecord))
cnt = 0
for t in timerecord:
    if t > 0.01:
        cnt = cnt+1
print("time>10ms:",cnt," total:",len(timerecord))
print("time used for gen:",gap1)
print("time used for check:",gap2)
#print("time used for gen and check2:",gap3)
sys.stdout=old  #还原系统输出
f.close()
'''

















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