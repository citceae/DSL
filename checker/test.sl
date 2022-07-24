(set-logic LIA)

(synth-fun eq1 ( (x Int) (y Int) (z Int) ) Int
    ((Start Int (x
                 y
     		 z
                 0
                 1
                 (+ Start Start)
                 (- Start Start)
                 (ite StartBool Start Start)))
     (StartBool Bool ((and StartBool StartBool)
                      (or  StartBool StartBool)
                      (not StartBool)
                      (<  Start Start)
                      (=   Start Start)
                      (<=  Start Start)))))
