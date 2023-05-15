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
(synth-fun f ((col1 String) (col2 String)) String
 ( (Start String (ntString))
 (ntString String (
	col1 col2 " " "," "USA" "PA" "CT" "CA" "MD" "NY"
	(getprefix ntString ntInt)
	(getsuffix ntString ntInt)
	(getprefixone ntString ntInt)
	(subsconcat ntString ntInt ntInt ntInt)
	(rpself ntString ntString ntInt ntInt)
	(doublerp ntString ntString ntString ntString ntString)
	(int.to.str ntInt)
	(ite ntBool ntString ntString)
))
 (ntInt Int (
	0 1 2
	(succ ntInt)
	(pred ntInt)
	(firstidx ntString ntString)
	(+ ntInt ntInt)
	(- ntInt ntInt)
	(str.len ntString)
	(str.to.int ntString)
	(str.indexof ntString ntString ntInt)
))
 (ntBool Bool (
	true false
	(= ntInt ntInt)
	(str.prefixof ntString ntString)
	(str.contains ntString ntString)
))
))
(constraint (= (f "University of Pennsylvania" "Phialdelphia, PA, USA")
"Phialdelphia, PA, USA"))
(constraint (= (f "UCLA" "Los Angeles, CA")
"Los Angeles, CA, USA"))
(constraint (= (f "Cornell University" "Ithaca, New York, USA")
"Ithaca, New York, USA"))
(constraint (= (f "Penn" "Philadelphia, PA, USA")
"Philadelphia, PA, USA"))
(constraint (= (f "University of Maryland College Park" "College Park, MD")
"College Park, MD, USA"))
(constraint (= (f "University of Michigan" "Ann Arbor, MI, USA")
"Ann Arbor, MI, USA"))
(check-synth)(define-fun f_1 ((col1 String) (col2 String)) String (ite (str.suffixof "USA" col2) col2 (str.++ col2 (str.++ (str.++ "," " ") "USA"))))
