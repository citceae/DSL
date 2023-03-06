#input:修改后的DSL 某一个task对应的解集合
#output:DSL空间中第一个属于解集合中的程序的排序
#0.构建数据结构
#1.解集合读取
#2.修改后的DSL的读取（对应的start类型 可能不一定重要）
#3.贪心枚举
#在有限制深度的情况下，也需要实现裁剪文法和 在当前裁剪后的文法下，使用k次产生式一共能有多少个程序这个任务

import json

class Program:
    def __init__(self,type_,progname,param_list,opname,sub_node) -> None:#name,string,paran_list:list[Nonterminal]每次copy String之类的，sub_progs:ProgNode
        self.type_ = type_
        self.progname = progname
        self.param_list = param_list
        self.opname = opname#好像不需要0131.0507
        self.sub_node = sub_node

    def printprog(self):
        print(self.progname)
        print(self.type_)
        print(self.param_list)
        #print(self.opname)
        self.sub_node.print()

class ProgNode:
    def __init__(self,name,sub_nodes) -> None:
        self.name = name #"substr","X",0,"true"
        self.sub_nodes = sub_nodes

    def getstr(self):#可以加一些括号
        s = str(self.name)
        for sn in self.sub_nodes:
            s = s + ' '+sn.getstr()
        return s

    def print(self):
        print(self.getstr())

class NonTerminal:
    def __init__(self,type_,name,const_list,rule_list) -> None: #type_,string,name,string;rule_list,list[Rule],加一个常量集合？const_list,list[str,int]
        self.type_ = type_
        self.name = name
        self.const_list = const_list
        self.rule_list = rule_list
    
    def print(self):
        print(self.name)
        print(self.type_)
        print(self.const_list)
        for r in self.rule_list:#TODO
            print(r.name)
            print(r.param_list)

    def copy(self,name):
        pass

class Rule:
    def __init__(self,opname,param_list) -> None: #param_list,list[Nonterminal]
        self.name = opname
        self.param_list = param_list

class Grammar:
    def __init__(self,start,symbol_list,funcs) -> None: #start,Nonterminal;symbol_list,dict[str,Nonterminal];funcs,dict[str,Program]
        self.start = start
        self.symbol_list = symbol_list
        self.funcs = funcs
    
    def print(self):
        for key,value in self.symbol_list.items():
            value.print()
        for key,value in self.funcs.items():
            value.printprog()


Constlabel = ['String','Int',"Bool"]

def getfunnode(fun):
    if type(fun) == type([]) and fun[0] not in Constlabel:
        name = fun[0]
        sub_nodes = []
        for sn in fun[1:]:
            node = getfunnode(sn)
            sub_nodes.append(node)
        return ProgNode(name,sub_nodes)
    else:
        if type(fun) == type([]):
            name = fun[1]
            sub_nodes = []
            return ProgNode(name,sub_nodes)
        else:
            name = fun
            sub_nodes = []
            return ProgNode(name,sub_nodes)

def parsefunfromlist(a):#TODO
    if a[0] == 'define-fun':
        progname = a[1]
        type_ = a[3]
        param_list = a[2]#需要修改成每个都生成一个Nonterminal fun，就是一个叫做X的ntstring；可能不需要？match之后自然会把X替换成ntstring
        opname = a[4][0]
        sub_node = getfunnode(a[4])
        return Program(type_,progname,param_list,opname,sub_node)

def parsetermfromlist(b): 
    name = b[0]#可能有限制深度
    type_ = b[1]
    const_list = []
    rule_list = []
    for bi in b[2]:#
        if type(bi) != type([]):
            const_list.append(bi)
            continue
        if bi[0] in Constlabel:
            const_list.append(bi[1])
            continue
        opname = bi[0]
        param_list = bi[1:]
        tmprule = Rule(opname,param_list)
        rule_list.append(tmprule)
    nonterm = NonTerminal(type_,name,const_list,rule_list)
    return nonterm    
    
def parsefromdata(data):
    symbol_list = {}
    funcs = {}
    for dt in data:
        if dt[0] == 'set-logic':
            pass
        elif dt[0] == 'extension':#限制深度
            pass
        elif dt[0] == 'define-fun':
            func = parsefunfromlist(dt)
            funcs[func.progname] = func
        elif dt[0] == 'synth-fun':
            for nontermlist in dt[4]:
                nonterm = parsetermfromlist(nontermlist)
                symbol_list[nonterm.name] = nonterm
        elif dt[0] == 'constraint':
            pass
        else:
            pass
    start = symbol_list['Start']
    return Grammar(start,symbol_list,funcs)


aim = 'str.++(str.substr(Param0,0,1),str.substr(Param0,str.indexof(Param0," ",0),str.len(Param0)))'

def getmatchsize(g,aim):
    pass

def getnumundersize(progsize):
    pass


def refinegtolimitdepth(g):
    pass


a = ['define-fun', 'getprefix', [['X', 'String'], ['Y', 'Int']], 'String', ['str.substr', 'X', ['Int', 0], 'Y']]
aa = ['define-fun', 'doublerp', [['X', 'String'], ['Y', 'String'], ['Z', 'String'], ['P', 'String'], ['Q', 'String']], 'String', ['str.replace', ['str.replace', 'X', 'Y', 'Z'], 'P', 'Q']]
#test = parsefunfromlist(aa)


b = ['ntString', 'String', ['_arg_0', ['String', ''], ['String', ' '], ['String', '/n'], ['getprefix', 'ntString', 'ntInt'], ['doublerp', 'ntString', 'ntString', 'ntString', 'ntString', 'ntString'], ['str.replace', 'ntString', 'ntString', 'ntString'], ['str.at', 'ntString', 'ntInt'], ['ite', 'ntBool', 'ntString', 'ntString'], ['str.++', 'ntString', 'ntString'], ['str.substr', 'ntString', 'ntInt', 'ntInt'], ['int.to.str', 'ntInt']]]

#ib = parsetermfromlist(b)

with open('/home/citceae/DSL/lxy/basetest2.json','r') as f:
    data = json.load(f)

g = parsefromdata(data)
g.print()

#test.printprog()

'''
define-fun怎么表达
program怎么表达
str.++(str.substr(Param0,0,1),str.substr(Param0,str.indexof(Param0," ",0),str.len(Param0)))
规则准备好，过一遍上述字符串 贪心匹配
'''




