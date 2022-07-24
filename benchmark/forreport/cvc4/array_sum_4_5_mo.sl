;; expected program:: (let ((z Int (+ x1 x2))) (ite (> z 5) z (
;;   	    	      let ((z Int (+ x2 x3))) (ite (> z 5) z (
;;   	    	      let ((z Int (+ x3 x4))) (ite (> z 5) z 0))))))


(set-logic LIA)
(synth-fun findSum ((y1 Int) (y2 Int) (y3 Int) (y4 Int)) Int 
           ((Start Int (0 
                        1
                        2
                        3
                        4
                        5 
                        y1 
                        y2 
                        y3 
                        y4
			            Startx
                        (ite BoolExpr Start Start)))
            (ONE Int (1))
            (TWO Int (2))
            (THR Int (3))
            (FOU Int (4))
            (FIV Int (5))
            (Yone Int (y1))
            (Ytwo Int (y2))
            (Ythr Int (y3))
            (Yfou Int (y4))
            (Startx Int (
                        (+ ONE ONE)
                        (+ ONE TWO)
                        (+ ONE THR)
                        (+ ONE FOU)
                        (+ ONE FIV)
                        (+ ONE Yone)
                        (+ ONE Ytwo)
                        (+ ONE Ythr)
                        (+ ONE Yfou)
                        (+ TWO TWO)
                        (+ TWO THR)
                        (+ TWO FOU)
                        (+ TWO FIV)
                        (+ TWO Yone)
                        (+ TWO Ytwo)
                        (+ TWO Ythr)
                        (+ TWO Yfou)
                        (+ THR THR)
                        (+ THR FOU)
                        (+ THR FIV)
                        (+ THR Yone)
                        (+ THR Ytwo)
                        (+ THR Ythr)
                        (+ THR Yfou)
                        (+ FOU FOU)
                        (+ FOU FIV)
                        (+ FOU Yone)
                        (+ FOU Ytwo)
                        (+ FOU Ythr)
                        (+ FOU Yfou)
                        (+ FIV FIV)
                        (+ FIV Yone)
                        (+ FIV Ytwo)
                        (+ FIV Ythr)
                        (+ FIV Yfou)
                        (+ Yone Yone)
                        (+ Yone Ytwo)
                        (+ Yone Ythr)
                        (+ Yone Yfou)
                        (+ Ytwo Ytwo)
                        (+ Ytwo Ythr)
                        (+ Ytwo Yfou)
                        (+ Ythr Ythr)
                        (+ Ythr Yfou)
                        (+ Yfou Yfou)
                        (+ Startx Start)))
            (BoolExpr Bool 
                      ((< Start Start) 
                       (<= Start Start) 
                       (> Start Start) 
                       (>= Start Start)))))
(declare-var x1 Int)
(declare-var x2 Int)
(declare-var x3 Int)
(declare-var x4 Int)

(constraint (=> (> (+ x1 x2) 5) (= (findSum x1 x2 x3 x4) (+ x1 x2))))
(constraint (=> (and (<= (+ x1 x2) 5) (> (+ x2 x3) 5)) (= (findSum x1 x2 x3 x4) (+ x2 x3))))
(constraint (=> (and (and (<= (+ x1 x2) 5) (<= (+ x2 x3) 5)) (> (+ x3 x4) 5)) (= (findSum x1 x2 x3 x4) (+ x3 x4))))
(constraint (=> (and (and (<= (+ x1 x2) 5) (<= (+ x2 x3) 5)) (<= (+ x3 x4) 5)) (= (findSum x1 x2 x3 x4) 0)))


(check-synth)
