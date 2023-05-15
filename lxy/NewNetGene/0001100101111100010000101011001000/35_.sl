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
(synth-fun f ((_arg_0 String) (_arg_1 Int)) String 
 ( (Start String (ntString)) 
 (ntString String (
	_arg_0	"" " "
	(getsuffix ntString ntInt)
	(doubleconcat ntString ntString ntString)
	(sesuffix ntString ntString ntInt ntInt ntInt)
	(lasuffix ntString ntInt ntInt)
	(subsconcat ntString ntInt ntInt ntInt)
	(rpself ntString ntString ntInt ntInt)
	(str.++ ntString ntString)
	(str.replace ntString ntString ntString)
	(int.to.str ntInt)
	(ite ntBool ntString ntString)
	(str.substr ntString ntInt ntInt)
))
 (ntInt Int (
	_arg_1	1 0 -1
	(idxplus ntString ntString ntInt ntInt)
	(idxminus ntString ntString ntInt ntInt)
	(+ ntInt ntInt)
	(str.len ntString)
	(ite ntBool ntInt ntInt)
))
 (ntBool Bool (
	true false
	(str.prefixof ntString ntString)
	(str.suffixof ntString ntString)
))
))
(constraint (= (f "1234" 1) "234"))
(constraint (= (f "**512A" 2) "512A"))
(constraint (= (f "343DMX" 3) "DMX"))
(check-synth)
(define-fun f_1 ((_arg_0 String) (_arg_1 Int)) String (str.substr _arg_0 _arg_1 (str.len _arg_0)))
