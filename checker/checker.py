'''
S -> S+S | x | y
S -> S+S | x | y | z
'''
from re import X
from z3 import *
import json

'''
2.parser from load_dict
1.DSL表示法

非终结符及其产生式
对产生式的非终结符进行扩展！！！ 将会得到新的DSL
扩展要求产生式能够读取识别出非终结符并展开 
读取DSL同一非终结符的产生式的每一项 进行等价性验证
（链表可以但是看起来低效）

问题：
ite这种符号无法识别

TODO:是否需要parser,目的是修改文法的话可以硬编码
'''


gg = "-----------------------"

class Rule:
    def __init__(self,left,right) -> None:
        self.left = left
        self.right = right
        self.terms = self.right.split()

        

class DSL:
    def __init__(self,nonterm,term,rule,startterm):
        self.nonterm = nonterm
        self.term = term
        self.rule = rule
        self.startterm = startterm
    
    def dslprint(self):
        for r in self.rule:
            print(r.left,'->',r.right)

def atos(t):
    s=""
    for i in range(len(t)):
        s = s + t[i]
        if i != len(t) - 1:
            s = s + ' '
    return s

'''
def extendDSL(dsl:DSL):
    nonterm = dsl.nonterm
    term = dsl.term
    startterm = dsl.startterm

    rule0 = dsl.rule
    newrule = []
    for r in rule0:
        left = r.left
        for i in range(len(r.terms)):
            if r.terms[i] in dsl.nonterm:#可以展开一层 利用dsl的rule0
                for r_ in rule0:
                    if r_.left == left:
                        terms = r.terms.copy()
                        terms[i] = r_.right
                        right = atos(terms)
                        tmprule = Rule(left,right)
                        newrule.append(tmprule)
    newdsl = DSL(nonterm,term,newrule,startterm)
    return newdsl
'''

def extendDSL(dsl:DSL, rule:list):
    nonterm = dsl.nonterm
    term = dsl.term
    startterm = dsl.startterm

    rule0 = dsl.rule
    newrule = []
    for r in rule0:
        left = r.left
        flag = False
        for i in range(len(r.terms)):
            if r.terms[i] in dsl.nonterm:#可以展开一层 利用dsl的rule0
                flag = True
                for r_ in rule:
                    if r_.left == left:
                        terms = r.terms.copy()
                        terms[i] = r_.right#TODO:加括号
                        right = atos(terms)
                        tmprule = Rule(left,right)
                        newrule.append(tmprule)
        if not flag:
            newrule.append(r)
    newdsl = DSL(nonterm,term,newrule,startterm)
    return newdsl

def trans(rulei):#TODO:处理括号 改成前缀表达式
    terms = rulei.terms
    x = Int(terms[0])
    lr = x
    for i in range(2,len(terms),2):
        newx = Int(terms[i]) #需要处理更多运算符
        lr = lr + newx
    return lr      

def prove(f):
    s = Solver()
    s.add(Not(f))
    if s.check() == unsat:
        #print("proved")
        return True
    else:
        #print("failed to prove")
        return False

def checkrule(rule):
    flag = False
    for i in range(len(rule)):
        lhs = trans(rule[i])
        for j in range(i+1,len(rule)):
            rhs = trans(rule[j])
            if rule[i].left == rule[j].left:
                aim = lhs == rhs
                flag = prove(aim)
                if flag:
                    rule.remove(rule[j])
                    return rule,flag
    
    return rule,flag

def checkDSL(dsl:DSL):
    nonterm = dsl.nonterm
    term = dsl.term
    startterm = dsl.startterm

    newrule = dsl.rule.copy()
    while True:
        newrule,flag = checkrule(newrule)
        if not flag:
            break
    newdsl = DSL(nonterm,term,newrule,startterm)
    return newdsl
    



nonterm = ['S']
term = ['x','y','z']
rule = []
rule1 = Rule("S","S + S")
rule2 = Rule("S",'x')
rule3 = Rule("S",'y')
rule4 = Rule("S",'z')
rule.append(rule1)
rule.append(rule2)
rule.append(rule3)
rule.append(rule4)
dsl0 = DSL(nonterm,term,rule,"S")
dsl0.dslprint()

print(gg)
dsl1 = extendDSL(dsl0,rule)
dsl1.dslprint()
print(gg)

dsl1_ = checkDSL(dsl1)
dsl1_.dslprint()
print(gg)

dsl2 = extendDSL(dsl1,rule)
dsl2.dslprint()
print(gg)

dsl2_ = checkDSL(dsl2)
dsl2_.dslprint()
print(gg)
#print("------------------------")
#dsl2 = extendDSL(dsl1,dsl1.rule)
#dsl2.dslprint()

#with open("mpg_guard2.out","r") as load_f:
#    load_dict = json.load(load_f)
    

x1=Int("x1")
x2=Int("x2")
lhs = x1 + x2
rhs = x2 + x1
aim = lhs == rhs
print(aim)



prove(aim)

def f1():
    x = Int("x")
    return x

def f2():
    y = Int('y')
    z = Int('x')
    return y+z


s1 = f1()
s2 = f2() + s1
aim = s1 == s2
print(aim)
prove(aim)