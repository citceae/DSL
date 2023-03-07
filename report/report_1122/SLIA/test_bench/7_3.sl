; https=//stackoverflow.com/questions/38871714/excel-vba-how-to-remove-substrings-from-a-cell
(set-logic SLIA)
(define-fun succ ((X Int) ) Int (+ 1 X ))
(define-fun pred ((X Int) ) Int (+ -1 X ))
(define-fun firstidx ((X String) (Y String) ) Int (str.indexof X Y 1 ))
(define-fun rpself ((X String) (Y String) (N Int) (M Int)) String (str.replace X (str.substr X N M) Y))
(synth-fun f ((_arg_0 String) (_arg_1 Int)) String 
 ( (Start String (ntString)) 
 (ntString String (
	_arg_0
	"" " " "-"
	(rpself ntString ntString ntInt ntInt)
	(str.replace ntString ntString ntString) 
	(str.at ntString ntInt)
	(ite ntBool ntString ntString)
	(str.++ ntString ntString) 
	(str.substr ntString ntInt ntInt)
)) 
 (ntInt Int (
	_arg_1
	1 0 -1 1 2
	(succ ntInt)
	(pred ntInt)
	(firstidx ntString ntString)
	(str.len ntString)
)) 
 (ntBool Bool (
	
	true false
	(str.suffixof ntString ntString)
	(str.contains ntString ntString)
)) ))
(constraint (= (f "1/17/16-1/18/17" 1) "1/17/16"))
(constraint (= (f "1/17/16-1/18/17" 2) "1/18/17"))
(constraint (= (f "01/17/2016-01/18/2017" 1) "01/17/2016"))
(constraint (= (f "01/17/2016-01/18/2017" 2) "01/18/2017"))
(check-synth)
