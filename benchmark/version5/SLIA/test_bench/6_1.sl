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
	"" " " ">"
	(rpself ntString ntString ntInt ntInt)
)) 
 (ntInt Int (
	
	1 0 -1
	(succ ntInt)
	(firstidx ntString ntString)
)) 
 (ntBool Bool (
	
	true false
)) ))
(constraint (= (f "USD.EUR<IDEALPRO,CASH,EUR>") "EUR"))
(constraint (= (f "USD.EUR<IDEALPRO,CASH,USD>") "USD"))
(constraint (= (f "KOR.JPN<IDEALPRO,CASH,WON>") "WON"))
(constraint (= (f "KOR.JPN<IDEALPRO,CASH,YEN>") "YEN"))
(check-synth)