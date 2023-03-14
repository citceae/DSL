#对每一个源文件，记录startsymbol类型并计算最大展开深度
#1: depth = 19; start = string;
#5: depth = 20; start = string;
#6: depth = 17; start = string;
#7: depth = 16 string
#8: depth = 15 string
#9: 16 s
#10:15 s
#12:20 s
#13:13 b
#14:10 s
#15:9 i
#17:11 s
#18:25 s
#20:13 s
#23:18 s
#24:8 b
#25:37 s
#27:17 s
#28:12 s
#29:15 s
#30:22 s
#31:21 s
#32:14 s
#33:13 s
#34:19 s
#35:9 s
#36:16 s
#37:11 s
#38:16 s
#内部还需要统计 暂时先这样？
#refine
'''
  str.suffixof:3
  -:9
  str.contains:12
str.to.int:13

str.indexof:12
str.substr:21
+:18
  str.++:37
str.++:18
int.to.str:12
str.len:5
-:17
str.replace:17
  +:9
  =:13
  str.substr:18
  str.replace:21
  str.prefixof:3

------
  str.suffixof:3
  -:9
  str.contains:12
  str.prefixof:3
str.suffixof:0
str.replace:17
str.len:5
int.to.str:12
-:17
str.to.int:13
str.substr:21
ite:0
  +:9
str.prefixof:0
str.contains:0
  str.replace:21
+:18
str.++:18
  str.++:37
str.indexof:12
  =:13
  str.substr:18
str.at:0
以上数据可以进一步使用 或者再加一个
'''
s = [1,5,6,7,8,9,10,12,14,17,18,20,23,25,27,29,30,31,32,33,34,35,36,37,38]
b = [13,24,28]
i = [15]
smax = 37
bmax = 13
imax = 17
s8 = 30
b8 = 10
i8 = 14




