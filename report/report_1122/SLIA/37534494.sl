; https=//stackoverflow.com/questions/37534494/search-for-a-word-in-an-array-of-cells-containing-sentences-in-excel/37534856%37534856
(set-logic SLIA)
(define-fun succ ((X Int) ) Int (+ 1 X ))
(define-fun pred ((X Int) ) Int (+ -1 X ))
(define-fun firstidx ((X String) (Y String) ) Int (str.indexof X Y 1 ))
(define-fun rpself ((X String) (Y String) (N Int) (M Int)) String (str.replace X (str.substr X N M) Y))
(synth-fun f ((_arg_0 String) (_arg_1 String) (_arg_2 String)) String 
 ( (Start String (ntString)) 
 (ntString String (
	_arg_0 _arg_1 _arg_2
	"" " "
	(rpself ntString ntString ntInt ntInt)
	(str.++ ntString ntString) 
	(str.replace ntString ntString ntString) 
	(str.at ntString ntInt)
	(int.to.str ntInt)
	(ite ntBool ntString ntString)
	(str.substr ntString ntInt ntInt)
)) 
 (ntInt Int (
	
	1 0 -1
	(succ ntInt)
	(pred ntInt)
	(firstidx ntString ntString)
	(+ ntInt ntInt)
	(- ntInt ntInt)
	(str.len ntString)
	(str.to.int ntString)
	(ite ntBool ntInt ntInt)
	(str.indexof ntString ntString ntInt)
)) 
 (ntBool Bool (
	
	true false
	(= ntInt ntInt)
	(str.prefixof ntString ntString)
	(str.suffixof ntString ntString)
	(str.contains ntString ntString)
)) ))
(constraint (= (f "I love apples" "I hate bananas" "banana") "I hate bananas"))
(constraint (= (f "I love apples" "I hate bananas" "apple") "I love apples"))
(check-synth)
(define-fun f_1 ((_arg_0 String) (_arg_1 String) (_arg_2 String)) String (ite (str.contains _arg_1 _arg_2) _arg_1 _arg_0))
