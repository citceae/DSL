; https=//stackoverflow.com/questions/38871714/excel-vba-how-to-remove-substrings-from-a-cell
(set-logic SLIA)
(define-fun succ ((X Int) ) Int (+ 1 X ))
(define-fun pred ((X Int) ) Int (+ -1 X ))
(define-fun firstidx ((X String) (Y String) ) Int (str.indexof X Y 1 ))
(define-fun rpself ((X String) (Y String) (N Int) (M Int)) String (str.replace X (str.substr X N M) Y))
(synth-fun f ((_arg_0 String)) String 
 ( (Start String (ntString)) 
 (ntString String (
	_arg_0
	"" " " "1" "2" "3" "4" "apple" "bananas" "strawberries" "oranges" ","
	(rpself ntString ntString ntInt ntInt)
	(str.replace ntString ntString ntString) 
	(str.at ntString ntInt)
	(ite ntBool ntString ntString)
)) 
 (ntInt Int (
	
	1 0 -1
	(succ ntInt)
	(pred ntInt)
	(firstidx ntString ntString)
	(str.len ntString)
)) 
 (ntBool Bool (
	
	true false
)) ))
(constraint (= (f "one, 1") "one apple"))
(constraint (= (f "two, 2") "two bananas"))
(constraint (= (f "three, 3") "three strawberries"))
(constraint (= (f "four, 4") "four oranges"))
(check-synth)