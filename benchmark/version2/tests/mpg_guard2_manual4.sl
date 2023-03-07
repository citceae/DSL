(set-logic LIA)

(synth-fun eq1 ( (x Int) (y Int) (z Int) ) Int

((Start Int (
        x
        y
        z
        0
        1
        (+ N1 Start)
        (+ N2 Start)
        (+ N3 N1)
        (+ N3 N2)
        (+ N3 N3)
        (+ N3 N4)
        (+ N3 N5)
        (+ N3 N6)
        (+ N7 N4)
        (+ N8 N1)
        (+ N8 N2)
        (+ N8 N3)
        (+ N8 N8)
        (+ N8 N4)
        (+ N8 N5)
        (+ N8 N6)
        (+ N4 Start)
        (+ N5 Start)
        (+ N6 Start)
        (- Start Start)
        (ite StartBool Start Start)
        ))
(StartBool Bool (
        (and StartBool StartBool)
        (or StartBool StartBool)
        (not StartBool)
        (< Start Start)
        (<= Start Start)
        (= Start Start)
        ))
(N1 Int (x))
(N2 Int (y))
(N3 Int (z))
(N4 Int ((+ Start Start)))
(N5 Int ((- Start Start)))
(N6 Int ((ite  StartBool Start Start)))
(N7 Int (0))
(N8 Int (1))
))

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



( constraint ( iteB ( >= (plus3 x y z ) 1 ) 
                    ( = ( eq1 x y z) ( plus2 x  y    ) )
		    ( = ( eq1 x y z) ( plus2 x  (minus y)   ) )
             )
)      


(check-synth)
