考察了clia数据集中可以用交换律的所有出现。
1. + (para/constant ite/+/-)
即限制+的左展开式必然为输入参数或常数，ite永远可以提到最外层，其余的+-由交换律本身保证正确性，因此这一操作不会降低表达能力。具体的修改见mpg例子。
实验结果：
初始mpg_guard1:31.3355740000 修改后mpg_guard1_mo:27.6883510000
初始mpg_guard2:54.3514180000 修改后mpg_guard2_mo:46.9738810000
初始mpg_plane2:1.6144230000  修改后mpg_plane2_mo:1.4290710000
都提升了10%以上的求解速度。

初始与修改后的求解序列没有区别，如mpg_guard1修改前后均为：
I0406 13:28:13.523890 42121 solver.cpp:25] Candidate result {eq1:Param0}
I0406 13:28:13.535332 42121 solver.cpp:33] Counter example [0,-1,0]
I0406 13:28:13.535382 42121 solver.cpp:25] Candidate result {eq1:1}
I0406 13:28:13.545214 42121 solver.cpp:33] Counter example [1,-1,0]
I0406 13:28:13.545334 42121 solver.cpp:25] Candidate result {eq1:+(Param0,1)}
I0406 13:28:13.555253 42121 solver.cpp:33] Counter example [-1,0,0]
I0406 13:28:13.555451 42121 solver.cpp:25] Candidate result {eq1:-(Param0,Param1)}
I0406 13:28:13.564854 42121 solver.cpp:33] Counter example [0,1,0]
I0406 13:28:13.595134 42121 solver.cpp:25] Candidate result {eq1:+(Param0,ite(<(Param0,Param1),Param1,1))}
I0406 13:28:13.605444 42121 solver.cpp:33] Counter example [-2,-1,0]
I0406 13:28:13.647186 42121 solver.cpp:25] Candidate result {eq1:+(Param0,ite(<(Param1,Param2),1,Param1))}
I0406 13:28:13.657305 42121 solver.cpp:33] Counter example [-2,2,2]
I0406 13:28:13.822968 42121 solver.cpp:25] Candidate result {eq1:ite(<(Param2,Param1),Param1,-(Param0,Param1))}
I0406 13:28:13.833353 42121 solver.cpp:33] Counter example [2,-1,-1]
I0406 13:28:15.375262 42121 solver.cpp:25] Candidate result {eq1:ite(<(Param2,+(Param0,Param1)),1,-(Param0,Param1))}
I0406 13:28:15.385628 42121 solver.cpp:33] Counter example [3,1,4]
I0406 13:28:44.851769 42121 solver.cpp:25] Candidate result {eq1:+(Param0,ite(<(0,+(Param0,Param1)),Param1,-(0,Param1)))}

2.+ (para1 para2) 见mps.sl mts.sl(当然有更多例子)可能针对一些特殊命名的参数可以做划分？如lran rran

3.AND/OR的交换律 见qm___.sl

4.+ (constant1 constant2) 由于clia中几乎所有测试都是只给了0 1两个常数生成一些大的常数（或者仅仅处理0 1） 之前类似于将1 2 3 4分割成大加小的方法失效。
修改初始的常数后可能可以有效。（见LinExpr_inv1_ex.sl中的常数3 应用了1的修改后也提升了效率）

minor:数据集里的s2.sl s3.sl有bug
-----------------------------------------------------------------------
mps.sl求解序列：
I0411 22:23:52.127408  6317 solver.cpp:25] Candidate result {combine:Param0}
I0411 22:23:52.138335  6317 solver.cpp:33] Counter example [-1,0,0,0]
I0411 22:23:52.138376  6317 solver.cpp:25] Candidate result {combine:Param1}
I0411 22:23:52.147486  6317 solver.cpp:33] Counter example [0,1,-1,0]
I0411 22:23:52.147528  6317 solver.cpp:25] Candidate result {combine:Param3}
I0411 22:23:52.156365  6317 solver.cpp:33] Counter example [0,0,0,1]
I0411 22:23:52.156410  6317 solver.cpp:25] Candidate result {combine:0}
I0411 22:23:52.166260  6317 solver.cpp:33] Counter example [1,0,-1,0]
I0411 22:23:52.171540  6317 solver.cpp:25] Candidate result {combine:-(0,+(Param1,Param2))}
I0411 22:23:52.181172  6317 solver.cpp:33] Counter example [-1,-1,0,0]
I0411 22:23:52.232635  6317 solver.cpp:25] Candidate result {combine:ite(<(Param0,Param1),Param3,Param0)}
I0411 22:23:52.241967  6317 solver.cpp:33] Counter example [0,1,-1,1]
I0411 22:23:52.305105  6317 solver.cpp:25] Candidate result {combine:ite(<(Param0,Param1),0,Param0)}
I0411 22:23:52.315086  6317 solver.cpp:33] Counter example [0,1,0,0]
I0411 22:23:52.389657  6317 solver.cpp:25] Candidate result {combine:ite(<(Param2,Param0),Param0,Param1)}
I0411 22:23:52.399644  6317 solver.cpp:33] Counter example [0,0,1,0]
I0411 22:23:53.064934  6317 solver.cpp:25] Candidate result {combine:+(Param1,ite(<(Param0,1),Param2,Param0))}
I0411 22:23:53.074872  6317 solver.cpp:33] Counter example [1,2,0,0]
I0411 22:23:53.894587  6317 solver.cpp:25] Candidate result {combine:+(Param1,ite(<(Param1,Param0),Param0,Param2))}
I0411 22:23:53.904476  6317 solver.cpp:33] Counter example [3,2,2,0]
I0411 22:23:54.887953  6317 solver.cpp:25] Candidate result {combine:ite(<(Param2,Param3),Param0,+(Param1,Param2))}
I0411 22:23:54.897873  6317 solver.cpp:33] Counter example [0,0,-1,-1]
I0411 22:23:56.069121  6317 solver.cpp:25] Candidate result {combine:ite(<(Param2,0),Param0,+(Param1,Param2))}
I0411 22:23:56.079174  6317 solver.cpp:33] Counter example [0,-1,0,0]
I0411 22:24:12.368309  6317 solver.cpp:25] Candidate result {combine:+(Param0,ite(<(Param0,+(Param1,Param2)),1,0))}
I0411 22:24:12.379739  6317 solver.cpp:33] Counter example [0,2,0,0]
I0411 22:24:31.672602  6317 solver.cpp:25] Candidate result {combine:ite(<(Param1,-(Param0,Param2)),Param0,+(Param1,Param2))}
13 {combine:ite(<(Param1,-(Param0,Param2)),Param0,+(Param1,Param2))}

mps_mo.sl求解序列：
I0411 22:27:34.169834  6476 solver.cpp:25] Candidate result {combine:Param0}
I0411 22:27:34.180963  6476 solver.cpp:33] Counter example [-1,0,0,0]
I0411 22:27:34.181015  6476 solver.cpp:25] Candidate result {combine:Param1}
I0411 22:27:34.190326  6476 solver.cpp:33] Counter example [0,1,-1,0]
I0411 22:27:34.190377  6476 solver.cpp:25] Candidate result {combine:Param3}
I0411 22:27:34.199292  6476 solver.cpp:33] Counter example [0,0,0,1]
I0411 22:27:34.199340  6476 solver.cpp:25] Candidate result {combine:0}
I0411 22:27:34.208482  6476 solver.cpp:33] Counter example [1,0,-1,0]
I0411 22:27:34.213949  6476 solver.cpp:25] Candidate result {combine:-(-(0,Param1),Param2)}
I0411 22:27:34.224051  6476 solver.cpp:33] Counter example [-1,-1,0,0]
I0411 22:27:34.254920  6476 solver.cpp:25] Candidate result {combine:ite(<(Param0,Param1),Param3,Param0)}
I0411 22:27:34.264577  6476 solver.cpp:33] Counter example [0,1,-1,1]
I0411 22:27:34.302923  6476 solver.cpp:25] Candidate result {combine:ite(<(Param0,Param1),0,Param0)}
I0411 22:27:34.313205  6476 solver.cpp:33] Counter example [1,2,-1,0]
I0411 22:27:34.360379  6476 solver.cpp:25] Candidate result {combine:ite(<(Param0,Param2),Param1,Param0)}
I0411 22:27:34.370684  6476 solver.cpp:33] Counter example [0,0,1,0]
I0411 22:27:34.847487  6476 solver.cpp:25] Candidate result {combine:ite(<(-(Param0,Param1),Param2),Param2,Param0)}
I0411 22:27:34.858357  6476 solver.cpp:33] Counter example [0,-1,2,0]
I0411 22:27:37.622265  6476 solver.cpp:25] Candidate result {combine:ite(<(Param1,Param0),1,+(Param1,Param2))}
I0411 22:27:37.634018  6476 solver.cpp:33] Counter example [0,-1,1,0]
I0411 22:27:40.691910  6476 solver.cpp:25] Candidate result {combine:ite(<(Param2,Param0),Param0,+(Param1,Param2))}
I0411 22:27:40.703716  6476 solver.cpp:33] Counter example [-1,2,-2,0]
I0411 22:27:44.720803  6476 solver.cpp:25] Candidate result {combine:ite(<(Param3,Param0),Param0,+(Param1,Param2))}
I0411 22:27:44.731972  6476 solver.cpp:33] Counter example [0,1,0,-1]
I0411 22:27:50.120672  6476 solver.cpp:25] Candidate result {combine:ite(<(Param3,Param0),1,+(Param1,Param2))}
I0411 22:27:50.130992  6476 solver.cpp:33] Counter example [0,0,0,-1]
I0411 22:27:56.344303  6476 solver.cpp:25] Candidate result {combine:ite(<(0,Param0),Param0,+(Param1,Param2))}
I0411 22:27:56.354692  6476 solver.cpp:33] Counter example [1,2,0,0]
I0411 22:29:34.459256  6476 solver.cpp:25] Candidate result {combine:ite(<(Param1,-(Param0,Param2)),Param0,+(Param1,Param2))}
14 {combine:ite(<(Param1,-(Param0,Param2)),Param0,+(Param1,Param2))}

