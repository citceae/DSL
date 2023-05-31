; https=//stackoverflow.com/questions/38871714/excel-vba-how-to-remove-substrings-from-a-cell
(set-logic SLIA)
(define-fun succ ((X Int) ) Int (+ 1 X ))
(define-fun pred ((X Int) ) Int (+ -1 X ))
(define-fun firstidx ((X String) (Y String) ) Int (str.indexof X Y 1 ))
(define-fun rpself ((X String) (Y String) (N Int) (M Int)) String (str.replace X (str.substr X N M ) Y))
(define-fun getprefix ((X String) (Y Int)) String (str.substr X 0 Y))
(define-fun getsuffix ((X String) (Y Int)) String (str.substr X Y (str.len X)))
(define-fun doublerp ((X String) (Y String) (Z String) (P String) (Q String)) String (str.replace (str.replace X Y Z) P Q ))
(define-fun func0  ((A String) (B String) (C String) ) String (str.++ (str.++ B  C ) A ))
(synth-fun f ((_arg_0 String)) String 
 ( (Start String (ntString)) 
 (ntString String (
	_arg_0 "" " " "/n"
	(func0 ntString ntString ntString)
	(rpself ntString ntString ntInt ntInt)
	(getprefix ntString ntInt)
	(getsuffix ntString ntInt)
	(doublerp ntString ntString ntString ntString ntString) 
	(str.replace ntString ntString ntString) 
	(str.at ntString ntInt)
	(ite ntBool ntString ntString)
	(str.++ ntString ntString) 
	(str.substr ntString ntInt ntInt)
	(int.to.str ntInt)
)) 
 (ntInt Int (
	1 0 -1
	(succ ntInt)
	(pred ntInt)
	(firstidx ntString ntString)
	(str.len ntString)
	(str.indexof ntString ntString ntInt)
	(+ ntInt ntInt)
	(- ntInt ntInt)
	(str.to.int ntString)
	(ite ntBool ntInt ntInt)
)) 
 (ntBool Bool (
	true false
	(= ntInt ntInt)
	(str.prefixof ntString ntString)
	(str.suffixof ntString ntString)
	(str.contains ntString ntString)
)) ))
(constraint (= (f "T") "T1"))
(constraint (= (f "a") "a"))
(check-synth)
