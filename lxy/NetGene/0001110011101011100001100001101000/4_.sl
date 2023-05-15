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
(synth-fun f ((_arg_0 String)) String 
 ( (Start String (ntString)) 
 (ntString String (
	_arg_0	"" " " "ssp."
	(getfirst ntString)
	(getprefixone ntString ntInt)
	(doubleconcat ntString ntString ntString)
	(sesuffix ntString ntString ntInt ntInt ntInt)
	(subsconcat ntString ntInt ntInt ntInt)
	(doublerp ntString ntString ntString ntString ntString)
	(str.at ntString ntInt)
	(int.to.str ntInt)
	(ite ntBool ntString ntString)
	(str.substr ntString ntInt ntInt)
))
 (ntInt Int (
	1 0 -1
	(idxplus ntString ntString ntInt ntInt)
	(idxminus ntString ntString ntInt ntInt)
	(str.len ntString)
	(str.to.int ntString)
	(ite ntBool ntInt ntInt)
	(str.indexof ntString ntString ntInt)
))
 (ntBool Bool (
	true false
	(str.suffixof ntString ntString)
))
))
(constraint (= (f "Polygonum amphibium") "Polygonum"))
(constraint (= (f "Hippuris vulgaris") "Hippuris"))
(constraint (= (f "Lysimachia vulgaris") "Lysimachia"))
(constraint (= (f "Juncus bulbosus ssp. bulbosus") "Juncus bulbosus"))
(constraint (= (f "Lycopus europaeus ssp. europaeus") "Lycopus europaeus"))
(constraint (= (f "Nymphaea alba") "Nymphaea"))
(check-synth)
(define-fun f_1 ((_arg_0 String)) String (str.substr _arg_0 0 (str.indexof _arg_0 " " (str.len (str.++ "ssp." "ssp.")))))
