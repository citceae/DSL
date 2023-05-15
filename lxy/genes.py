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
#'(extension depth-limit)',
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
['))',
'(constraint (= (f "some project,other project") true))',
'(constraint (= (f "some project") true))',
'(constraint (= (f "overhead") false))',
'(constraint (= (f "some project, overhead") false))',
'(constraint (= (f "some project, other, boo") true))',
'(check-synth)',
'(define-fun f_1 ((_arg_0 String)) Bool (= (str.indexof _arg_0 "overhead" 0) -1))'],
['))',
'(constraint (= (f "Polygonum amphibium") "Polygonum"))',
'(constraint (= (f "Hippuris vulgaris") "Hippuris"))',
'(constraint (= (f "Lysimachia vulgaris") "Lysimachia"))',
'(constraint (= (f "Juncus bulbosus ssp. bulbosus") "Juncus bulbosus"))',
'(constraint (= (f "Lycopus europaeus ssp. europaeus") "Lycopus europaeus"))',
'(constraint (= (f "Nymphaea alba") "Nymphaea"))',
'(check-synth)',
'(define-fun f_1 ((_arg_0 String)) String (str.substr _arg_0 0 (str.indexof _arg_0 " " (str.len (str.++ "ssp." "ssp.")))))'],
['))',
'(constraint (= (f "AIX 5.1") "5.1"))',
'(constraint (= (f "VMware ESX Server 3.5.0 build-110268") "3.5"))',
'(constraint (= (f "Linux Linux 2.6 Linux") "2.6"))',
'(constraint (= (f "Red Hat Enterprise AS 4 <2.6-78.0.13.ELlargesmp>") "2.6"))',
'(constraint (= (f "Microsoft <R> Windows <R> 2000 Advanced Server 1.0") "1.0"))',
'(constraint (= (f "Microsoft Windows XP Win2008R2 6.1.7601") "6.1"))',
'(check-synth)'],
['))',
'(constraint (= (f "USD.EUR<IDEALPRO,CASH,EUR>") "EUR"))',
'(constraint (= (f "USD.EUR<IDEALPRO,CASH,USD>") "USD"))',
'(constraint (= (f "KOR.JPN<IDEALPRO,CASH,WON>") "WON"))',
'(constraint (= (f "KOR.JPN<IDEALPRO,CASH,YEN>") "YEN"))',
'(check-synth)'],
['))',
'(constraint (= (f "1/17/16-1/18/17" 1) "1/17/16"))',
'(constraint (= (f "1/17/16-1/18/17" 2) "1/18/17"))',
'(constraint (= (f "01/17/2016-01/18/2017" 1) "01/17/2016"))',
'(constraint (= (f "01/17/2016-01/18/2017" 2) "01/18/2017"))',
'(check-synth)'],
['))',
'(constraint (= (f "Traci Brown" "1301 Robinson Court" "Saginaw, MI 48607") "Traci Brown/n1301 Robinson Court/nSaginaw, MI 48607"))',
'(constraint (= (f "Mary Hannan" "1195 Amethyst Drive" "Lansing, MI 48933") "Mary Hannan/n1195 Amethyst Drive/nLansing, MI 48933"))',
'(constraint (= (f "Linda Thomas" "2479 North Bend Road" "Allen, KY 41601") "Linda Thomas/n2479 North Bend Road/nAllen, KY 41601"))',
'(check-synth)',
'(define-fun f_1 ((_arg_0 String) (_arg_1 String) (_arg_2 String)) String (str.++ (str.++ (str.++ (str.++ _arg_0 "/n") _arg_1) "/n") _arg_2))'],
['))',
'(constraint (= (f "Ducati100") "Ducati"))',
'(constraint (= (f "Honda125") "Honda"))',
'(constraint (= (f "Ducati250") "Ducati"))',
'(constraint (= (f "Honda250") "Honda"))',
'(constraint (= (f "Honda550") "Honda"))',
'(constraint (= (f "Ducati125") "Ducati"))',
'(check-synth)',
'(define-fun f_1 ((name String)) String (str.substr name 0 (- (str.len name) 3)))'],
['))',
'(constraint (= (f "ann chang" "achang_maaker.com") "achang"))',
'(constraint (= (f "bobby smith" "bobt_sphynx.uk.co") "bobt"))',
'(constraint (= (f "art lennox" "art.lennox_svxn.com") "art.lennox"))',
'(check-synth)',
'(define-fun f_1 ((_arg_0 String) (_arg_1 String)) String (str.substr _arg_1 0 (str.indexof _arg_1 "_" 1)))'],
['))',
'(constraint (= (f "An example string with _username in it RT _AwesomeUser says _username is awesome" "username") 2))',
'(constraint (= (f "An example string with _username in it RT _AwesomeUser says _username is awesome" "AwesomeUser") 1))',
'(constraint (= (f "An _example string with _example in it is awesome _example" "example") 3))',
'(check-synth)',
'(define-fun f_1 ((_arg_0 String) (_arg_1 String)) Int (+ (- 3 (str.len (str.substr _arg_1 (+ 3 3) 3))) 1))'],
['))',
'(constraint (= (f "01/15/2013") "01/2013"))',
'(constraint (= (f "03/07/2011") "03/2011"))',
'(constraint (= (f "05/09/2009") "05/2009"))',
'(check-synth)'],
['))',
'(constraint (= (f "dhfjd9999999dfda") true))',
'(constraint (= (f "ddsss999dfdfsfd") false))',
'(check-synth)',
'(define-fun f_1 ((_arg_0 String)) Bool (str.contains _arg_0 "9999999"))'],
['))',
'(constraint (= (f "spreadsheet" 1) "s"))',
'(constraint (= (f "spreadsheet" 2) "p"))',
'(constraint (= (f "spreadsheet" 3) "r"))',
'(constraint (= (f "spreadsheet" 4) "e"))',
'(constraint (= (f "spreadsheet" 5) "a"))',
'(check-synth)',
'(define-fun f_1 ((_arg_0 String) (_arg_1 Int)) String (str.at (str.++ " " _arg_0) _arg_1))'],
['))',
'(constraint (= (f "apple apples" "apple") 2))',
'(constraint (= (f "an orange among the oranges is a spoiled orange" "orange") 3))',
'(check-synth)',
'(define-fun f_1 ((_arg_0 String) (_arg_1 String)) Int (+ (+ (+ (str.len _arg_1) -1) -1) -1))'],
['))',
'(constraint (= (f "Adf_ROCLeader_BAN_728x90_CPM_STD _BRD _NRT_DCK") "Adf_ROCLeader_BAN_728x90_CPM_STD _Branding _NRT_DCK"))',
'(constraint (= (f "MMC_ContextualLarRec_BAN_336x280_CPM_STD _LDS _RTG_DCK") "MMC_ContextualLarRec_BAN_336x280_CPM_STD _Leads _RTG_DCK"))',
'(constraint (= (f "Adf_ROC_DLBD_728x90_CPM_STD_DRS_NRT_NOR_DCK") "Adf_ROC_DLBD_728x90_CPM_STD_Direct Response_NRT_NOR_DCK"))',
'(check-synth)'],
['))',
'(constraint (= (f "Dec 2, 2014, 11=23 PM - +91 90000 80000= loren ipsum") "Dec 2, 2014, 11=23 PM"))',
'(constraint (= (f "Dec 2, 2014, 11=24 PM - +91 90000 80000= loren") "Dec 2, 2014, 11=24 PM"))',
'(check-synth)',
'(define-fun f_1 ((_arg_0 String)) String (str.substr _arg_0 0 (+ (str.indexof _arg_0 "-" 1) -1)))'],
['))',
'(constraint (= (f "TL-18273982| 10MM") "TL-18273982"))',
'(constraint (= (f "TL-288762| 76DK") "TL-288762"))',
'(constraint (= (f "CT-576") "CT-576"))',
'(constraint (= (f "N/A") "N/A"))',
'(check-synth)',
'(define-fun f_1 ((_arg_0 String)) String (str.substr _arg_0 0 (str.indexof (str.++ _arg_0 "|") "|" 1)))'],
['))',
'(constraint (= (f "General Electric") "General Electric"))',
'(constraint (= (f "General Electric Inc") "General Electric"))',
'(constraint (= (f "General Electric Company") "General Electric"))',
'(constraint (= (f "Microsoft") "Microsoft"))',
'(constraint (= (f "Microsoft Corporation") "Microsoft"))',
'(constraint (= (f "Nintendo") "Nintendo"))',
'(constraint (= (f "Nintendo Enterprises") "Nintendo"))',
'(check-synth)'],
['))',
'(constraint (= (f "Name= ABC Retailers") "ABC Retailers"))',
'(constraint (= (f " ame= XYZ Suppliers") "XYZ Suppliers"))',
'(check-synth)',
'(define-fun f_1 ((_arg_0 String)) String (str.substr _arg_0 (+ (+ (str.len "Name") 1) 1) (str.len _arg_0)))'],
['))',
'(constraint (= (f "C0abc" "def") "C0abc"))',
'(constraint (= (f "aabc" "def") "def"))',
'(constraint (= (f "C0dd" "qwe") "C0dd"))',
'(constraint (= (f "dd" "qwe") "qwe"))',
'(check-synth)',
'(define-fun f_1 ((_arg_0 String) (_arg_1 String)) String (ite (str.prefixof "C0" _arg_0) _arg_0 _arg_1))'],
['))',
'(constraint (= (f "http=//www.apple.com/uk/mac") "mac"))',
'(constraint (= (f "https=//www.microsoft.com/en-gb/windows") "windows"))',
'(constraint (= (f "https=//www.microsoft.com/") "microsoft"))',
'(check-synth)'],
['))',
'(constraint (= (f "ABCDE/FGHI/JKL/MNOPQR") "MNOPQR"))',
'(constraint (= (f "A/ABCDE/FGHI/JKL") "JKL"))',
'(check-synth)'],
['))',
'(constraint (= (f "ABC" "D") false))',
'(constraint (= (f "ABC" "BC") true))',
'(check-synth)',
'(define-fun f_1 ((_arg_0 String) (_arg_1 String)) Bool (str.suffixof _arg_1 _arg_0))'],
['))',
'(constraint (= (f "I love apples" "I hate bananas" "banana") "I hate bananas"))',
'(constraint (= (f "I love apples" "I hate bananas" "apple") "I love apples"))',
'(check-synth)',
'(define-fun f_1 ((_arg_0 String) (_arg_1 String) (_arg_2 String)) String (ite (str.contains _arg_1 _arg_2) _arg_1 _arg_0))'],
['))',
'(constraint (= (f "thatensures") "ensures"))',
'(constraint (= (f "thatwill") "will"))',
'(constraint (= (f "thathave") "have"))',
'(constraint (= (f "knowthat") "know"))',
'(constraint (= (f "that") "that"))',
'(constraint (= (f "mouse") "mouse"))',
'(constraint (= (f "knowthat") "know"))',
'(check-synth)',
'(define-fun f_1 ((_arg_0 String)) String (str.replace _arg_0 (str.replace "that" _arg_0 "") ""))'],
['))',
'(constraint (= (f "<b>0.66<b>") "0.66"))',
'(constraint (= (f "<b>0.409<b>") "0.409"))',
'(constraint (= (f "<b>0.7268<b>") "0.7268"))',
'(check-synth)'],
['))',
'(constraint (= (f "apple" "apple") true))',
'(constraint (= (f "orange" "Orange") false))',
'(constraint (= (f "peach" "peach") true))',
'(constraint (= (f "cherry" "cherrY") false))',
'(check-synth)',
'(define-fun f_1 ((_arg_0 String) (_arg_1 String)) Bool (str.prefixof _arg_1 _arg_0))'],
['))',
'(constraint (= (f "Nancy FreeHafer") "Dr. Nancy"))',
'(constraint (= (f "Andrew Cencici") "Dr. Andrew"))',
'(constraint (= (f "Jan Kotas") "Dr. Jan"))',
'(constraint (= (f "Mariya Sergienko") "Dr. Mariya"))',
'(check-synth)',
'(define-fun f_1 ((name String)) String (str.++ (str.substr "Dr." 0 2) (str.++ "." (str.++ " " (str.substr name 0 (str.indexof name " " 0))))))'],
['))',
'(constraint (= (f "ann chang" "achang_maaker.com") "maaker.com"))',
'(constraint (= (f "bobby smith" "bobt_sphynx.uk.co") "sphynx.uk.co"))',
'(constraint (= (f "art lennox" "art.lennox_svxn.com") "svxn.com"))',
'(check-synth)'],
['))',
'(constraint (= (f "Nancy FreeHafer") "N.F."))',
'(constraint (= (f "Andrew Cencici") "A.C."))',
'(constraint (= (f "Jan Kotas") "J.K."))',
'(constraint (= (f "Mariya Sergienko") "M.S."))',
'(check-synth)'],
['))',
'(constraint (= (f "Nancy FreeHafer") "FreeHafer"))',
'(constraint (= (f "Andrew Cencici") "Cencici"))',
'(constraint (= (f "Jan Kotas") "Kotas"))',
'(constraint (= (f "Mariya Sergienko") "Sergienko"))',
'(check-synth)',
'(define-fun f_1 ((name String)) String (str.substr name (+ (str.indexof name " " 0) 1) (str.len name)))'],
['))',
'(constraint (= (f "938-242-504") "938"))',
'(constraint (= (f "308-916-545") "308"))',
'(constraint (= (f "623-599-749") "623"))',
'(constraint (= (f "981-424-843") "981"))',
'(constraint (= (f "118-980-214") "118"))',
'(constraint (= (f "244-655-094") "244"))',
'(check-synth)',
'(define-fun f_1 ((name String)) String (str.substr name 0 3))'],
['))',
'(constraint (= (f "+106 769-858-438") "769"))',
'(constraint (= (f "+83 973-757-831") "973"))',
'(constraint (= (f "+62 647-787-775") "647"))',
'(constraint (= (f "+172 027-507-632") "027"))',
'(constraint (= (f "+72 001-050-856") "001"))',
'(constraint (= (f "+95 310-537-401") "310"))',
'(constraint (= (f "+6 775-969-238") "775"))',
'(check-synth)'],
['))',
'(constraint (= (f "1234" 1) "234"))',
'(constraint (= (f "**512A" 2) "512A"))',
'(constraint (= (f "343DMX" 3) "DMX"))',
'(check-synth)',
'(define-fun f_1 ((_arg_0 String) (_arg_1 Int)) String (str.substr _arg_0 _arg_1 (str.len _arg_0)))'],
['))',
'(constraint (= (f "Launa" "Withers") "Withers Launa"))',
'(constraint (= (f "Lakenya" "Edison") "Edison Lakenya"))',
'(constraint (= (f "Brendan" "Hage") "Hage Brendan"))',
'(constraint (= (f "Bradford" "Lango") "Lango Bradford"))',
'(constraint (= (f "Rudolf" "Akiyama") "Akiyama Rudolf"))',
'(constraint (= (f "Lara" "Constable") "Constable Lara"))',
'(check-synth)',
'(define-fun f_1 ((firstname String) (lastname String)) String (str.++ (str.++ lastname " ") firstname))'],
['))',
'(constraint (= (f "Trucking Inc.") "Trucking"))',
'(constraint (= (f "New Truck Inc") "New Truck"))',
'(constraint (= (f "ABV Trucking Inc, LLC") "ABV Trucking"))',
'(check-synth)'],
['))',
'(constraint (= (f "University of Pennsylvania" "Phialdelphia, PA, USA")',
'"University of Pennsylvania, Phialdelphia, PA, USA"))',
'(constraint (= (f "Cornell University" "Ithaca, New York, USA")',
'"Cornell University, Ithaca, New York, USA"))',
'(constraint (= (f "University of Maryland College Park" "College Park, MD")',
'"University of Maryland College Park, College Park, MD"))',
'(constraint (= (f "University of Michigan" "Ann Arbor, MI, USA")',
'"University of Michigan, Ann Arbor, MI, USA"))',
'(constraint (= (f "Yale University" "New Haven, CT, USA")',
'"Yale University, New Haven, CT, USA"))',
'(constraint (= (f "Columbia University" "New York, NY, USA")',
'"Columbia University, New York, NY, USA"))',
'(check-synth)',
'(define-fun f_1 ((col1 String) (col2 String)) String (str.++ (str.++ (str.++ col1 ",") " ") col2))'],
['))',
'(constraint (= (f "University of Pennsylvania" "Phialdelphia, PA, USA")',
'"Phialdelphia, PA, USA"))',
'(constraint (= (f "UCLA" "Los Angeles, CA")',
'"Los Angeles, CA, USA"))',
'(constraint (= (f "Cornell University" "Ithaca, New York, USA")',
'"Ithaca, New York, USA"))',
'(constraint (= (f "Penn" "Philadelphia, PA, USA")',
'"Philadelphia, PA, USA"))',
'(constraint (= (f "University of Maryland College Park" "College Park, MD")',
'"College Park, MD, USA"))',
'(constraint (= (f "University of Michigan" "Ann Arbor, MI, USA")',
'"Ann Arbor, MI, USA"))',
'(check-synth)'
'(define-fun f_1 ((col1 String) (col2 String)) String (ite (str.suffixof "USA" col2) col2 (str.++ col2 (str.++ (str.++ "," " ") "USA"))))'],
['))',
'(constraint (= (f "zx66448" "z") "x66448"))',
'(constraint (= (f "zx66448" "x") "z66448"))',
'(constraint (= (f "zx66448" "6") "zx448"))',
'(constraint (= (f "zx66448" "4") "zx668"))',
'(constraint (= (f "zx66448" "8") "zx6644"))',
'(check-synth)',
'(define-fun f_1 ((_arg_0 String) (_arg_1 String)) String (str.replace (str.replace _arg_0 _arg_1 "") _arg_1 ""))']
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
#'(extension depth-limit)',
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

def createfile(genes,num,path):
    ntIntfinal = []
    ntIntfinal.append(ntIntconst_i[num-1])
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
    ntStringfinal.append(ntStringconst_i[num-1])
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
    
    filename = path + str(num) + '_.sl'
    with open(filename,'w') as f:
        for p in funcs:
            print(p,file=f)
        for p in header[num-1]:
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
        for p in tailer[num-1]:
            print(p,file=f)
   


    
