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
(synth-fun f ((name String)) String
 ( (Start String (ntString))
 (ntString String (
	name " " "+" "-" "."
	(getfirst ntString)
	(getsuffix ntString ntInt)
	(getprefixone ntString ntInt)
	(doubleconcat ntString ntString ntString)
	(rpself ntString ntString ntInt ntInt)
	(str.replace ntString ntString ntString)
	(int.to.str ntInt)
	(ite ntBool ntString ntString)
))
 (ntInt Int (
	0 1 2 3 4 5
	(succ ntInt)
	(pred ntInt)
	(idxplus ntString ntString ntInt ntInt)
	(idxminus ntString ntString ntInt ntInt)
	(+ ntInt ntInt)
	(- ntInt ntInt)
	(ite ntBool ntInt ntInt)
))
 (ntBool Bool (
	true false
	(= ntInt ntInt)
	(str.suffixof ntString ntString)
))
))
(constraint (= (f "+106 769-858-438") "769"))
(constraint (= (f "+83 973-757-831") "973"))
(constraint (= (f "+62 647-787-775") "647"))
(constraint (= (f "+172 027-507-632") "027"))
(constraint (= (f "+72 001-050-856") "001"))
(constraint (= (f "+95 310-537-401") "310"))
(constraint (= (f "+6 775-969-238") "775"))
(check-synth)
