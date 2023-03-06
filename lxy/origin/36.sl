(set-logic SLIA)
(define-fun succ ((X Int) ) Int (+ 1 X ))
(define-fun pred ((X Int) ) Int (+ -1 X ))
(define-fun firstidx ((X String) (Y String) ) Int (str.indexof X Y 1 ))
(define-fun rpself ((X String) (Y String) (N Int) (M Int)) String (str.replace X (str.substr X N M) Y))
(synth-fun f ((firstname String) (lastname String)) String
    ((Start String (ntString))
     (ntString String (firstname lastname " "
(str.++ ntString ntString)
(str.replace ntString ntString ntString)
(str.at ntString ntInt)
(int.to.str ntInt)
(ite ntBool ntString ntString)
(str.substr ntString ntInt ntInt)
))
      (ntInt Int (0 1 2
(+ ntInt ntInt)
(- ntInt ntInt)
(str.len ntString)
(str.to.int ntString)
(str.indexof ntString ntString ntInt)
))
(ntBool Bool (true false
(= ntInt ntInt)
(str.prefixof ntString ntString)
(str.suffixof ntString ntString)
(str.contains ntString ntString)
))
))
(constraint (= (f "Launa" "Withers") "Withers Launa"))
(constraint (= (f "Lakenya" "Edison") "Edison Lakenya"))
(constraint (= (f "Brendan" "Hage") "Hage Brendan"))
(constraint (= (f "Bradford" "Lango") "Lango Bradford"))
(constraint (= (f "Rudolf" "Akiyama") "Akiyama Rudolf"))
(constraint (= (f "Lara" "Constable") "Constable Lara"))

(check-synth)
(define-fun f_1 ((firstname String) (lastname String)) String (str.++ (str.++ lastname " ") firstname))
