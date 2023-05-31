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
(synth-fun f ((name String)) String
( (Start String (ntString))
 (ntString String (
	name " " "+" "-" "." 
	(func0 ntString ntString ntString ntString)
	(func1 ntString ntString ntString ntString)
	(func3 ntString ntString ntString ntString)
	(func4 ntString ntString ntString ntInt ntInt)
	(func8 ntString ntString ntString ntInt ntInt)
	(func10 ntString ntString ntString ntInt ntInt)
	(func11 ntString ntString ntString ntInt ntInt)
	(func12 ntString ntString ntString ntInt ntInt)
	(func14 ntString ntString ntString ntInt ntInt)
	(func16 ntString ntString ntString)
	(func18 ntString ntString ntInt ntInt)
	(func21 ntString ntInt ntInt ntString ntInt ntInt)
	(func22 ntString ntString ntInt ntInt)
	(func24 ntString ntString ntInt ntInt)
	(func26 ntString ntString ntInt ntInt)
	(func30 ntString ntString ntInt ntInt ntInt)
	(func31 ntString ntString ntInt ntInt ntInt)
	(func33 ntString ntString ntInt ntInt ntInt)
	(func34 ntString ntString ntInt ntInt ntInt)
	(func35 ntString ntString ntInt ntInt ntInt)
	(func36 ntString ntString ntInt ntInt ntInt)
	(func39 ntString ntString ntInt ntInt)
	(func41 ntString ntString ntInt ntInt)
	(func43 ntString ntInt ntInt)
	(func44 ntString ntInt ntInt ntInt)
	(func47 ntString ntInt ntInt)
	(func50 ntString ntInt ntInt ntInt)
	(func51 ntString ntInt ntInt ntInt)
	(func52 ntString ntInt ntInt ntInt)
	(func55 ntString ntInt ntInt ntInt)
	(func56 ntString ntInt ntInt ntString ntString ntInt)
	(func59 ntString ntInt ntInt ntString ntString ntInt)
	(func61 ntString ntInt ntInt ntString ntString ntInt)
	(func64 ntString ntInt ntInt ntString ntString ntInt)
	(func66 ntString ntInt ntInt ntString ntString ntInt)
	(func69 ntString ntInt ntInt ntInt)
	(func72 ntString ntInt ntString)
	(func73 ntString ntInt ntString)
	(func74 ntString ntInt ntInt)
	(str.++ ntString ntString)
	(str.replace ntString ntString ntString)
	(ite ntBool ntString ntString)
	(str.substr ntString ntInt ntInt)
))
 (ntInt Int (
	0 1 2 3 4 5 
	(func77 ntInt ntInt)
	(func80 ntInt ntInt)
	(func81 ntInt ntInt)
	(func82 ntInt ntString ntString ntInt)
	(- ntInt ntInt)
	(str.to.int ntString)
))
 (ntBool Bool (
	true false
	(str.prefixof ntString ntString)
	(str.suffixof ntString ntString)
))
))
(constraint (= (f "+106 769-858-438") "858"))
(constraint (= (f "+83 973-757-831") "757"))
(constraint (= (f "+62 647-787-775") "787"))
(constraint (= (f "+172 027-507-632") "507"))
(constraint (= (f "+72 001-050-856") "050"))
(constraint (= (f "+95 310-537-401") "537"))
(constraint (= (f "+6 775-969-238") "969"))
(constraint (= (f "+174 594-539-946") "539"))
(constraint (= (f "+155 927-275-860") "275"))
(constraint (= (f "+167 405-461-331") "461"))
(constraint (= (f "+10 538-347-401") "347"))
(constraint (= (f "+60 971-986-103") "986"))
(constraint (= (f "+13 258-276-941") "276"))
(constraint (= (f "+2 604-746-137") "746"))
(constraint (= (f "+25 998-898-180") "898"))
(constraint (= (f "+151 862-946-541") "946"))
(constraint (= (f "+118 165-041-038") "041"))
(constraint (= (f "+144 170-592-272") "592"))
(constraint (= (f "+94 462-008-482") "008"))
(constraint (= (f "+82 685-122-086") "122"))
(constraint (= (f "+82 675-366-472") "366"))
(constraint (= (f "+80 066-433-096") "433"))
(constraint (= (f "+163 039-436-166") "436"))
(constraint (= (f "+138 808-083-074") "083"))
(constraint (= (f "+42 643-245-738") "245"))
(constraint (= (f "+169 822-542-726") "542"))
(constraint (= (f "+176 767-782-369") "782"))
(constraint (= (f "+47 414-369-343") "369"))
(constraint (= (f "+138 885-618-512") "618"))
(constraint (= (f "+104 158-671-355") "671"))
(constraint (= (f "+188 280-087-526") "087"))
(constraint (= (f "+50 268-571-336") "571"))
(constraint (= (f "+183 225-960-024") "960"))
(constraint (= (f "+58 191-982-491") "982"))
(constraint (= (f "+9 507-092-535") "092"))
(constraint (= (f "+64 061-601-398") "601"))
(constraint (= (f "+189 831-591-877") "591"))
(constraint (= (f "+129 425-765-844") "765"))
(constraint (= (f "+94 856-734-046") "734"))
(constraint (= (f "+35 082-845-261") "845"))
(constraint (= (f "+185 394-622-272") "622"))
(constraint (= (f "+163 905-707-740") "707"))
(constraint (= (f "+23 448-213-807") "213"))
(constraint (= (f "+42 634-077-089") "077"))
(constraint (= (f "+18 051-287-382") "287"))
(constraint (= (f "+29 773-545-520") "545"))
(constraint (= (f "+43 249-097-743") "097"))
(constraint (= (f "+158 674-736-891") "736"))
(constraint (= (f "+45 124-771-454") "771"))
(constraint (= (f "+180 029-457-654") "457"))
(constraint (= (f "+75 227-250-652") "250"))
(constraint (= (f "+5 528-317-854") "317"))
(constraint (= (f "+81 849-629-290") "629"))
(constraint (= (f "+46 005-119-176") "119"))
(constraint (= (f "+108 150-380-705") "380"))
(constraint (= (f "+40 122-224-247") "224"))
(constraint (= (f "+68 890-680-027") "680"))
(constraint (= (f "+169 060-204-504") "204"))
(constraint (= (f "+95 620-820-945") "820"))
(constraint (= (f "+43 592-938-846") "938"))
(constraint (= (f "+7 023-296-647") "296"))
(constraint (= (f "+20 541-401-396") "401"))
(constraint (= (f "+64 751-365-934") "365"))
(constraint (= (f "+163 546-119-476") "119"))
(constraint (= (f "+198 557-666-779") "666"))
(constraint (= (f "+14 673-759-017") "759"))
(constraint (= (f "+161 086-020-168") "020"))
(constraint (= (f "+65 970-575-488") "575"))
(constraint (= (f "+2 455-126-377") "126"))
(constraint (= (f "+196 728-585-376") "585"))
(constraint (= (f "+33 117-430-125") "430"))
(constraint (= (f "+195 488-831-768") "831"))
(constraint (= (f "+86 468-718-108") "718"))
(constraint (= (f "+194 278-716-950") "716"))
(constraint (= (f "+43 730-685-847") "685"))
(constraint (= (f "+140 794-289-551") "289"))
(constraint (= (f "+21 679-740-834") "740"))
(constraint (= (f "+98 717-997-323") "997"))
(constraint (= (f "+47 401-100-231") "100"))
(constraint (= (f "+143 726-462-368") "462"))
(constraint (= (f "+147 864-005-968") "005"))
(constraint (= (f "+130 590-757-665") "757"))
(constraint (= (f "+197 700-858-976") "858"))
(constraint (= (f "+158 344-541-946") "541"))
(constraint (= (f "+56 242-901-234") "901"))
(constraint (= (f "+132 313-075-754") "075"))
(constraint (= (f "+130 517-953-149") "953"))
(constraint (= (f "+158 684-878-743") "878"))
(constraint (= (f "+52 836-582-035") "582"))
(constraint (= (f "+138 117-484-671") "484"))
(constraint (= (f "+50 012-148-873") "148"))
(constraint (= (f "+105 048-919-483") "919"))
(constraint (= (f "+18 209-851-997") "851"))
(constraint (= (f "+176 938-056-084") "056"))
(constraint (= (f "+141 018-132-973") "132"))
(constraint (= (f "+199 936-162-415") "162"))
(constraint (= (f "+33 547-051-264") "051"))
(constraint (= (f "+161 233-981-513") "981"))
(constraint (= (f "+115 101-728-328") "728"))
(constraint (= (f "+45 095-746-635") "746"))
(check-synth)
