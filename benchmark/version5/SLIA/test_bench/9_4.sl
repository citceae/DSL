; https=//stackoverflow.com/questions/38871714/excel-vba-how-to-remove-substrings-from-a-cell
(set-logic SLIA)
(define-fun succ ((X Int) ) Int (+ 1 X ))
(define-fun pred ((X Int) ) Int (+ -1 X ))
(define-fun firstidx ((X String) (Y String) ) Int (str.indexof X Y 1 ))
(define-fun rpself ((X String) (Y String) (N Int) (M Int)) String (str.replace X (str.substr X N M) Y))
(synth-fun f ((name String)) String
    ((Start String (ntString))
     (ntString String (name " "
	(rpself ntString ntString ntInt ntInt)
	(str.replace ntString ntString ntString) 
	(str.at ntString ntInt)
	(ite ntBool ntString ntString)
	(str.++ ntString ntString) 
	(str.substr ntString ntInt ntInt)
)) 
      (ntInt Int (0 1 2 3 4 5
	(succ ntInt)
	(pred ntInt)
	(firstidx ntString ntString)
	(str.len ntString)
	(str.indexof ntString ntString ntInt)
)) 
 (ntBool Bool (
	
	true false
	(str.prefixof ntString ntString)
	(str.suffixof ntString ntString)
	(str.contains ntString ntString)
)) ))
(constraint (= (f "Ducati100") "Ducati"))
(constraint (= (f "Honda125") "Honda"))
(constraint (= (f "Ducati250") "Ducati"))
(constraint (= (f "Honda250") "Honda"))
(constraint (= (f "Honda550") "Honda"))
(constraint (= (f "Ducati125") "Ducati"))

(check-synth)
(define-fun f_1 ((name String)) String (str.substr name 0 (- (str.len name) 3)))

