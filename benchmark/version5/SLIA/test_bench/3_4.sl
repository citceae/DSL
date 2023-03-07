; https=//stackoverflow.com/questions/38871714/excel-vba-how-to-remove-substrings-from-a-cell
(set-logic SLIA)
(define-fun succ ((X Int) ) Int (+ 1 X ))
(define-fun pred ((X Int) ) Int (+ -1 X ))
(define-fun firstidx ((X String) (Y String) ) Int (str.indexof X Y 1 ))
(define-fun rpself ((X String) (Y String) (N Int) (M Int)) String (str.replace X (str.substr X N M) Y))
(synth-fun f ((_arg_0 String)) Bool 
 ( (Start Bool (ntBool)) 
 (ntString String (
	_arg_0
	"" " " "overhead" "some project" "other" "boo" ","
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
(constraint (= (f "some project,other project") true))
(constraint (= (f "some project") true))
(constraint (= (f "overhead") false))
(constraint (= (f "some project, overhead") false))
(constraint (= (f "some project, other, boo") true))
(check-synth)
(define-fun f_1 ((_arg_0 String)) Bool (= (str.indexof _arg_0 "overhead" 0) -1))
