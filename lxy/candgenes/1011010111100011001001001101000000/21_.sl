(set-logic SLIA)
(define-fun succ ((X Int) ) Int (+ 1 X ))
(define-fun pred ((X Int) ) Int (+ -1 X )) 
(define-fun firstidx ((X String) (Y String) ) Int (str.indexof X Y 1 )) 
(define-fun idxplus ((X String) (Y String) (P Int) (Q Int)) Int (+ (str.indexof X Y P) Q)) 
(define-fun idxminus ((X String) (Y String) (P Int) (Q Int)) Int (- (str.indexof X Y P) Q)) 
(define-fun getfirst ((X String)) String (str.substr X 0 1))
(define-fun getprefix ((X String) (Y Int)) String (str.substr X 0 Y))
(define-fun getsuffix ((X String) (Y Int)) String (str.substr X Y (str.len X)))
(define-fun getprefixone ((X String) (Y Int)) String (str.substr X 1 Y))
(define-fun doubleconcat ((X String) (Y String) (Z String)) String (str.++ (str.++ X Y) Z))
(define-fun sesuffix ((X String) (Y String) (P Int) (Q Int) (R Int)) String (str.substr X (+ (str.indexof X Y P) Q) R))
(define-fun lasuffix ((X String) (Y Int) (Z Int)) String (str.substr X (- Y 1) Z))
(define-fun subsconcat ((X String) (Y Int) (P Int) (Q Int)) String (str.++ (str.substr X 0 Y) (str.substr X P Q)))
(define-fun rpself ((X String) (Y String) (N Int) (M Int)) String (str.replace X (str.substr X N M) Y))
(define-fun doublerp ((X String) (Y String) (Z String) (P String) (Q String)) String (str.replace (str.replace X Y Z) P Q ))
(synth-fun f ((_arg_0 String) (_arg_1 String)) String 
 ( (Start String (ntString)) 
 (ntString String (
	_arg_0 _arg_1 "" " " "C0"
	(getfirst ntString)
	(getsuffix ntString ntInt)
	(getprefixone ntString ntInt)
	(doubleconcat ntString ntString ntString)
	(sesuffix ntString ntString ntInt ntInt ntInt)
	(doublerp ntString ntString ntString ntString ntString)
	(str.replace ntString ntString ntString)
	(str.at ntString ntInt)
	(ite ntBool ntString ntString)
	(str.substr ntString ntInt ntInt)
))
 (ntInt Int (
	1 0 -1
	(succ ntInt)
	(firstidx ntString ntString)
	(idxplus ntString ntString ntInt ntInt)
	(- ntInt ntInt)
	(str.len ntString)
	(str.indexof ntString ntString ntInt)
))
 (ntBool Bool (
	true false
	(str.prefixof ntString ntString)
	(str.suffixof ntString ntString)
	(str.contains ntString ntString)
))
))
(constraint (= (f "C0abc" "def") "C0abc"))
(constraint (= (f "aabc" "def") "def"))
(constraint (= (f "C0dd" "qwe") "C0dd"))
(constraint (= (f "dd" "qwe") "qwe"))
(check-synth)
(define-fun f_1 ((_arg_0 String) (_arg_1 String)) String (ite (str.prefixof "C0" _arg_0) _arg_0 _arg_1))
