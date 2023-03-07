
'''
输入：初始文法 (展开规则)
输出：经过迭代后在一定限制下得到的最优文法

子问题：
1.给定一个文法，如何挑选下一步要展开的产生式。当前规模为length时，共有length种挑选可能，根据某种规则挑选展开式，先后顺序可能影响效率
    按顺序选择展开目标 优先长度短的（类似一种均匀展开）
2.给定文法，选中的要展开的产生式和展开规则，如何展开？
    如+ S S 还需要考虑展开哪一个S 或者应用一次全展开？ 否则就是选择一个非终结符展开一次（展开k次等价于对展开一次的结果全都在1中选中再展开
3.为了最优化 判定是否需要应用本次展开？
    收集少量数据集 直接检查本次展开之后相比展开之前的效果 效果好或者在误差范围内可以接受
    设计估价函数 直接估计本次展开的收益大小 从而利用采样点快速回答前面的1和2 参考直接判断本次展开得到的等价式消减数量 （但是判断等价式的代价好像也不低）
    （贝叶斯搜索目标就是有这样的建模 问题在于每次空间不一样？扩展问题空间直接到多层以后？ 理论上空间确实是确定的 找到一种刻画方式即可）

20221009:
根据单个基因表达DSL；merge两个DSL；根据多个基因组成的染色体表达DSL；

20221010:
个体的变异 遗传算法基本流程 
gap：需要优化去重算法的效率 遗传算法的各项参数 评估函数

MAXGENELEN = 5#单个基因最大长度，即路径深度
GENESMINLENGTH = 2#染色体最小包含2个基因，否则交叉不好做

POPULATION = 20#种群大小
INITGENESMIN = 2#初始染色体最少基因数目
INITGENESMAX = 8
RUNS = 30
上述参数跑了三四个小时出不来结果

TODO:
1.全面修改输出format 淘汰函数形式 改用加了检查重复项的非终结符形式 好像写完了
2.去重优化 树状or有损 有损先跑一下！ 好像还是得试试树状去重...
3.遗传算法 tree-based的数据

记录：
eusolver:
注意！！！这里的结果都包含一个非正常改动 不小心把xyz01顺序改成了01xyz 且后续展开顺序也为01xyz 是想要方便字母序...
但是把mpg_guard2源文件修改成01xyz并没有什么效果... xyz01:56s 01xyz:105s 【如果没有必须xyz输入参数在常量前面的要求】 在01xyz的框架下有找到非常简单的效果很好的DSL 
单个基因[0，0.3]在mpg_guard2,eusolver上效果起飞 3.43s 修改顺序为xyz01后直接 357s
manual 手动模仿的[[0,0.3],[0,0.6]]效果起飞 3.38s 修改顺序为xyz01后直接 182s
复杂基因反而落后 [[0.21, 0.76, 0.11, 0.18, 0.97], [0.14, 0.45, 0.75, 0.19, 0.2], [0.59, 0.69, 0.1, 0.61], [0.09, 0.88, 0.4, 0.24], [0.18, 0.65], [0.52, 0.48, 0.12]] 143s
random1=[[0.18], [0.2], [0.86], [0.53, 0.4, 0.15]]也落后 143s
random2=[[0.86, 0.7], [0.55, 0.14], [0.75, 0.22, 0.27], [0.88, 0.11]]落后一些 108s

说明reward需要对复杂度有个严重的惩罚？
猜想：个体内基因的长度尽量接近 基因尽量相似但不相同（体现在真实路径上的不相同） 如复制一次基因并修改最后一位
一个观察：+ S S被展开之后, + 0 （+ S S）因为没有+S S没有被消掉 可以通过预定义的规则消去

将错就错都在01xyz的顺序上进行
obe:
mpg_guard2原始文件：218s    （xyz01:63s）
test0 [0,0.3]:85s
manual [[0,0.3],[0,0.6]]:79s
[[0.21, 0.76, 0.11, 0.18, 0.97], [0.14, 0.45, 0.75, 0.19, 0.2], [0.59, 0.69, 0.1, 0.61], [0.09, 0.88, 0.4, 0.24], [0.18, 0.65], [0.52, 0.48, 0.12]] :352s
random1 [[0.18], [0.2], [0.86], [0.53, 0.4, 0.15]]:307
random2[[0.86, 0.7], [0.55, 0.14], [0.75, 0.22, 0.27], [0.88, 0.11]]:330 这个全都是减法的展开没什么用
manual2 [[0,0],[0,0.2],[0,0.3],[0,0.4],[0,0.6]]:264
manual3 [[0,0.3],[0,0.4]]：85.36
manual4 [[0,0.3],[0,0.4],[0,0.6]]：261 buggy.. 
为什么理论上剪枝了反而枚举的变慢了 枚举的信息（包括反例和每次生成的程序）后面三个和原始是一致的;显著改进的都直接改变了枚举的顺序少了两个ce
内部去重的影响 控制产生式的数目？
manual3 和 manual4 可不可以查看更细致的时间差异在哪里

修改了bug之后：
obe：
mpg_guard2原始文件：218s


test:356 这个的表现还是很奇怪 如果都是一些无效展开最后的结果会变差？ 尝试改善枚举顺序后 368s 可能是因为后续的枚举顺序太难保证

manual2:360 参见观察 但是去掉了那一条也是356 【枚举的顺序问题】 尝试调整顺序后明显改善 95s 去掉观察中的那一条后是 99s... 但是目前可能还不是对顺序的完全保留

manual4：82  尝试改善顺序后 239.622 再尝试改善顺序：
'''

import copy as cp
import functools
from newchecker import Rule
from newchecker import Node
from newchecker import DSL
from newchecker import my_compare,checkDSL,newcheckDSL
import random
import math
import sys
import time

MAXGENELEN = 3#单个基因最大长度，即路径深度
MINGENLEN = 2
GENESMINLENGTH = 2#染色体最小包含2个基因，否则交叉不好做

POPULATION = 20#种群大小
INITGENESMIN = 2#初始染色体最少基因数目
INITGENESMAX = 8
RUNS = 30


envirstr1 = "(set-logic LIA)\n\n(synth-fun eq1 ( (x Int) (y Int) (z Int) ) Int\n"
envirstr2 ="(define-fun iteB (( b1 Bool ) (b2 Bool ) (b3 Bool )) Bool ( or ( and b1 b2 ) ( and (not b1 ) b3 ) ) )\n(define-fun plus2 ((b1 Int) (b2 Int)) Int ( + b1 b2))\n(define-fun plus3 ((b1 Int) (b2 Int) (b3 Int)) Int ( +  ( + b1 b2) b3))\n(define-fun plus4 ((b1 Int) (b2 Int) (b3 Int) (b4 Int)) Int ( +  ( plus3  b1 b2 b3) b4))\n(define-fun plus5 ((b1 Int) (b2 Int) (b3 Int) (b4 Int) (b5 Int)) Int (+  ( plus4 b1 b2 b3 b4) b5))\n(define-fun plus6 ((b1 Int) (b2 Int) (b3 Int) (b4 Int) (b5 Int) (b6 Int) ) Int (+  ( plus5 b1 b2 b3 b4  b5) b6  ))\n(define-fun plus7 ((b1 Int) (b2 Int) (b3 Int) (b4 Int) (b5 Int) (b6 Int) (b7 Int)) Int (+  ( plus6 b1 b2 b3 b4  b5 b6 ) b7  ))\n(define-fun plus8 ((b1 Int) (b2 Int) (b3 Int) (b4 Int) (b5 Int) (b6 Int) (b7 Int) (be Int)) Int (+  ( plus7 b1 b2 b3 b4  b5 b6 b7) be  ))\n(define-fun plus9 ((b1 Int) (b2 Int) (b3 Int) (b4 Int) (b5 Int) (b6 Int) (b7 Int) (be Int) (bn Int)) Int (+  ( plus8 b1 b2 b3 b4  b5 b6 b7 be) bn  ))\n\n(define-fun or3 ((b1 Bool) (b2 Bool) (b3 Bool)) Bool ( or ( or b1 b2) b3))\n(define-fun one-times  ((b1 Int )) Int b1)\n(define-fun two-times  ((b1 Int )) Int ( plus2 b1 b1))\n(define-fun three-times  ((b1 Int )) Int ( plus3 b1 b1 b1))\n(define-fun five-times  ((b1 Int )) Int ( plus5 b1 b1 b1 b1 b1 ))\n(define-fun seven-times ((b1 Int )) Int ( plus7 b1 b1 b1 b1 b1 b1 b1 ))\n(define-fun nine-times  ((b1 Int )) Int ( plus9 b1 b1 b1 b1 b1 b1 b1 b1 b1))\n(define-fun ten-times  ((b1 Int )) Int ( plus9 b1 b1 b1 b1 b1 b1 b1 b1 ( plus2 b1 b1 )))\n(define-fun minus ((b1 Int)) Int ( - 0  b1 ))\n\n(declare-var x Int ) \n(declare-var y Int ) \n(declare-var z Int ) \n\n\n\n( constraint ( iteB ( >= (plus3 x y z ) 1 ) \n                    ( = ( eq1 x y z) ( plus2 x  y    ) )\n		    ( = ( eq1 x y z) ( plus2 x  (minus y)   ) )\n             )\n)      \n\n\n(check-synth)"

nonterm = ["S","B"] 
term = ['x','y','0','1','-1','2','-2']
rule =[] 
rule1 = Rule("S",Node([],'x'))
rule2 = Rule("S",Node([],'y'))
#rule3 = Rule("S",Node([],'z'))
rule4 = Rule("S",Node([],'0'))
rule5 = Rule("S",Node([],'1'))
rule51 = Rule("S",Node([],'-1'))
rule52 = Rule("S",Node([],'2'))
rule53 = Rule("S",Node([],'-2'))
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
#rule.append(rule3)
rule.append(rule4)
rule.append(rule5)
rule.append(rule51)
rule.append(rule52)
rule.append(rule53)
rule.append(rule6)
rule.append(rule7)
rule.append(rule8)
rule.append(rule9)
rule.append(rule10)
rule.append(rule11)
rule.append(rule12)
rule.append(rule13)
rule.append(rule14)



dsl0 = DSL(nonterm,term,cp.deepcopy(rule),"S")

def CheckSameDSL(dsl0:DSL,dsl1:DSL):
    for key in dsl0.DSLsign:
        if key not in dsl1.DSLsign:
            return False
    for key in dsl1.DSLsign:
        if key not in dsl0.DSLsign:
            return False
    return True

def addagene(genes,mk = MINGENLEN, K = MAXGENELEN):
    newgene = []
    genelen = random.randint(mk,K)
    for i in range(genelen):
        newgene.append(round(random.random(),2))
    genes.append(newgene)

def reduceagene(genes,mink = GENESMINLENGTH):
    k = len(genes)
    assert(k>=mink)
    if k == mink:
        return 
    idx = random.randint(0,k-1)
    genes.pop(idx)

def refineagene(genes):#可以改变任意个基因 的任意位置
    k = len(genes)
    idx = random.randint(0,k-1)
    genes[idx][-1] = round(random.random(),2)

def addingene(genes,K = MAXGENELEN):
    k = len(genes)
    idx = random.randint(0,k-1)
    if len(genes[idx]) == K:
        return 
    genes[idx].append(round(random.random(),2))

def redingene(genes,mink = GENESMINLENGTH):
    k = len(genes)
    idx = random.randint(0,k-1)
    if len(genes[idx])<=1:
        if k>mink:
            genes.pop(idx)
    else:
        genes[idx].pop(-1)

def variation(genes):#子代的变异种类
    target = random.randint(1,6) #可以修改为（1，6）
    if target == 1:
        addagene(genes)
    if target == 2:
        reduceagene(genes)
    if target == 3:
        refineagene(genes)
    if target == 4:
        addingene(genes)
    if target == 5:
        redingene(genes)
    if target == 6:
        pass

def cross(genes1,genes2):#还要接着用的
    g1 = genes1.copy()
    g2 = genes2.copy()
    if g1 == g2:#如果选中了同一个个体型
        return g1
    k1 = len(g1)
    k2 = len(g2)
    assert(k1>=2)
    assert(k2>=2)
    newg1 = []
    for i in range(int(k1/2)):
        newg1.append(g1.pop(random.randint(0,len(g1)-1)))
    for i in range(math.ceil(k2/2)):
        newg1.append(g2.pop(random.randint(0,len(g2)-1)))
    assert(len(g1)<k1)
    assert(len(g2)<k2)
    newg2 = g1 + g2
    if random.random()>=0.5:
        return newg1
    else:
        return newg2

#如果选中同一个个体自交 得到的基因长度会变短 即不稳定?是不是应该设置成稳定的 先改成稳定的
def crosspopu(p, points,k=POPULATION):#内含变异
    newp = []
    for i in range(k):
        father = random.choices(p,points)
        #print(father)
        mother = random.choices(p,points)
        #print(mother)
        sonordaughter = cross(father[0],mother[0])
        #tmp = sonordaughter.copy()
        variation(sonordaughter)
        #assert(tmp != sonordaughter)
        newp.append(sonordaughter)
    return newp

def evaluation(genes,C = 100):
    dsl = ExtendByGeneS(genes)
    dsl_,proved_cnt = checkDSL(dsl)
    dsllength = len(dsl_.DSLsign)
    return proved_cnt - dsllength/(dsllength + C)

def newevaluation(genes,C = 100):
    dsl = ExtendByGeneS(genes)
    dsl_,proved_cnt = newcheckDSL(dsl)
    dsllength = len(dsl_.DSLsign)
    return dsl_,proved_cnt - dsllength/(dsllength + C)

def evalpopu(p):
    points = []
    for genes in p:
        points.append(evaluation(genes))
    #sum_points = sum(points) 
    #for i in range(len(points)):
    #    points[i] = points[i]/sum_points
    return points 

def mergeDSL(dsl0:DSL, dsl1:DSL):
    #前三个要素应当相同
    nonterm = dsl0.nonterm
    term = dsl0.term
    startterm = dsl0.startterm
    newrule = []
    tmpdict = {}

    for key,value in dsl0.DSLsign.items():
        tmpdict[key] = value.copy()
    for key,value in dsl1.DSLsign.items():
        tmpdict[key] = value.copy()
    #for ex in dsl0.extendedrule:
    #    if ex in tmpdict:
    #        tmpdict.pop(ex)
    #for ex in dsl1.extendedrule:
    #    if ex in tmpdict:
    #        tmpdict.pop(ex)
    tmpsorted = sorted(tmpdict,key=functools.cmp_to_key(my_compare))
    for key in tmpsorted:
        newrule.append(tmpdict[key])
    newdsl = DSL(nonterm,term,newrule,startterm)
    return newdsl


def ExtendByGene(gene,rule = rule):
    dsl = DSL(nonterm,term,cp.deepcopy(rule),"S")
    CandRule = ["S->(+ S S )","S->(- S S )"]
    for g in gene:
        assert(0<=g)
        assert(1>=g)

    for g in gene:
        NextCand = []
        idx = int(len(CandRule)*g)
        if idx == len(CandRule):
            idx = idx-1
        rulesign = CandRule[idx]
        dsl.extendedrule.append(rulesign)

        assert(rulesign in dsl.DSLsign)
        aimrule = dsl.DSLsign[rulesign]
        tmprule = aimrule.copy()
        n = tmprule.getaimNode(0,nonterm)
        assert(n!=None)
        aimnonterm = n.val
        for initrule in rule:
            if aimnonterm == initrule.left:
                n.Nodelist = cp.deepcopy(initrule.right.Nodelist)
                n.val = initrule.right.val
                onenewrule = tmprule.copy()
                newsign = onenewrule.GetRuleSign()
                if "S" in newsign[1:] or "B" in newsign[1:]:
                    NextCand.append(newsign)
                dsl.DSLsign[newsign]=onenewrule
                dsl.rule.append(onenewrule)#应当被去掉
        #n.Nodelist = recordNodelist
        #print(NextCand)
        CandRule = NextCand
    for ex in dsl.extendedrule:
        dsl.DSLsign.pop(ex)
    return dsl

def ExtendByGeneS(genes,rule=rule):
    assert(len(genes)>1)
    dsl = ExtendByGene(genes[0])
    allextended = dsl.extendedrule
    for gene in genes[1:]:
        nextdsl = ExtendByGene(gene)
        allextended = allextended + nextdsl.extendedrule
        dsl = mergeDSL(dsl,nextdsl)
    for ex in allextended:
        if ex in dsl.DSLsign:
            dsl.DSLsign.pop(ex)
    return dsl

def randomgenes(ming = INITGENESMIN, maxg = INITGENESMAX):
    individal = []
    geneslen = random.randint(ming,maxg)
    for j in range(geneslen):
        addagene(individal)
    return individal

    
def init_population(k = POPULATION,ming = INITGENESMIN, maxg = INITGENESMAX):
    p = []
    for i in range(k):
        individal = []
        geneslen = random.randint(ming,maxg)
        for j in range(geneslen):
            addagene(individal)
        p.append(individal)
    return p


def run(runs = RUNS):
    p = init_population()
    for genes in p:
        assert(len(genes)>=2)
    points = evalpopu(p)
    print("init ")
    idx = points.index(max(points))
    print(p[idx])
    print(points[idx])
    #print(p)
    for r in range(runs):
        p = crosspopu(p,points)
        points = evalpopu(p)
        print("run ",r)
        idx = points.index(max(points))
        print(p[idx])
        print(points[idx])
        print(points)
        #print(p)
    print(p)
    print(points)


genes = [[0,0],[0,0.2],[0,0.3],[0,0.4],[0,0.6]]
print(genes)

# dsl1 = ExtendByGeneS(genes)
# ttt = dsl1.DSLsignsort()
# for t in ttt:
#     print(t)

# ttt = dsl1.DSLsignsortfinal()
# for t in ttt:
#     print(t)

# quit()   

dsl_,point = newevaluation(genes)
# ttt = dsl_.DSLsignsortfinal()
# for t in ttt:
#     print(t)

# quit()
s = dsl_.nontermprint()
f=open('/home/citceae/DSL/benchmark/version5/tests/s3_g5.sl','w')
old=sys.stdout #将当前系统输出储存到临时变量
sys.stdout=f #输出重定向到文件 
print(envirstr1)
print(s)
print(envirstr2)
sys.stdout=old  #还原系统输出
f.close()

# dsl1 = ExtendByGene([0,0.3])
# s = dsl1.nontermprint()
# print(s)

#[[0.88, 0.11], [0.91, 0.09, 0.95, 0.41], [0.52, 0.88, 0.98, 0.69, 0.55], [0.24, 0.27, 0.79], [0.22], [0.39], [0.59, 0.2, 0.49, 0.98]]
#[[0.24, 0.71, 0.4], [0.84, 0.61, 0.22, 0.24], [0.39, 0.8, 0.09, 0.11], [0.67, 0.97], [0.42, 0.75, 0.95]]
#[[0.21, 0.76, 0.11, 0.18, 0.97], [0.14, 0.45, 0.75, 0.19, 0.2], [0.59, 0.69, 0.1, 0.61], [0.09, 0.88, 0.4, 0.24], [0.18, 0.65], [0.52, 0.48, 0.12]] 58个 30s / 49个 22s

# genes = randomgenes()
# print(genes)
# p = time.perf_counter()
# point1 = newevaluation(genes)       
# q = time.perf_counter()
# print(point1)
# print(q-p)

# p = time.perf_counter()
# point2 = evaluation(genes)        
# q = time.perf_counter()
# print(point2)
# print(q-p)
# quit()


# f=open('tobestgene.txt','w')
# old=sys.stdout #将当前系统输出储存到临时变量
# sys.stdout=f #输出重定向到文件 
# run()
# sys.stdout=old  #还原系统输出
# f.close()




'''
s = dsl1.nontermprint()
print(s)
dsl0.dslprint()
print("----------------------")
dsl1 = ExtendByGene([0,0.3])
ttt = dsl1.DSLsignsort()
for t in ttt:
    print(t)
dsl2 = ExtendByGene([0,0.4])
ttt = dsl2.DSLsignsort()
for t in ttt:
    print(t)
print("---------------------------")
dsl3 = mergeDSL(dsl1,dsl2)
ttt = dsl3.DSLsignsort()
for t in ttt:
    print(t)
print("____________________")
dsl4 = ExtendByGeneS([[0,0.3],[0,0.4]])
ttt = dsl4.DSLsignsort()
for t in ttt:
    print(t)
print(CheckSameDSL(dsl3,dsl4))
'''
