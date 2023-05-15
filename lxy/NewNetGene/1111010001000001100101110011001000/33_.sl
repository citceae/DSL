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
	name " "
	(getfirst ntString)
	(doubleconcat ntString ntString ntString)
	(str.at ntString ntInt)
	(int.to.str ntInt)
	(ite ntBool ntString ntString)
	(str.substr ntString ntInt ntInt)
))
 (ntInt Int (
	0 1 2 3 4 5
	(succ ntInt)
	(pred ntInt)
	(firstidx ntString ntString)
	(idxplus ntString ntString ntInt ntInt)
	(str.to.int ntString)
	(ite ntBool ntInt ntInt)
))
 (ntBool Bool (
	true false
	(str.prefixof ntString ntString)
	(str.suffixof ntString ntString)
))
))
(constraint (= (f "938-242-504") "938"))
(constraint (= (f "308-916-545") "308"))
(constraint (= (f "623-599-749") "623"))
(constraint (= (f "981-424-843") "981"))
(constraint (= (f "118-980-214") "118"))
(constraint (= (f "244-655-094") "244"))
(check-synth)
(define-fun f_1 ((name String)) String (str.substr name 0 3))
