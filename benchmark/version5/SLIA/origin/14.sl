; https=//stackoverflow.com/questions/19558979/excel-how-to-extract-a-substring-by-only-knowing-the-strings-location
(set-logic SLIA)
(define-fun succ ((X Int) ) Int (+ 1 X ))
(define-fun pred ((X Int) ) Int (+ -1 X ))
(define-fun firstidx ((X String) (Y String) ) Int (str.indexof X Y 1 ))
(define-fun rpself ((X String) (Y String) (N Int) (M Int)) String (str.replace X (str.substr X N M) Y))
(synth-fun f ((_arg_0 String) (_arg_1 Int)) String 
 ( (Start String (ntString)) 
 (ntString String (
	_arg_0
	"" " "
	(str.++ ntString ntString) 
	(str.replace ntString ntString ntString) 
	(str.at ntString ntInt)
	(int.to.str ntInt)
	(ite ntBool ntString ntString)
	(str.substr ntString ntInt ntInt)
)) 
 (ntInt Int (
	_arg_1
	1 0 -1 0 1 2 3 4 5
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
(constraint (= (f "spreadsheet" 1) "s"))
(constraint (= (f "spreadsheet" 2) "p"))
(constraint (= (f "spreadsheet" 3) "r"))
(constraint (= (f "spreadsheet" 4) "e"))
(constraint (= (f "spreadsheet" 5) "a"))
(check-synth)
(define-fun f_1 ((_arg_0 String) (_arg_1 Int)) String (str.at (str.++ " " _arg_0) _arg_1))
