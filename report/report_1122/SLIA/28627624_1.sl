; https=//stackoverflow.com/questions/28627624/excel-single-cell-to-multiple-rows-and-get-substring
(set-logic SLIA)
(define-fun succ ((X Int) ) Int (+ 1 X ))
(define-fun pred ((X Int) ) Int (+ -1 X ))
(define-fun firstidx ((X String) (Y String) ) Int (str.indexof X Y 1 ))
(define-fun rpself ((X String) (Y String) (N Int) (M Int)) String (str.replace X (str.substr X N M) Y))
(synth-fun f ((_arg_0 String)) String 
 ( (Start String (ntString)) 
 (ntString String (
	_arg_0
	"" " " "=" "-"
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
(constraint (= (f "Dec 2, 2014, 11=23 PM - +91 90000 80000= loren ipsum") "Dec 2, 2014, 11=23 PM"))
(constraint (= (f "Dec 2, 2014, 11=24 PM - +91 90000 80000= loren") "Dec 2, 2014, 11=24 PM"))
(check-synth)
(define-fun f_1 ((_arg_0 String)) String (str.substr _arg_0 0 (+ (str.indexof _arg_0 "-" 1) -1)))
