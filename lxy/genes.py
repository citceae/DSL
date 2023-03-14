'''
添加：
ntInt:
(define-fun succ ((X Int) ) Int (+ 1 X )) 0
(define-fun pred ((X Int) ) Int (+ -1 X )) 1
(define-fun firstidx ((X String) (Y String) ) Int (str.indexof X Y 1 )) 2
(define-fun idxplus ((X String) (Y String) (P Int) (Q Int)) Int (+ (str.indexof X Y P) Q)) 3
(define-fun idxminus ((X String) (Y String) (P Int) (Q Int)) Int (- (str.indexof X Y P) Q)) 4

'(idxplus ntString ntString ntInt ntInt)',
'(idxminus ntString ntString ntInt ntInt)'

ntString:
(define-fun getfirst ((X String)) String (str.substr X 0 1)) 5
(define-fun getprefix ((X String) (Y Int)) String (str.substr X 0 Y)) 6
(define-fun getsuffix ((X String) (Y Int)) String (str.substr X Y (str.len X))) 7
(define-fun getprefixone ((X String) (Y Int)) String (str.substr X 1 Y)) 8
(define-fun doubleconcat ((X String) (Y String) (Z String)) String (str.++ (str.++ X Y) Z)) 9
(define-fun sesuffix ((X String) (Y String) (P Int) (Q Int) (R Int)) String (str.substr X (+ (str.indexof X Y P) Q) R))10
(define-fun lasuffix ((X String) (Y Int) (Z Int)) String (str.substr X (- Y 1) Z)) 11
(define-fun subsconcat ((X String) (Y Int) (P Int) (Q Int)) String (str.++ (str.substr X 0 Y) (str.substr X P Q))) 12
(define-fun rpself ((X String) (Y String) (N Int) (M Int)) String (str.replace X (str.substr X N M) Y)) 13
(define-fun doublerp ((X String) (Y String) (Z String) (P String) (Q String)) String (str.replace (str.replace X Y Z) P Q )) 14

'(getfirst ntString)',
'(getprefix ntString ntInt)',
'(getsuffix ntString ntInt)',
'(getprefixone ntString ntInt)',
'(doubleconcat ntString ntString ntString)',
'(sesuffix ntString ntString ntInt ntInt ntInt)',
'(lasuffix ntString ntInt ntInt)',
'(subsconcat ntString ntInt ntInt ntInt)',
'(rpself ntString ntString ntInt ntInt)',
'(doublerp ntString ntString ntString ntString ntString)'


删除：
ntString:
(str.++ ntString ntString) 15
(str.replace ntString ntString ntString) 16
(str.at ntString ntInt) 17
(int.to.str ntInt) 18
(ite ntBool ntString ntString) 19
(str.substr ntString ntInt ntInt) 20

ntInt:
(+ ntInt ntInt) 21
(- ntInt ntInt) 22
(str.len ntString) 23
(str.to.int ntString) 24
(ite ntBool ntInt ntInt) 25
(str.indexof ntString ntString ntInt) 26

ntBool:
(= ntInt ntInt) 27
(str.prefixof ntString ntString) 28 
(str.suffixof ntString ntString) 29 
(str.contains ntString ntString) 30

限制深度：
ntstring：30  31
ntint:14     32
ntbool:10     33

L = 34 基因长度为34
'''
#genes = '1010101010101010101010101010101010'
genes = '1111111111111110000000000000000000'

ntStringconst = '_arg_0 "" " "'
ntStringconst_i = ['_arg_0 "" " "',
'_arg_0 "" " " "US" "CAN"',
'_arg_0 "" " " "overhead" "some project" "other" "boo" ","',
'_arg_0	"" " " "ssp."',
'_arg_0	"" " " "."',
'_arg_0	"" " " ">"',
'_arg_0	"" " " "-"',
'_arg_0 _arg_1 _arg_2 "" " " "/n"',
'name " "',
'_arg_0 _arg_1 "" " " "_"',
'_arg_0 _arg_1 "" " " "_"',
'_arg_0	"" " "',
'_arg_0	"" " " "9999999"',
'_arg_0	"" " "',
'_arg_0 _arg_1 "" " "',
'_arg_0	"" " " "BRD" "DRS" "LDS" "Branding" "Direct Response" "Leads"',
'_arg_0	"" " " "=" "-"',
'_arg_0	"" " " "|"',
'_arg_0	"" " " "Inc" "Company" "Corporation" "Enterprises"',
'_arg_0	"" " " "Name" "="',
'_arg_0 _arg_1 "" " " "C0"',
'_arg_0	"" " " "/" "microsoft" "windows" "apple" "mac"',
'_arg_0	"" " " "/"',
'_arg_0 _arg_1 "" " "',
'_arg_0 _arg_1 _arg_2 "" " "',
'_arg_0	"" " " "that"',
'_arg_0	"" " " "<" ">" "b"',
'_arg_0 _arg_1 "" " "',
'name " " "." "Dr."',
'_arg_0 _arg_1 "" " " "_"',
'name " " "."',
'name " " ',
'name " "',
'name " " "+" "-" "."',
'_arg_0	"" " "',
'firstname lastname " "',
'_arg_0	"" " " "Inc" "." "," "LLC"',
'col1 col2 " " ","',
'col1 col2 " " "," "USA" "PA" "CT" "CA" "MD" "NY"',
'_arg_0 _arg_1 "" " "']#i-1

ntStringbase = [
    '(str.++ ntString ntString)',
    '(str.replace ntString ntString ntString)',
    '(str.at ntString ntInt)',
    '(int.to.str ntInt)',
    '(ite ntBool ntString ntString)',
    '(str.substr ntString ntInt ntInt)']

ntIntconst = '_arg_1 1 0 -1'
ntIntconst_i = ['1 0 -1',
'1 0 -1',
'1 0 -1',
'1 0 -1',
'1 0 -1',
'1 0 -1',
'_arg_1	1 0 -1 1 2',
'1 0 -1',
'0 1 2 3 4 5',
'1 0 -1',
'1 0 -1 1 2 3',
'1 0 -1',
'1 0 -1',
'_arg_1	1 0 -1 0 1 2 3 4 5',
'1 0 -1',
'1 0 -1',
'1 0 -1',
'1 0 -1',
'1 0 -1',
'1 0 -1',
'1 0 -1',
'1 0 -1',
'1 0 -1',
'1 0 -1',
'1 0 -1',
'1 0 -1',
'1 0 -1',
'1 0 -1',
'0 1 2',
'1 0 -1',
'0 1 2',
'0 1',
'0 1 2 3 4 5',
'0 1 2 3 4 5',
'_arg_1	1 0 -1',
'0 1 2',
'1 0 -1',
'0 1 2',
'0 1 2',
'1 0 -1']

ntIntbase = [
    '(+ ntInt ntInt)',
    '(- ntInt ntInt)',
    '(str.len ntString)',
    '(str.to.int ntString)',
    '(ite ntBool ntInt ntInt)',
    '(str.indexof ntString ntString ntInt)']

ntBoolconst = 'true false'    
ntBoolbase = [
    '(= ntInt ntInt)',
	'(str.prefixof ntString ntString)',
	'(str.suffixof ntString ntString)',
	'(str.contains ntString ntString)']

ntStringapp = ['(getfirst ntString)',
'(getprefix ntString ntInt)',
'(getsuffix ntString ntInt)',
'(getprefixone ntString ntInt)',
'(doubleconcat ntString ntString ntString)',
'(sesuffix ntString ntString ntInt ntInt ntInt)',
'(lasuffix ntString ntInt ntInt)',
'(subsconcat ntString ntInt ntInt ntInt)',
'(rpself ntString ntString ntInt ntInt)',
'(doublerp ntString ntString ntString ntString ntString)']

ntIntapp = ['(succ ntInt)',
    '(pred ntInt)',
    '(firstidx ntString ntString)',
    '(idxplus ntString ntString ntInt ntInt)',
    '(idxminus ntString ntString ntInt ntInt)']#可能需要一个常量

funcs = ['(set-logic SLIA)',
'(extension depth-limit)',
'(define-fun succ ((X Int) ) Int (+ 1 X ))',
'(define-fun pred ((X Int) ) Int (+ -1 X )) ',
'(define-fun firstidx ((X String) (Y String) ) Int (str.indexof X Y 1 )) ',
'(define-fun idxplus ((X String) (Y String) (P Int) (Q Int)) Int (+ (str.indexof X Y P) Q)) ',
'(define-fun idxminus ((X String) (Y String) (P Int) (Q Int)) Int (- (str.indexof X Y P) Q)) ',
'(define-fun getfirst ((X String)) String (str.substr X 0 1))',
'(define-fun getprefix ((X String) (Y Int)) String (str.substr X 0 Y))',
'(define-fun getsuffix ((X String) (Y Int)) String (str.substr X Y (str.len X)))',
'(define-fun getprefixone ((X String) (Y Int)) String (str.substr X 1 Y))',
'(define-fun doubleconcat ((X String) (Y String) (Z String)) String (str.++ (str.++ X Y) Z))',
'(define-fun sesuffix ((X String) (Y String) (P Int) (Q Int) (R Int)) String (str.substr X (+ (str.indexof X Y P) Q) R))',
'(define-fun lasuffix ((X String) (Y Int) (Z Int)) String (str.substr X (- Y 1) Z))',
'(define-fun subsconcat ((X String) (Y Int) (P Int) (Q Int)) String (str.++ (str.substr X 0 Y) (str.substr X P Q)))',
'(define-fun rpself ((X String) (Y String) (N Int) (M Int)) String (str.replace X (str.substr X N M) Y))',
'(define-fun doublerp ((X String) (Y String) (Z String) (P String) (Q String)) String (str.replace (str.replace X Y Z) P Q ))']









#目标函数及start的声明
header = [['(synth-fun f ((_arg_0 String)) String', ' ( (Start String (ntString))'],
['(synth-fun f ((_arg_0 String)) String', ' ( (Start String (ntString))'],
['(synth-fun f ((_arg_0 String)) Bool', ' ( (Start Bool (ntBool))'],
['(synth-fun f ((_arg_0 String)) String ',' ( (Start String (ntString)) '],
['(synth-fun f ((_arg_0 String)) String ',' ( (Start String (ntString)) '],
['(synth-fun f ((_arg_0 String)) String ',' ( (Start String (ntString)) '],
['(synth-fun f ((_arg_0 String) (_arg_1 Int)) String ',' ( (Start String (ntString)) '],
['(synth-fun f ((_arg_0 String) (_arg_1 String) (_arg_2 String)) String ',' ( (Start String (ntString)) '],
['(synth-fun f ((name String)) String',' ( (Start String (ntString))'],
['(synth-fun f ((_arg_0 String) (_arg_1 String)) String ',' ( (Start String (ntString)) '],
['(synth-fun f ((_arg_0 String) (_arg_1 String)) Int ',' ( (Start Int (ntInt)) '],
['(synth-fun f ((_arg_0 String)) String ',' ( (Start String (ntString)) '],
['(synth-fun f ((_arg_0 String)) Bool ',' ( (Start Bool (ntBool)) '],
['(synth-fun f ((_arg_0 String) (_arg_1 Int)) String ',' ( (Start String (ntString)) '],
['(synth-fun f ((_arg_0 String) (_arg_1 String)) Int ',' ( (Start Int (ntInt)) '],
['(synth-fun f ((_arg_0 String)) String ',' ( (Start String (ntString)) '],
['(synth-fun f ((_arg_0 String)) String ',' ( (Start String (ntString)) '],
['(synth-fun f ((_arg_0 String)) String ',' ( (Start String (ntString)) '],
['(synth-fun f ((_arg_0 String)) String ',' ( (Start String (ntString)) '],
['(synth-fun f ((_arg_0 String)) String ',' ( (Start String (ntString)) '],
['(synth-fun f ((_arg_0 String) (_arg_1 String)) String ',' ( (Start String (ntString)) '],
['(synth-fun f ((_arg_0 String)) String ',' ( (Start String (ntString)) '],
['(synth-fun f ((_arg_0 String)) String ',' ( (Start String (ntString)) '],
['(synth-fun f ((_arg_0 String) (_arg_1 String)) Bool ',' ( (Start Bool (ntBool)) '],
['(synth-fun f ((_arg_0 String) (_arg_1 String) (_arg_2 String)) String ',' ( (Start String (ntString)) '],
['(synth-fun f ((_arg_0 String)) String ',' ( (Start String (ntString)) '],
['(synth-fun f ((_arg_0 String)) String ',' ( (Start String (ntString)) '],
['(synth-fun f ((_arg_0 String) (_arg_1 String)) Bool ',' ( (Start Bool (ntBool)) '],
['(synth-fun f ((name String)) String',' ((Start String (ntString))'],
['(synth-fun f ((_arg_0 String) (_arg_1 String)) String ',' ( (Start String (ntString)) '],
['(synth-fun f ((name String)) String',' ( (Start String (ntString))'],
['(synth-fun f ((name String)) String',' ( (Start String (ntString))'],
['(synth-fun f ((name String)) String',' ( (Start String (ntString))'],
['(synth-fun f ((name String)) String',' ( (Start String (ntString))'],
['(synth-fun f ((_arg_0 String) (_arg_1 Int)) String ',' ( (Start String (ntString)) '],
['(synth-fun f ((firstname String) (lastname String)) String',' ( (Start String (ntString))'],
['(synth-fun f ((_arg_0 String)) String ',' ( (Start String (ntString))'],
['(synth-fun f ((col1 String) (col2 String)) String',' ( (Start String (ntString))'],
['(synth-fun f ((col1 String) (col2 String)) String',' ( (Start String (ntString))'],
['(synth-fun f ((_arg_0 String) (_arg_1 String)) String ',' ( (Start String (ntString)) ']
]


tailer = [['))',
'(constraint (= (f "John Doe") "J Doe"))',
'(constraint (= (f "Mayur Naik") "M Naik"))',
'(constraint (= (f "Nimit Singh") "N Singh"))',
'(check-synth)',
'(define-fun f_1 ((_arg_0 String)) String (str.replace _arg_0 (str.substr _arg_0 1 (str.indexof _arg_0 " " 1)) " "))'],
['))',
'(constraint (= (f "Mining US") "Mining"))',
'(constraint (= (f "Soybean Farming CAN") "Soybean Farming"))',
'(constraint (= (f "Soybean Farming") "Soybean Farming"))',
'(constraint (= (f "Oil Extraction US") "Oil Extraction"))',
'(constraint (= (f "Fishing") "Fishing"))',
'(check-synth)',
'(define-fun f_1 ((_arg_0 String)) String (str.replace (str.replace _arg_0 "CAN" "US") (str.++ " " "US") ""))'],


]

ntIntfinal = []
ntIntfinal.append(ntIntconst)
for i in range(5):
    if genes[i] == '1':
        ntIntfinal.append(ntIntapp[i])

ntIntbasecp = ntIntbase.copy()
for i in range(21,27):
    if genes[i] == '1':
        ntIntbasecp.remove(ntIntbase[i-21])
for nt in ntIntbasecp:
    ntIntfinal.append(nt)

ntStringfinal = []
ntStringfinal.append(ntStringconst)
for i in range(5,15):
    if genes[i] == '1':
        ntStringfinal.append(ntStringapp[i-5])

ntStringbasecp = ntStringbase.copy()
for i in range(15,21):
    if genes[i] == '1':
        ntStringbasecp.remove(ntStringbase[i-15])
for nt in ntStringbasecp:
    ntStringfinal.append(nt)

ntBoolfinal = []
ntBoolfinal.append(ntBoolconst)
ntBoolbasecp = ntBoolbase.copy()
for i in range(27,31):
    if genes[i] == '1':
        ntBoolbasecp.remove(ntBoolbase[i-27])
for nt in ntBoolbasecp:
    ntBoolfinal.append(nt)

part1 = ['(set-logic SLIA)',
'(extension depth-limit)',
'(define-fun succ ((X Int) ) Int (+ 1 X ))',
'(define-fun pred ((X Int) ) Int (+ -1 X )) ',
'(define-fun firstidx ((X String) (Y String) ) Int (str.indexof X Y 1 )) ',
'(define-fun idxplus ((X String) (Y String) (P Int) (Q Int)) Int (+ (str.indexof X Y P) Q)) ',
'(define-fun idxminus ((X String) (Y String) (P Int) (Q Int)) Int (- (str.indexof X Y P) Q)) ',
'(define-fun getfirst ((X String)) String (str.substr X 0 1))',
'(define-fun getprefix ((X String) (Y Int)) String (str.substr X 0 Y))',
'(define-fun getsuffix ((X String) (Y Int)) String (str.substr X Y (str.len X)))',
'(define-fun getprefixone ((X String) (Y Int)) String (str.substr X 1 Y))',
'(define-fun doubleconcat ((X String) (Y String) (Z String)) String (str.++ (str.++ X Y) Z))',
'(define-fun sesuffix ((X String) (Y String) (P Int) (Q Int) (R Int)) String (str.substr X (+ (str.indexof X Y P) Q) R))',
'(define-fun lasuffix ((X String) (Y Int) (Z Int)) String (str.substr X (- Y 1) Z))',
'(define-fun subsconcat ((X String) (Y Int) (P Int) (Q Int)) String (str.++ (str.substr X 0 Y) (str.substr X P Q)))',
'(define-fun rpself ((X String) (Y String) (N Int) (M Int)) String (str.replace X (str.substr X N M) Y))',
'(define-fun doublerp ((X String) (Y String) (Z String) (P String) (Q String)) String (str.replace (str.replace X Y Z) P Q ))',
'(synth-fun f ((_arg_0 String) (_arg_1 Int)) String ',
' ( (Start String (ntString))'] #对于String的output

part2 = ['))',
'(constraint (= (f "John Doe") "J Doe"))',
'(constraint (= (f "Mayur Naik") "M Naik"))',
'(constraint (= (f "Nimit Singh") "N Singh"))',
'(check-synth)']

t = '	'
with open('/home/citceae/DSL/lxy/source.sl','w') as f:
    for p in part1:
        print(p,file=f)
    if genes[31] == '1':
        p = ' (ntString@30 String ('
    else:
        p = ' (ntString String ('
    print(p,file=f)
    for p in ntStringfinal:
        p_= t+p
        print(p_,file=f)
    print('))',file=f)
    if genes[32] =='1':
        p = ' (ntInt@14 Int ('
    else:
        p = ' (ntInt Int ('
    print(p,file=f)
    for p in ntIntfinal:
        p_ = t+p
        print(p_,file=f)
    print('))',file=f)
    if genes[33] =='1':
        p = ' (ntBool@10 Bool ('
    else:
        p = ' (ntBool Bool ('
    print(p,file=f)
    for p in ntBoolfinal:
        p_=t+p
        print(p_,file=f)
    print('))',file=f)
    for p in part2:
        print(p,file=f)

def getsource(genes):
    ntIntfinal = []
    ntIntfinal.append(ntIntconst)
    for i in range(5):
        if genes[i] == '1':
            ntIntfinal.append(ntIntapp[i])

    ntIntbasecp = ntIntbase.copy()
    for i in range(21,27):
        if genes[i] == '1':
            ntIntbasecp.remove(ntIntbase[i-21])
    for nt in ntIntbasecp:
        ntIntfinal.append(nt)

    ntStringfinal = []
    ntStringfinal.append(ntStringconst)
    for i in range(5,15):
        if genes[i] == '1':
            ntStringfinal.append(ntStringapp[i-5])

    ntStringbasecp = ntStringbase.copy()
    for i in range(15,21):
        if i == 19:#ite 保留
            continue
        if genes[i] == '1':
            ntStringbasecp.remove(ntStringbase[i-15])
    for nt in ntStringbasecp:
        ntStringfinal.append(nt)

    ntBoolfinal = []
    ntBoolfinal.append(ntBoolconst)
    ntBoolbasecp = ntBoolbase.copy()
    for i in range(27,31):
        if genes[i] == '1':
            ntBoolbasecp.remove(ntBoolbase[i-27])
    for nt in ntBoolbasecp:
        ntBoolfinal.append(nt)
    
    with open('/home/citceae/DSL/lxy/source.sl','w') as f:
        for p in part1:
            print(p,file=f)
        if genes[31] == '1':
            p = ' (ntString@30 String ('
        else:
            p = ' (ntString String ('
        print(p,file=f)
        for p in ntStringfinal:
            p_= t+p
            print(p_,file=f)
        print('))',file=f)
        if genes[32] =='1':
            p = ' (ntInt@14 Int ('
        else:
            p = ' (ntInt Int ('
        print(p,file=f)
        for p in ntIntfinal:
            p_ = t+p
            print(p_,file=f)
        print('))',file=f)
        if genes[33] =='1':
            p = ' (ntBool@10 Bool ('
        else:
            p = ' (ntBool Bool ('
        print(p,file=f)
        for p in ntBoolfinal:
            p_=t+p
            print(p_,file=f)
        print('))',file=f)
        for p in part2:
            print(p,file=f)

    
   


    
