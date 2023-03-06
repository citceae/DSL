; https=//stackoverflow.com/questions/38664547/how-to-find-specific-substrings-in-excel-spreadsheet
(set-logic SLIA)
(define-fun succ ((X Int) ) Int (+ 1 X ))
(define-fun pred ((X Int) ) Int (+ -1 X ))
(define-fun firstidx ((X String) (Y String) ) Int (str.indexof X Y 1 ))
(define-fun rpself ((X String) (Y String) (N Int) (M Int)) String (str.replace X (str.substr X N M) Y))
(synth-fun f ((_arg_0 String)) String 
 ( (Start String (ntString)) 
 (ntString String (
	_arg_0
	"" " " "that"
	(str.++ ntString ntString) 
	(str.replace ntString ntString ntString) 
	(str.at ntString ntInt)
	(int.to.str ntInt)
	(ite ntBool ntString ntString)
	(str.substr ntString ntInt ntInt)
)) 
 (ntInt Int (
	
	1 0 -1
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
(constraint (= (f "thatensures") "ensures"))
(constraint (= (f "thatwill") "will"))
(constraint (= (f "thathave") "have"))
(constraint (= (f "knowthat") "know"))
(constraint (= (f "that") "that"))
(constraint (= (f "mouse") "mouse"))
(constraint (= (f "knowthat") "know"))
(check-synth)
(define-fun f_1 ((_arg_0 String)) String (str.replace _arg_0 (str.replace "that" _arg_0 "") ""))
