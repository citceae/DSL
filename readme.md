原istool下命令：
citceae@citceaeZen:~/istool/build$ 
./run /home/citceae/istool/build/tmp/tests/final.sl /home/citceae/istool/build/tmp/outs/basicvsa/final.out basicvsa

更行后的istool-main下命令：
citceae@citceaeZen:~/ISTool-main/build/executor$ 
./run_sygus /home/citceae/ISTool-main/build/tmp/tests/x.sl /home/citceae/ISTool-main/build/tmp/outs/basicvsa/x.out vsa/obe

./run_sygus /home/citceae/DSL/benchmark/eusolver/mpg_guard2_test_mo.sl /home/citceae/DSL/benchmark/obe/mpg_guard2_test_mo.out obe

路径需要修改

op1:修改为根据非终结符数量去重

原有的展开方式为对每个产生式的每个非终结符依次展开 会导致冗余
修改为对每一个展开式的第一个非终结符展开 维护一个队列 控制展开次数

repaet:设置目标展开后size(未去重） 只展开第一个非终结符 以s->x为标志控制展开次数

try1：改成非终结符形式
try2：减少展开次数观察更少的展开对于obe的表现的影响（指细节枚举过程）

枚举次数影响到排序的副作用可以通过简单的重排列解决
有点好奇更高层的展开的结果能否用基础的几个元件完成 似乎显然不行
目前的接口仅仅是函数 如果函数能够与eusolver之类的要求有ite的兼容那应该没问题 否则 编码方式应该如何

