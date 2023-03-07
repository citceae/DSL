; if x==y then f(x,y)=0
; else if x>y then f(x,y)=1
; else f(x,y)=-1

(set-logic LIA)

(synth-fun f ((x Int) (y Int)) Int
   ((Start Int (
        x
        y
        0
        1
        2
        -1
        -2
        (+ N1 N1)
        (+ N1 N2)
        (+ N1 N3)
        (+ N1 N5)
        (+ N1 N6)
        (+ N2 Start)
        (+ N8 N1)
        (+ N8 N2)
        (+ N8 N8)
        (+ N8 N3)
        (+ N8 N5)
        (+ N8 N6)
        (+ N3 Start)
        (+ N9 N1)
        (+ N9 N2)
        (+ N9 N8)
        (+ N9 N3)
        (+ N9 N9)
        (+ N9 N10)
        (+ N9 N5)
        (+ N9 N6)
        (+ N10 N1)
        (+ N10 N2)
        (+ N10 N8)
        (+ N10 N3)
        (+ N10 N10)
        (+ N10 N5)
        (+ N10 N6)
        (+ N5 Start)
        (+ N6 Start)
        N5
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
(N3 Int (2))
(N4 Int ((+ Start Start)))
(N5 Int ((- Start Start)))
(N6 Int ((ite  StartBool Start Start)))
(N7 Int (0))
(N8 Int (1))
(N9 Int (-1))
(N10 Int (-2))
))

(declare-var x Int)
(declare-var y Int)

(constraint (or (and (= x y) (= (f x y) 0))
            (or (and (> x y) (= (f x y) 1))
                (and (< x y) (= (f x y) -1)))))

(check-synth)

