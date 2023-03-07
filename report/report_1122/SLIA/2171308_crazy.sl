; https=//stackoverflow.com/questions/2171308/how-to-make-a-sub-string-selection-and-concatenation-in-excel
(set-logic SLIA)
(define-fun succ ((X Int) ) Int (+ 1 X ))
(define-fun pred ((X Int) ) Int (+ -1 X ))
(define-fun firstidx ((X String) (Y String) ) Int (str.indexof X Y 1 ))
(define-fun rpself ((X String) (Y String) (N Int) (M Int)) String (str.replace X (str.substr X N M) Y))
(synth-fun f ((_arg_0 String)) String 
 ( (Start String (ntString)) 
 (ntString String (
	_arg_0
	"" " "
	(rpself ntString ntString ntInt ntInt)
)) 
 (ntInt Int (
	
	1 0 -1
	(succ ntInt)
	(pred ntInt)
	(firstidx ntString ntString)
)) 
 (ntBool Bool (
	
	true false
)) ))
(constraint (= (f "John Doe") "J Doe"))
(constraint (= (f "Mayur Naik") "M Naik"))
(constraint (= (f "Nimit Singh") "N Singh"))
(check-synth)
(define-fun f_1 ((_arg_0 String)) String (str.replace _arg_0 (str.substr _arg_0 1 (str.indexof _arg_0 " " 1)) " "))
