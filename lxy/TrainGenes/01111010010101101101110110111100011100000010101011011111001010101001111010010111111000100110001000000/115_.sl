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
	name " " 
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
	0 1 2 3 4 5 
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
(constraint (= (f "938-242-504") "504"))
(constraint (= (f "308-916-545") "545"))
(constraint (= (f "623-599-749") "749"))
(constraint (= (f "981-424-843") "843"))
(constraint (= (f "118-980-214") "214"))
(constraint (= (f "244-655-094") "094"))
(constraint (= (f "830-941-991") "991"))
(constraint (= (f "911-186-562") "562"))
(constraint (= (f "002-500-200") "200"))
(constraint (= (f "113-860-034") "034"))
(constraint (= (f "457-622-959") "959"))
(constraint (= (f "986-722-311") "311"))
(constraint (= (f "110-170-771") "771"))
(constraint (= (f "469-610-118") "118"))
(constraint (= (f "817-925-247") "247"))
(constraint (= (f "256-899-439") "439"))
(constraint (= (f "886-911-726") "726"))
(constraint (= (f "562-950-358") "358"))
(constraint (= (f "693-049-588") "588"))
(constraint (= (f "840-503-234") "234"))
(constraint (= (f "698-815-340") "340"))
(constraint (= (f "498-808-434") "434"))
(constraint (= (f "329-545-000") "000"))
(constraint (= (f "380-281-597") "597"))
(constraint (= (f "332-395-493") "493"))
(constraint (= (f "251-903-028") "028"))
(constraint (= (f "176-090-894") "894"))
(constraint (= (f "336-611-100") "100"))
(constraint (= (f "416-390-647") "647"))
(constraint (= (f "019-430-596") "596"))
(constraint (= (f "960-659-771") "771"))
(constraint (= (f "475-505-007") "007"))
(constraint (= (f "424-069-886") "886"))
(constraint (= (f "941-102-117") "117"))
(constraint (= (f "331-728-008") "008"))
(constraint (= (f "487-726-198") "198"))
(constraint (= (f "612-419-942") "942"))
(constraint (= (f "594-741-346") "346"))
(constraint (= (f "320-984-742") "742"))
(constraint (= (f "060-919-361") "361"))
(constraint (= (f "275-536-998") "998"))
(constraint (= (f "548-835-065") "065"))
(constraint (= (f "197-485-507") "507"))
(constraint (= (f "455-776-949") "949"))
(constraint (= (f "085-421-340") "340"))
(constraint (= (f "785-713-099") "099"))
(constraint (= (f "426-712-861") "861"))
(constraint (= (f "386-994-906") "906"))
(constraint (= (f "918-304-840") "840"))
(constraint (= (f "247-153-598") "598"))
(constraint (= (f "075-497-069") "069"))
(constraint (= (f "140-726-583") "583"))
(constraint (= (f "049-413-248") "248"))
(constraint (= (f "977-386-462") "462"))
(constraint (= (f "058-272-455") "455"))
(constraint (= (f "428-629-927") "927"))
(constraint (= (f "449-122-191") "191"))
(constraint (= (f "568-759-670") "670"))
(constraint (= (f "312-846-053") "053"))
(constraint (= (f "943-037-297") "297"))
(constraint (= (f "014-270-177") "177"))
(constraint (= (f "658-877-878") "878"))
(constraint (= (f "888-594-038") "038"))
(constraint (= (f "232-253-254") "254"))
(constraint (= (f "308-722-292") "292"))
(constraint (= (f "342-145-742") "742"))
(constraint (= (f "568-181-515") "515"))
(constraint (= (f "300-140-756") "756"))
(constraint (= (f "099-684-216") "216"))
(constraint (= (f "575-296-621") "621"))
(constraint (= (f "994-443-794") "794"))
(constraint (= (f "400-334-692") "692"))
(constraint (= (f "684-711-883") "883"))
(constraint (= (f "539-636-358") "358"))
(constraint (= (f "009-878-919") "919"))
(constraint (= (f "919-545-701") "701"))
(constraint (= (f "546-399-239") "239"))
(constraint (= (f "993-608-757") "757"))
(constraint (= (f "107-652-845") "845"))
(constraint (= (f "206-805-793") "793"))
(constraint (= (f "198-857-684") "684"))
(constraint (= (f "912-827-430") "430"))
(constraint (= (f "560-951-766") "766"))
(constraint (= (f "142-178-290") "290"))
(constraint (= (f "732-196-946") "946"))
(constraint (= (f "963-875-745") "745"))
(constraint (= (f "881-865-867") "867"))
(constraint (= (f "234-686-715") "715"))
(constraint (= (f "720-330-583") "583"))
(constraint (= (f "593-065-126") "126"))
(constraint (= (f "671-778-064") "064"))
(constraint (= (f "252-029-036") "036"))
(constraint (= (f "700-322-036") "036"))
(constraint (= (f "882-587-473") "473"))
(constraint (= (f "964-134-953") "953"))
(constraint (= (f "038-300-876") "876"))
(constraint (= (f "158-894-947") "947"))
(constraint (= (f "757-454-374") "374"))
(constraint (= (f "872-513-190") "190"))
(constraint (= (f "566-086-726") "726"))
(check-synth)
