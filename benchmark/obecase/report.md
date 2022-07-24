数据记录：
无前缀后缀功能，常数设定最大为2时，sub:21s；sub1:66s
常数设定最大为4时，sub：5.6s；sub1：272s..
272s:奇怪的搜索过程
Candidate result {f:Param0}
I0329 21:42:47.666224  4565 solver.cpp:33] Counter example ["John","Doe","hnDo"]
I0329 21:42:48.214874  4565 solver.cpp:25] Candidate result {f:str.++(str.substr(Param0,2,4),str.substr(Param1,0,2))}
I0329 21:42:48.214905  4565 solver.cpp:33] Counter example ["Mayur","Naik","urNa"]
I0329 21:44:14.251448  4565 solver.cpp:25] Candidate result {f:str.++(str.substr(Param0,+(-1,str.len(Param1)),4),str.substr(Param1,0,2))}
I0329 21:44:14.251492  4565 solver.cpp:33] Counter example ["Nimit","Singh","itSi"]
I0329 21:47:20.642913  4565 solver.cpp:25] Candidate result {f:str.++(str.substr(Param0,-(str.len(Param0),2),4),str.substr(Param1,0,2))}

加入前缀后缀后：
前缀后缀放在展开式开头(移动到产生式结尾没有明显影响，广度优先的缘故？)
常数最大为4,sub：0.3214s；sub1：0.09s 量级上有明显提升（前后缀功能加入也有提升）
sub：
Candidate result {f:Param0}
I0329 22:07:23.045574  6017 solver.cpp:33] Counter example ["John","Doe","hnDo"]
I0329 22:07:23.071915  6017 solver.cpp:25] Candidate result {f:str.substr(str.++(Param0,Param1),2,4)}
I0329 22:07:23.071938  6017 solver.cpp:33] Counter example ["Mayur","Naik","urNa"]
I0329 22:07:23.366873  6017 solver.cpp:25] Candidate result {f:str.++(str.suf(Param0,2),str.pre(Param1,2))}
sub1：
Candidate result {f:Param0}
I0329 22:08:54.988968  6172 solver.cpp:33] Counter example ["John","Doe","hnDo"]
I0329 22:08:55.080229  6172 solver.cpp:25] Candidate result {f:str.++(str.suf(Param0,2),str.pre(Param1,2))}

常数设定为2：
sub由于不能直接取序列长度为4，提升到0.5s；sub1也为0.5s。

常数设定为1：需要+ 1 1的产生。sub：5.5s；sub1：6.2s
sub：
Candidate result {f:Param0}
I0329 22:19:25.508232  6922 solver.cpp:33] Counter example ["John","Doe","hnDo"]
I0329 22:19:25.802918  6922 solver.cpp:25] Candidate result {f:str.substr(str.++(Param0,Param1),+(1,1),str.len(Param0))}
I0329 22:19:25.802942  6922 solver.cpp:33] Counter example ["Mayur","Naik","urNa"]
I0329 22:19:31.034658  6922 solver.cpp:25] Candidate result {f:str.++(str.suf(Param0,+(1,1)),str.pre(Param1,+(1,1)))}
sub1：
Candidate result {f:Param0}
I0329 22:19:41.864881  6940 solver.cpp:33] Counter example ["John","Doe","hnDo"]
I0329 22:19:42.733276  6940 solver.cpp:25] Candidate result {f:str.pre(str.++(str.suf(Param0,+(1,1)),Param1),str.len(Param0))}
I0329 22:19:42.733309  6940 solver.cpp:33] Counter example ["Mayur","Naik","urNa"]
I0329 22:19:48.061864  6940 solver.cpp:25] Candidate result {f:str.++(str.suf(Param0,+(1,1)),str.pre(Param1,+(1,1)))}


交换律：目标为产生常数5 9 13等
com：0.09s；com1：0.14s 修改了多次常数没有观察到com1优于com的结果
comdel类似
comdel本身为0.0006
ntInty的产生式里只保留常数，从0.0013提升回0.00077