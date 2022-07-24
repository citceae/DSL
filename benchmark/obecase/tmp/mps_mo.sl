(set-logic LIA)

(synth-fun combine ((lmps Int) (rmps Int) (lsum Int) (rsum Int)) Int
    ((Start Int (lmps
                 rmps
                 lsum
                 rsum
                 0
                 1
                 Startx
                 (- Start Start)
                 (ite StartBool Start Start)))
     (LMPS Int (lmps))
     (RMPS Int (rmps))
     (LSUM Int (lsum))
     (RSUM Int (rsum))
     (ONE Int (1))
     (Startx Int (
                  (+ LMPS LMPS)
                  (+ LMPS RMPS)
                  (+ LMPS LSUM)
                  (+ LMPS RSUM)
                  (+ LMPS ONE)
                  (+ RMPS RMPS)
                  (+ RMPS LSUM)
                  (+ RMPS RSUM)
                  (+ RMPS ONE)
                  (+ LSUM LSUM)
                  (+ LSUM RSUM)
                  (+ LSUM ONE)
                  (+ RSUM RSUM)
                  (+ RSUM ONE)
                  (+ ONE ONE)
                  (+ Startx Start)))
     (StartBool Bool ((and StartBool StartBool)
                      (or  StartBool StartBool)
                      (not StartBool)
                      (<  Start Start)
                      (=   Start Start)
                      (<=  Start Start)))))


(define-fun max2 ((x Int) (y Int)) Int 
  (ite (>= x y) x y)
)
(define-fun ans (( lmps Int ) (rmps Int ) (lsum Int ) (rsum Int)) Int 
  (max2 lmps (+ lsum rmps)))


(declare-var a Int)
(declare-var b Int)
(declare-var c Int)
(declare-var d Int)
(constraint (= (ans a b c d) (combine a b c d)))

(check-synth)

