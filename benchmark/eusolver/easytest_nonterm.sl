(set-logic LIA)

(synth-fun eq1 ( (x Int) (y Int) (z Int) ) Int
    ((Start Int (x
                 y
                 z
                 0
                 1
                 Nonterm1
                 Nonterm2
                 Nonterm3
                 Nonterm4
                 Nonterm5
                 (+ Nonterm6 Start)
                 (+ Nonterm7 Start)
                 (+ Nonterm8 Start)
                 Nonterm9
                 Nonterm10
                 Nonterm11
                 Nonterm12
                 Nonterm13
                 (- Nonterm7 Start)
                 (- Nonterm8 Start)
                 (ite Nonterm14 Start Start)
                 (ite Nonterm15 Start Start)
                 (ite Nonterm16 Start Start)
                 (ite Nonterm17 Start Start)
                 (ite Nonterm18 Start Start)
                 ))
     (Nonterm1 Int ((+ X Start)))
     (Nonterm2 Int ((+ Y Start)))
     (Nonterm3 Int ((+ Z Start)))
     (Nonterm4 Int ((+ 0 Start)))
     (Nonterm5 Int ((+ 1 Start)))
     (Nonterm6 Int ((+ Start Start)))
     (Nonterm7 Int ((- Start Start)))
     (Nonterm8 Int ((ite StartBool Start Start)))
     (Nonterm9 Int ((- X Start)))
     (Nonterm10 Int ((- Y Start)))
     (Nonterm11 Int ((- Z Start)))
     (Nonterm12 Int ((- 0 Start)))
     (Nonterm13 Int ((- 1 Start)))
     (Nonterm14 Bool ((and StartBool StartBool)))
     (Nonterm15 Bool ((or StartBool StartBool)))
     (Nonterm16 Bool ((not StartBool)))
     (Nonterm17 Bool ((< Start Start)))
     (Nonterm18 Bool ((= Start Start)))
     (X Int (x))
     (Y Int (y))
     (Z Int (z))    
     (StartBool Bool ((and StartBool StartBool)
                      (or  StartBool StartBool)
                      (not StartBool)
                      (<  Start Start)
                      (=   Start Start)
                      (<=  Start Start)))))

(define-fun iteB (( b1 Bool ) (b2 Bool ) (b3 Bool )) Bool ( or ( and b1 b2 ) ( and (not b1 ) b3 ) ) )
(define-fun plus2 ((b1 Int) (b2 Int)) Int ( + b1 b2))
(define-fun plus3 ((b1 Int) (b2 Int) (b3 Int)) Int ( +  ( + b1 b2) b3))
(define-fun plus4 ((b1 Int) (b2 Int) (b3 Int) (b4 Int)) Int ( +  ( plus3  b1 b2 b3) b4))
(define-fun plus5 ((b1 Int) (b2 Int) (b3 Int) (b4 Int) (b5 Int)) Int (+  ( plus4 b1 b2 b3 b4) b5))
(define-fun plus6 ((b1 Int) (b2 Int) (b3 Int) (b4 Int) (b5 Int) (b6 Int) ) Int (+  ( plus5 b1 b2 b3 b4  b5) b6  ))
(define-fun plus7 ((b1 Int) (b2 Int) (b3 Int) (b4 Int) (b5 Int) (b6 Int) (b7 Int)) Int (+  ( plus6 b1 b2 b3 b4  b5 b6 ) b7  ))
(define-fun plus8 ((b1 Int) (b2 Int) (b3 Int) (b4 Int) (b5 Int) (b6 Int) (b7 Int) (be Int)) Int (+  ( plus7 b1 b2 b3 b4  b5 b6 b7) be  ))
(define-fun plus9 ((b1 Int) (b2 Int) (b3 Int) (b4 Int) (b5 Int) (b6 Int) (b7 Int) (be Int) (bn Int)) Int (+  ( plus8 b1 b2 b3 b4  b5 b6 b7 be) bn  ))

(define-fun or3 ((b1 Bool) (b2 Bool) (b3 Bool)) Bool ( or ( or b1 b2) b3))
(define-fun one-times  ((b1 Int )) Int b1)
(define-fun two-times  ((b1 Int )) Int ( plus2 b1 b1))
(define-fun three-times  ((b1 Int )) Int ( plus3 b1 b1 b1))
(define-fun five-times  ((b1 Int )) Int ( plus5 b1 b1 b1 b1 b1 ))
(define-fun seven-times ((b1 Int )) Int ( plus7 b1 b1 b1 b1 b1 b1 b1 ))
(define-fun nine-times  ((b1 Int )) Int ( plus9 b1 b1 b1 b1 b1 b1 b1 b1 b1))
(define-fun ten-times  ((b1 Int )) Int ( plus9 b1 b1 b1 b1 b1 b1 b1 b1 ( plus2 b1 b1 )))
(define-fun minus ((b1 Int)) Int ( - 0  b1 ))

(declare-var x Int ) 
(declare-var y Int ) 
(declare-var z Int ) 

( constraint ( 
                     = ( eq1 x y z) ( plus3 x y z) 
		    
             )
)      


(check-synth)

