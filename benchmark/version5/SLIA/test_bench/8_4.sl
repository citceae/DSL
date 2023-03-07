; https=//stackoverflow.com/questions/38871714/excel-vba-how-to-remove-substrings-from-a-cell
(set-logic SLIA)
(define-fun succ ((X Int) ) Int (+ 1 X ))
(define-fun pred ((X Int) ) Int (+ -1 X ))
(define-fun firstidx ((X String) (Y String) ) Int (str.indexof X Y 1 ))
(define-fun rpself ((X String) (Y String) (N Int) (M Int)) String (str.replace X (str.substr X N M) Y))
(synth-fun f ((_arg_0 String) (_arg_1 String) (_arg_2 String)) String 
 ( (Start String (ntString)) 
 (ntString String (
	_arg_0 _arg_1 _arg_2
	"" " " "/n"
	(rpself ntString ntString ntInt ntInt)
	(str.replace ntString ntString ntString) 
	(str.at ntString ntInt)
	(ite ntBool ntString ntString)
	(str.++ ntString ntString) 
	(str.substr ntString ntInt ntInt)
)) 
 (ntInt Int (
	
	1 0 -1
	(succ ntInt)
	(pred ntInt)
	(firstidx ntString ntString)
	(str.len ntString)
	(str.indexof ntString ntString ntInt)
)) 
 (ntBool Bool (
	
	true false
	(str.prefixof ntString ntString)
	(str.suffixof ntString ntString)
	(str.contains ntString ntString)
)) ))
(constraint (= (f "Traci Brown" "1301 Robinson Court" "Saginaw, MI 48607") "Traci Brown/n1301 Robinson Court/nSaginaw, MI 48607"))
(constraint (= (f "Mary Hannan" "1195 Amethyst Drive" "Lansing, MI 48933") "Mary Hannan/n1195 Amethyst Drive/nLansing, MI 48933"))
(constraint (= (f "Linda Thomas" "2479 North Bend Road" "Allen, KY 41601") "Linda Thomas/n2479 North Bend Road/nAllen, KY 41601"))
(check-synth)
(define-fun f_1 ((_arg_0 String) (_arg_1 String) (_arg_2 String)) String (str.++ (str.++ (str.++ (str.++ _arg_0 "/n") _arg_1) "/n") _arg_2))

