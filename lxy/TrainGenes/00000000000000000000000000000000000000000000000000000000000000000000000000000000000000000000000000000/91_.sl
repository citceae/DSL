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
	firstname lastname " " "." 
	(str.++ ntString ntString)
	(str.replace ntString ntString ntString)
	(str.at ntString ntInt)
	(int.to.str ntInt)
	(ite ntBool ntString ntString)
	(str.substr ntString ntInt ntInt)
))
 (ntInt Int (
	0 1 2 
	(+ ntInt ntInt)
	(- ntInt ntInt)
	(str.len ntString)
	(str.to.int ntString)
	(ite ntBool ntInt ntInt)
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
(constraint (= (f "Nancy" "FreeHafer") "Nancy F."))
(constraint (= (f "Andrew" "Cencici") "Andrew C."))
(constraint (= (f "Jan" "Kotas") "Jan K."))
(constraint (= (f "Mariya" "Sergienko") "Mariya S."))
(constraint (= (f "Launa" "Withers") "Launa W."))
(constraint (= (f "Lakenya" "Edison") "Lakenya E."))
(constraint (= (f "Brendan" "Hage") "Brendan H."))
(constraint (= (f "Bradford" "Lango") "Bradford L."))
(constraint (= (f "Rudolf" "Akiyama") "Rudolf A."))
(constraint (= (f "Lara" "Constable") "Lara C."))
(constraint (= (f "Madelaine" "Ghoston") "Madelaine G."))
(constraint (= (f "Salley" "Hornak") "Salley H."))
(constraint (= (f "Micha" "Junkin") "Micha J."))
(constraint (= (f "Teddy" "Bobo") "Teddy B."))
(constraint (= (f "Coralee" "Scalia") "Coralee S."))
(constraint (= (f "Jeff" "Quashie") "Jeff Q."))
(constraint (= (f "Vena" "Babiarz") "Vena B."))
(constraint (= (f "Karrie" "Lain") "Karrie L."))
(constraint (= (f "Tobias" "Dermody") "Tobias D."))
(constraint (= (f "Celsa" "Hopkins") "Celsa H."))
(constraint (= (f "Kimberley" "Halpern") "Kimberley H."))
(constraint (= (f "Phillip" "Rowden") "Phillip R."))
(constraint (= (f "Elias" "Neil") "Elias N."))
(constraint (= (f "Lashanda" "Cortes") "Lashanda C."))
(constraint (= (f "Mackenzie" "Spell") "Mackenzie S."))
(constraint (= (f "Kathlyn" "Eccleston") "Kathlyn E."))
(constraint (= (f "Georgina" "Brescia") "Georgina B."))
(constraint (= (f "Beata" "Miah") "Beata M."))
(constraint (= (f "Desiree" "Seamons") "Desiree S."))
(constraint (= (f "Jeanice" "Soderstrom") "Jeanice S."))
(constraint (= (f "Mariel" "Jurgens") "Mariel J."))
(constraint (= (f "Alida" "Bogle") "Alida B."))
(constraint (= (f "Jacqualine" "Olague") "Jacqualine O."))
(constraint (= (f "Joaquin" "Clasen") "Joaquin C."))
(constraint (= (f "Samuel" "Richert") "Samuel R."))
(constraint (= (f "Malissa" "Marcus") "Malissa M."))
(constraint (= (f "Alaina" "Partida") "Alaina P."))
(constraint (= (f "Trinidad" "Mulloy") "Trinidad M."))
(constraint (= (f "Carlene" "Garrard") "Carlene G."))
(constraint (= (f "Melodi" "Chism") "Melodi C."))
(constraint (= (f "Bess" "Chilcott") "Bess C."))
(constraint (= (f "Chong" "Aylward") "Chong A."))
(constraint (= (f "Jani" "Ramthun") "Jani R."))
(constraint (= (f "Jacquiline" "Heintz") "Jacquiline H."))
(constraint (= (f "Hayley" "Marquess") "Hayley M."))
(constraint (= (f "Andria" "Spagnoli") "Andria S."))
(constraint (= (f "Irwin" "Covelli") "Irwin C."))
(constraint (= (f "Gertude" "Montiel") "Gertude M."))
(constraint (= (f "Stefany" "Reily") "Stefany R."))
(constraint (= (f "Rae" "Mcgaughey") "Rae M."))
(constraint (= (f "Cruz" "Latimore") "Cruz L."))
(constraint (= (f "Maryann" "Casler") "Maryann C."))
(constraint (= (f "Annalisa" "Gregori") "Annalisa G."))
(constraint (= (f "Jenee" "Pannell") "Jenee P."))
(check-synth)
