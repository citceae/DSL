(set-logic SLIA)
(define-fun str.pre ((x String) (i Int)) String (str.substr x 0 i))
(define-fun str.suf ((x String) (i Int)) String (str.substr x (- (str.len x) i) i))
(synth-fun f ((_arg_0 String) (_arg_1 String)) String 
 ( (Start String (ntString)) 
 (ntString String (
	_arg_0 _arg_1
	"" " "
	(str.++ ntString ntString) 
	(str.replace ntString ntString ntString) 
	(str.at ntString ntInt)
	(int.to.str ntInt)
	(ite ntBool ntString ntString)
	(str.substr ntString ntInt ntInt)
    (str.pre ntString ntInt)
    (str.suf ntString ntInt)
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
(constraint (= (f "John" "Doe") "hnDo"))
(constraint (= (f "Mayur" "Naik") "urNa"))
(constraint (= (f "Nimit" "Singh") "itSi"))
(check-synth)
