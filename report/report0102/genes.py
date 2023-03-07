'''
添加：
ntInt:
(define-fun succ ((X Int) ) Int (+ 1 X )) 0
(define-fun pred ((X Int) ) Int (+ -1 X ))1
(define-fun firstidx ((X String) (Y String) ) Int (str.indexof X Y 1 ))2

(define-fun rpself ((X String) (Y String) (N Int) (M Int)) String (str.replace X (str.substr X N M) Y))3
(define-fun getprefix ((X String) (Y Int)) String (str.substr X 0 Y))4
(define-fun getsuffix ((X String) (Y Int)) String (str.substr X Y (str.len X)))5
(define-fun doublerp ((X String) (Y String) (Z String) (P String) (Q String)) String (str.replace (str.replace X Y Z) P Q ))6

删除：
ntString:(ite ntBool ntString ntString)7
ntInt:(ite ntBool ntInt ntInt)8

限制深度：
ntstring：10  9
ntint:10   10
ntbool:8   11

L = 12 基因长度为12
'''

genes = '101010101010'

ntStringbase = ['(str.replace ntString ntString ntString)',
    '(str.at ntString ntInt)',
    '(ite ntBool ntString ntString)',
    '(str.++ ntString ntString)',
    '(str.substr ntString ntInt ntInt)',
    '(int.to.str ntInt)']
ntIntbase = ['(str.len ntString)',
    '(str.indexof ntString ntString ntInt)',
    '(+ ntInt ntInt)',
    '(- ntInt ntInt)',
    '(str.to.int ntString)',
    '(ite ntBool ntInt ntInt)']

ntStringapp = ['(rpself ntString ntString ntInt ntInt)',
	'(getprefix ntString ntInt)',
	'(getsuffix ntString ntInt)',
	'(doublerp ntString ntString ntString ntString ntString)']
ntIntapp = ['(succ ntInt)',
    '(pred ntInt)',
    '(firstidx ntString ntString)']#可能需要一个常量


ntIntfinal = []
for i in range(3):
    if genes[i] == '1':
        ntIntfinal.append(ntIntapp[i])

ntIntbasecp = ntIntbase.copy()
if genes[8] == '1':
    ntIntbasecp.remove('(ite ntBool ntInt ntInt)')
for nt in ntIntbasecp:
    ntIntfinal.append(nt)

ntStringfinal = []
for i in range(4):
    if genes[i+3] == '1':
        ntStringfinal.append(ntStringapp[i])

ntStringbasecp = ntStringbase.copy()
if genes[7] == '1':
    ntStringbasecp.remove('(ite ntBool ntString ntString)')
for nt in ntStringbasecp:
    ntStringfinal.append(nt)

ntBoolfinal = ['(= ntInt ntInt)',
	'(str.prefixof ntString ntString)',
	'(str.suffixof ntString ntString)',
	'(str.contains ntString ntString)']

part1 = ['(set-logic SLIA)',
'(extension depth-limit)',
'(define-fun succ ((X Int) ) Int (+ 1 X ))',
'(define-fun pred ((X Int) ) Int (+ -1 X ))',
'(define-fun firstidx ((X String) (Y String) ) Int (str.indexof X Y 1 ))',
'(define-fun rpself ((X String) (Y String) (N Int) (M Int)) String (str.replace X (str.substr X N M) Y))',
'(define-fun getprefix ((X String) (Y Int)) String (str.substr X 0 Y))',
'(define-fun getsuffix ((X String) (Y Int)) String (str.substr X Y (str.len X)))',
'(define-fun doublerp ((X String) (Y String) (Z String) (P String) (Q String)) String (str.replace (str.replace X Y Z) P Q ))',
'(synth-fun f ((_arg_0 String)) String ',
' ( (Start String (ntString))'] #对于String的output

part2 = ['))',
'(constraint (= (f "This is a <string>, It should be <changed> to <a> number.") "This is a string, It should be changed to a number."))',
'(constraint (= (f "a < 4 and a > 0") "a  4 and a  0"))',
'(check-synth)']

t = '	'
with open('/home/citceae/DSL/lxy/basetest.sl','w') as f:
    for p in part1:
        print(p,file=f)
    if genes[9] == '1':
        p = ' (ntString@10 String ('
    else:
        p = ' (ntString String ('
    print(p,file=f)
    for p in ntStringfinal:
        p_= t+p
        print(p_,file=f)
    print('))',file=f)
    if genes[10] =='1':
        p = ' (ntInt@10 Int ('
    else:
        p = ' (ntInt Int ('
    print(p,file=f)
    for p in ntIntfinal:
        p_ = t+p
        print(p_,file=f)
    print('))',file=f)
    if genes[11] =='1':
        p = ' (ntBool@8 Bool ('
    else:
        p = ' (ntBool Bool ('
    print(p,file=f)
    for p in ntBoolfinal:
        p_=t+p
        print(p_,file=f)
    print('))',file=f)
    for p in part2:
        print(p,file=f)



    
