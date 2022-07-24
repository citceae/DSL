

tab1 ="    "
opdict = {}
syhthfunc = ["synth-fun f ((_arg_0 String) (_arg_1 String) (_arg_2 String)) String "]
stringconst = ["_arg_0 _arg_1 _arg_2 \"\" \" \" \"/n\""] #不同DSL的特化参数
intconst = ["1 0 -1"]
constrains = [f"(constraint (= (f \"Traci Brown\" \"1301 Robinson Court\" \"Saginaw, MI 48607\") \"Traci Brown/n1301 Robinson Court/nSaginaw, MI 48607\"))\n\
(constraint (= (f \"Mary Hannan\" \"1195 Amethyst Drive\" \"Lansing, MI 48933\") \"Mary Hannan/n1195 Amethyst Drive/nLansing, MI 48933\"))\n\
(constraint (= (f \"Linda Thomas\" \"2479 North Bend Road\" \"Allen, KY 41601\") \"Linda Thomas/n2479 North Bend Road/nAllen, KY 41601\"))"]

tasks = []

class Tasks:

    def __init__(self,terminaltype, syhthfunc, stringconst, intconst,constrains) -> None:
        self.terminaltype = terminaltype
        self.syhthfunc = syhthfunc
        self.stringconst = stringconst
        self.intconst = intconst
        self.constrains = constrains

def initial2():

    terminaltype = "String"   
    #TODO 

class operator:

    def __init__(self,name):
        self.name = name
        assert(self.name == "compose" or self.name == "delete")

    def aimdelete(self,termname,deletename):
        assert(self.name=="delete")
        self.termname = termname
        self.deletename = deletename
    
    #termname:所属的term，funcname：compose之后的函数名称，funcusedtype:函数参数类型，funcall：函数整体表达式
    def aimcompose(self,termname,funcname,funcusedtype,funcall):
        assert(self.name == "compose")
        self.termname = termname
        self.funcname = funcname
        self.funcusedtype = funcusedtype
        self.funcall = funcall

class Nonterm:

    def __init__(self, name):
        self.name = name
        if self.name == "Start":
            #self.term = ["ntString"]
            self.term = []
            self.termmap = {}
        if self.name == "ntString":
            self.term = ["str.++","str.replace","str.at","int.to.str","ite","str.substr"]
            self.termmap = {"str.++":" ntString ntString","str.replace":" ntString ntString ntString","str.at":" ntString ntInt","int.to.str":" ntInt","ite":" ntBool ntString ntString","str.substr":" ntString ntInt ntInt"}
        if self.name == "ntInt":
            self.term = ["+","-","str.len","str.to.int","ite","str.indexof"]
            self.termmap = {"+":" ntInt ntInt","-":" ntInt ntInt","str.len":" ntString","str.to.int":" ntString","ite":" ntBool ntInt ntInt","str.indexof":" ntString ntString ntInt"}
        if self.name == "ntBool":
            self.term = ["true","false","=","str.prefixof","str.suffixof","str.contains"]
            self.termmap = {"=":" ntInt ntInt","str.prefixof":" ntString ntString","str.suffixof":" ntString ntString","str.contains":" ntString ntString"}
  

    def addcompose(self,termname,termtype):
        self.term.append(termname)
        self.termmap[termname] = termtype

    def todelete(self,todeterm):

        self.term.remove(todeterm)


    def printNT(self,num):
        if self.name == "ntString":
            oup = tab1 + stringconst[num]
            print(oup)
        if self.name == "ntInt":
            oup = tab1 + intconst[num]
            print(oup)
        for term in self.term:
            if term in self.termmap:
                oup = tab1 + "("+term+self.termmap[term]+")"
                print(oup)
            else:
                oup =tab1 + term 
                print(oup)
            


class DSL:

    def __init__(self):
        self.nontermmap = {"Start":"","ntString":" String","ntInt":" Int","ntBool":" Bool"}
        self.newfunc = ""
        self.start = Nonterm("Start")
        self.ntString = Nonterm("ntString")
        self.ntInt = Nonterm("ntInt")
        self.ntBool = Nonterm("ntBool")
        #self.nonterm = [self.start,self.ntString,self.ntInt,self.ntBool]
        self.nonterm = {"Start":self.start,"ntString":self.ntString,"ntInt":self.ntInt,"ntBool":self.ntBool}
        self.composed = []

    def dsldealtask(self,num):
        #TODO
        pass


    def printDSL(self,num):
        print("(set-logic SLIA)")
        for definedfunc in self.composed:
            oup = "(" + definedfunc + ")"
            print(oup)
        oup = "(" + syhthfunc[num]
        print(oup)

        print("(")
        for key in self.nonterm:
            oup = " ("+ key + self.nontermmap[key] + "("
            print(oup)
            self.nonterm[key].printNT(num)
            print("))")
        print(")")
        print(")")
        print(constrains[num])
        print("(check-synth)")
        print("\n")
    
    def dslcompose(self,op:operator):
        assert(op.name == "compose")
        self.composed.append(op.funcall)
        assert(op.termname in self.nonterm)
        self.nonterm[op.termname].addcompose(op.funcname,op.funcusedtype)

    def dsldelete(self,op:operator):
        assert(op.name == "delete")
        assert(op.termname in self.nonterm)
        self.nonterm[op.termname].todelete(op.deletename)
        
    def dsldeal(self,op:operator):
        assert(op.name == "delete" or op.name == "compose")
        if (op.name == "delete"):
            self.dsldelete(op)
        elif(op.name == "compose"):
            self.dslcompose(op)
        else:
            assert(False)


todelete = ["str.++","str.replace","str.at","int.to.str","ite","str.substr","+","-","str.len","str.to.int","ite","str.indexof","true","false","=","str.prefixof","str.suffixof","str.contains"]
nontermtod = ["ntString","ntString","ntString","ntString","ntString","ntString","ntInt","ntInt","ntInt","ntInt","ntInt","ntInt","ntBool","ntBool","ntBool","ntBool","ntBool","ntBool"]

def initial():
    k = len(todelete)
    for i in range(k):
        op = operator("delete")
        op.aimdelete(nontermtod[i],todelete[i])
        opdict[i+1] = op
    op = operator("compose")
    op.aimcompose("ntString","doublestr"," ntString ntString ntString","define-fun doublestr ((x String) (s String) (t String)) String (str.++ (str.++ x s) t)")
    k = k + 1
    opdict[k] = op 
    op = operator("compose")
    op.aimcompose("ntString","tristr"," ntString ntString ntString ntString","define-fun tristr ((x String) (s String) (t String) (q String)) String (str.++ (str.++ (str.++ x s) t) q)")
    k = k + 1
    opdict[k] = op
    op = operator("compose")
    op.aimcompose("ntString","pstr"," ntString ntString ntString ntString ntString","define-fun pstr ((x String) (s String) (t String) (q String) (l String)) String (str.replace (str.replace x s t) q l)")
    k = k + 1
    opdict[k] = op
    op = operator("compose")
    op.aimcompose("ntString","xstr"," ntString ntString ntString ntString","define-fun xstr ((x String) (s String) (t String) (q String)) String (str.++ (str.replace x s t) q)")
    k = k + 1
    opdict[k] = op

    for key in opdict:
        #print(opdict[key].name)
        break
        
