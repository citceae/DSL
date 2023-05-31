(set-logic SLIA)
(define-fun func0  ((A String) (B String) (C String) (D String) ) String (str.++ (str.++ (str.++ C  D ) B ) A ))
(define-fun func1  ((A String) (B String) (C String) (D String) ) String (str.++ (str.++ B  (str.++ C  D )) A ))
(define-fun func2  ((A String) (B String) (C String) (D String) ) String (str.++ A  (str.++ (str.++ C  D ) B )))
(define-fun func3  ((A String) (B String) (C String) (D String) ) String (str.++ A  (str.++ B  (str.++ C  D ))))
(define-fun func4  ((A String) (B String) (C String) (D Int) (E Int) ) String (str.++ (str.++ (str.substr C  D  E ) B ) A ))
(define-fun func5  ((A String) (B String) (C String) (D Int) (E Int) ) String (str.++ (str.++ B  (str.substr C  D  E )) A ))
(define-fun func6  ((A String) (B String) (C String) (D Int) (E Int) ) String (str.++ A  (str.++ (str.substr C  D  E ) B )))
(define-fun func7  ((A String) (B String) (C String) (D Int) (E Int) ) String (str.++ A  (str.++ B  (str.substr C  D  E ))))
(define-fun func8  ((A String) (B String) (C String) (D Int) ) String (str.++ (str.++ (str.substr C  1  D ) B ) A ))
(define-fun func9  ((A String) (B String) (C String) (D Int) ) String (str.++ (str.++ (str.substr C  D  1 ) B ) A ))
(define-fun func10  ((A String) (B String) (C String) (D Int) ) String (str.++ (str.++ B  (str.substr C  1  D )) A ))
(define-fun func11  ((A String) (B String) (C String) (D Int) ) String (str.++ (str.++ B  (str.substr C  D  1 )) A ))
(define-fun func12  ((A String) (B String) (C String) (D Int) ) String (str.++ A  (str.++ (str.substr C  1  D ) B )))
(define-fun func13  ((A String) (B String) (C String) (D Int) ) String (str.++ A  (str.++ (str.substr C  D  1 ) B )))
(define-fun func14  ((A String) (B String) (C String) (D Int) ) String (str.++ A  (str.++ B  (str.substr C  1  D ))))
(define-fun func15  ((A String) (B String) (C String) (D Int) ) String (str.++ A  (str.++ B  (str.substr C  D  1 ))))
(define-fun func16  ((A String) (B String) (C String) ) String (str.++ (str.++ B  C ) A ))
(define-fun func17  ((A String) (B String) (C String) ) String (str.++ A  (str.++ B  C )))
(define-fun func18  ((A String) (B String) (C Int) (D Int) ) String (str.++ (str.substr B  C  D ) A ))
(define-fun func19  ((A String) (B String) (C Int) (D Int) ) String (str.++ A  (str.substr B  C  D )))
(define-fun func20  ((A String) (B Int) (C Int) (D String) (E Int) (F Int) ) String (str.++ (str.substr A  B  C ) (str.substr D  E  F )))
(define-fun func21  ((A String) (B Int) (C Int) (A String) (D Int) (E Int) ) String (str.++ (str.substr A  B  C ) (str.substr A  D  E )))
(define-fun func22  ((A String) (B String) (C Int) ) String (str.++ (str.substr B  0  C ) A ))
(define-fun func23  ((A String) (B String) (C Int) ) String (str.++ (str.substr B  C  0 ) A ))
(define-fun func24  ((A String) (B String) (C Int) ) String (str.++ A  (str.substr B  0  C )))
(define-fun func25  ((A String) (B String) (C Int) ) String (str.++ A  (str.substr B  C  0 )))
(define-fun func26  ((A String) (B String) (C Int) ) String (str.++ (str.substr B  1  C ) A ))
(define-fun func27  ((A String) (B String) (C Int) ) String (str.++ (str.substr B  C  1 ) A ))
(define-fun func28  ((A String) (B String) (C Int) ) String (str.++ A  (str.substr B  1  C )))
(define-fun func29  ((A String) (B String) (C Int) ) String (str.++ A  (str.substr B  C  1 )))
(define-fun func30  ((A String) (B String) (C Int) (D Int) (E Int) ) String (str.++ (str.substr B  (+ D  E ) C ) A ))
(define-fun func31  ((A String) (B String) (C Int) (D Int) (E Int) ) String (str.++ (str.substr B  C  (+ D  E )) A ))
(define-fun func32  ((A String) (B String) (C Int) (D Int) (E Int) ) String (str.++ A  (str.substr B  (+ D  E ) C )))
(define-fun func33  ((A String) (B String) (C Int) (D Int) (E Int) ) String (str.++ A  (str.substr B  C  (+ D  E ))))
(define-fun func34  ((A String) (B String) (C Int) (D Int) (E Int) ) String (str.++ (str.substr B  (- D  E ) C ) A ))
(define-fun func35  ((A String) (B String) (C Int) (D Int) (E Int) ) String (str.++ (str.substr B  C  (- D  E )) A ))
(define-fun func36  ((A String) (B String) (C Int) (D Int) (E Int) ) String (str.++ A  (str.substr B  (- D  E ) C )))
(define-fun func37  ((A String) (B String) (C Int) (D Int) (E Int) ) String (str.++ A  (str.substr B  C  (- D  E ))))
(define-fun func38  ((A String) (B String) (C Int) ) String (str.++ (str.substr B  2  C ) A ))
(define-fun func39  ((A String) (B String) (C Int) ) String (str.++ (str.substr B  C  2 ) A ))
(define-fun func40  ((A String) (B String) (C Int) ) String (str.++ A  (str.substr B  2  C )))
(define-fun func41  ((A String) (B String) (C Int) ) String (str.++ A  (str.substr B  C  2 )))
(define-fun func42  ((A String) (B Int) ) String (str.substr A  0  B ))
(define-fun func43  ((A String) (B Int) ) String (str.substr A  B  0 ))
(define-fun func44  ((A String) (B Int) (C Int) (D Int) ) String (str.substr A  (- C  D ) B ))
(define-fun func45  ((A String) (B Int) (C Int) (D Int) ) String (str.substr A  B  (- C  D )))
(define-fun func46  ((A String) (B Int) ) String (str.substr A  1  B ))
(define-fun func47  ((A String) (B Int) ) String (str.substr A  B  1 ))
(define-fun func48  ((A String) (B Int) (A String) ) String (str.substr A  (str.len A ) B ))
(define-fun func49  ((A String) (B Int) (A String) ) String (str.substr A  B  (str.len A )))
(define-fun func50  ((A String) (B Int) (C Int) (D Int) ) String (str.substr A  (+ C  D ) B ))
(define-fun func51  ((A String) (B Int) (C Int) (D Int) ) String (str.substr A  B  (+ C  D )))
(define-fun func52  ((A String) (B Int) (C Int) ) String (str.substr A  (+ 1  C ) B ))
(define-fun func53  ((A String) (B Int) (C Int) ) String (str.substr A  (+ C  1 ) B ))
(define-fun func54  ((A String) (B Int) (C Int) ) String (str.substr A  B  (+ 1  C )))
(define-fun func55  ((A String) (B Int) (C Int) ) String (str.substr A  B  (+ C  1 )))
(define-fun func56  ((A String) (B Int) (C Int) (A String) (D String) (E Int) ) String (str.substr A  (+ (str.indexof A  D  E ) C ) B ))
(define-fun func57  ((A String) (B Int) (C Int) (D String) (A String) (E Int) ) String (str.substr A  (+ (str.indexof D  A  E ) C ) B ))
(define-fun func58  ((A String) (B Int) (C Int) (A String) (D String) (E Int) ) String (str.substr A  (+ C  (str.indexof A  D  E )) B ))
(define-fun func59  ((A String) (B Int) (C Int) (D String) (A String) (E Int) ) String (str.substr A  (+ C  (str.indexof D  A  E )) B ))
(define-fun func60  ((A String) (B Int) (C Int) (A String) (D String) (E Int) ) String (str.substr A  B  (+ (str.indexof A  D  E ) C )))
(define-fun func61  ((A String) (B Int) (C Int) (D String) (A String) (E Int) ) String (str.substr A  B  (+ (str.indexof D  A  E ) C )))
(define-fun func62  ((A String) (B Int) (C Int) (A String) (D String) (E Int) ) String (str.substr A  B  (+ C  (str.indexof A  D  E ))))
(define-fun func63  ((A String) (B Int) (C Int) (D String) (A String) (E Int) ) String (str.substr A  B  (+ C  (str.indexof D  A  E ))))
(define-fun func64  ((A String) (B Int) (C Int) (D String) (E String) (F Int) ) String (str.substr A  (+ (str.indexof D  E  F ) C ) B ))
(define-fun func65  ((A String) (B Int) (C Int) (D String) (E String) (F Int) ) String (str.substr A  (+ C  (str.indexof D  E  F )) B ))
(define-fun func66  ((A String) (B Int) (C Int) (D String) (E String) (F Int) ) String (str.substr A  B  (+ (str.indexof D  E  F ) C )))
(define-fun func67  ((A String) (B Int) (C Int) (D String) (E String) (F Int) ) String (str.substr A  B  (+ C  (str.indexof D  E  F ))))
(define-fun func68  ((A String) (B Int) (C Int) ) String (str.substr A  (- 1  C ) B ))
(define-fun func69  ((A String) (B Int) (C Int) ) String (str.substr A  (- C  1 ) B ))
(define-fun func70  ((A String) (B Int) (C Int) ) String (str.substr A  B  (- 1  C )))
(define-fun func71  ((A String) (B Int) (C Int) ) String (str.substr A  B  (- C  1 )))
(define-fun func72  ((A String) (B Int) (C String) ) String (str.substr A  (str.len C ) B ))
(define-fun func73  ((A String) (B Int) (C String) ) String (str.substr A  B  (str.len C )))
(define-fun func74  ((A String) (B Int) ) String (str.substr A  2  B ))
(define-fun func75  ((A String) (B Int) ) String (str.substr A  B  2 ))
(define-fun func76  ((A Int) ) Int (- 1  A ))
(define-fun func77  ((A Int) ) Int (- A  1 ))
(define-fun func78  ((A Int) ) Int (- -1  A ))
(define-fun func79  ((A Int) ) Int (- A  -1 ))
(define-fun func80  ((A Int) ) Int (+ 1  A ))
(define-fun func81  ((A Int) ) Int (+ A  1 ))
(define-fun func82  ((A Int) (B String) (C String) (D Int) ) Int (+ (str.indexof B  C  D ) A ))
(define-fun func83  ((A Int) (B String) (C String) (D Int) ) Int (+ A  (str.indexof B  C  D )))
(synth-fun f ((firstname String) (lastname String)) String
( (Start String (ntString))
 (ntString String (
	firstname lastname " " "." "," 
	(func1 ntString ntString ntString ntString)
	(func2 ntString ntString ntString ntString)
	(func3 ntString ntString ntString ntString)
	(func4 ntString ntString ntString ntInt ntInt)
	(func6 ntString ntString ntString ntInt ntInt)
	(func9 ntString ntString ntString ntInt ntInt)
	(func11 ntString ntString ntString ntInt ntInt)
	(func13 ntString ntString ntString ntInt ntInt)
	(func14 ntString ntString ntString ntInt ntInt)
	(func16 ntString ntString ntString)
	(func17 ntString ntString ntString)
	(func19 ntString ntString ntInt ntInt)
	(func20 ntString ntInt ntInt ntString ntInt ntInt)
	(func21 ntString ntInt ntInt ntString ntInt ntInt)
	(func23 ntString ntString ntInt ntInt)
	(func24 ntString ntString ntInt ntInt)
	(func26 ntString ntString ntInt ntInt)
	(func27 ntString ntString ntInt ntInt)
	(func28 ntString ntString ntInt ntInt)
	(func29 ntString ntString ntInt ntInt)
	(func33 ntString ntString ntInt ntInt ntInt)
	(func34 ntString ntString ntInt ntInt ntInt)
	(func35 ntString ntString ntInt ntInt ntInt)
	(func42 ntString ntInt ntInt)
	(func44 ntString ntInt ntInt ntInt)
	(func46 ntString ntInt ntInt)
	(func48 ntString ntInt ntString)
	(func49 ntString ntInt ntString)
	(func51 ntString ntInt ntInt ntInt)
	(func52 ntString ntInt ntInt ntInt)
	(func53 ntString ntInt ntInt ntInt)
	(func54 ntString ntInt ntInt ntInt)
	(func55 ntString ntInt ntInt ntInt)
	(func58 ntString ntInt ntInt ntString ntString ntInt)
	(func60 ntString ntInt ntInt ntString ntString ntInt)
	(func62 ntString ntInt ntInt ntString ntString ntInt)
	(func64 ntString ntInt ntInt ntString ntString ntInt)
	(func67 ntString ntInt ntInt ntString ntString ntInt)
	(func68 ntString ntInt ntInt ntInt)
	(func69 ntString ntInt ntInt ntInt)
	(func70 ntString ntInt ntInt ntInt)
	(func72 ntString ntInt ntString)
	(func75 ntString ntInt ntInt)
	(str.++ ntString ntString)
	(str.replace ntString ntString ntString)
	(int.to.str ntInt)
	(ite ntBool ntString ntString)
))
 (ntInt Int (
	0 1 2 
	(func77 ntInt ntInt)
	(func78 ntInt ntInt)
	(func79 ntInt ntInt)
	(func80 ntInt ntInt)
	(func81 ntInt ntInt)
	(func82 ntInt ntString ntString ntInt)
	(- ntInt ntInt)
	(str.len ntString)
	(str.to.int ntString)
	(str.indexof ntString ntString ntInt)
))
 (ntBool Bool (
	true false
	(= ntInt ntInt)
	(str.prefixof ntString ntString)
	(str.suffixof ntString ntString)
	(str.contains ntString ntString)
))
))
(constraint (= (f "Launa" "Withers") "Withers, L."))
(constraint (= (f "Lakenya" "Edison") "Edison, L."))
(constraint (= (f "Brendan" "Hage") "Hage, B."))
(constraint (= (f "Bradford" "Lango") "Lango, B."))
(constraint (= (f "Rudolf" "Akiyama") "Akiyama, R."))
(check-synth)
