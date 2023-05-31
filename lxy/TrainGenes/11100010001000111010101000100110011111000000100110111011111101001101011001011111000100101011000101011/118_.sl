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
	name " " "(" ")" "-" 
	(func0 ntString ntString ntString ntString)
	(func1 ntString ntString ntString ntString)
	(func2 ntString ntString ntString ntString)
	(func6 ntString ntString ntString ntInt ntInt)
	(func10 ntString ntString ntString ntInt ntInt)
	(func14 ntString ntString ntString ntInt ntInt)
	(func15 ntString ntString ntString ntInt ntInt)
	(func16 ntString ntString ntString)
	(func18 ntString ntString ntInt ntInt)
	(func20 ntString ntInt ntInt ntString ntInt ntInt)
	(func22 ntString ntString ntInt ntInt)
	(func26 ntString ntString ntInt ntInt)
	(func29 ntString ntString ntInt ntInt)
	(func30 ntString ntString ntInt ntInt ntInt)
	(func33 ntString ntString ntInt ntInt ntInt)
	(func34 ntString ntString ntInt ntInt ntInt)
	(func35 ntString ntString ntInt ntInt ntInt)
	(func36 ntString ntString ntInt ntInt ntInt)
	(func37 ntString ntString ntInt ntInt ntInt)
	(func44 ntString ntInt ntInt ntInt)
	(func47 ntString ntInt ntInt)
	(func48 ntString ntInt ntString)
	(func50 ntString ntInt ntInt ntInt)
	(func51 ntString ntInt ntInt ntInt)
	(func52 ntString ntInt ntInt ntInt)
	(func54 ntString ntInt ntInt ntInt)
	(func55 ntString ntInt ntInt ntInt)
	(func56 ntString ntInt ntInt ntString ntString ntInt)
	(func57 ntString ntInt ntInt ntString ntString ntInt)
	(func58 ntString ntInt ntInt ntString ntString ntInt)
	(func59 ntString ntInt ntInt ntString ntString ntInt)
	(func61 ntString ntInt ntInt ntString ntString ntInt)
	(func64 ntString ntInt ntInt ntString ntString ntInt)
	(func65 ntString ntInt ntInt ntString ntString ntInt)
	(func67 ntString ntInt ntInt ntString ntString ntInt)
	(func69 ntString ntInt ntInt ntInt)
	(func70 ntString ntInt ntInt ntInt)
	(func73 ntString ntInt ntString)
	(func75 ntString ntInt ntInt)
	(str.++ ntString ntString)
	(str.replace ntString ntString ntString)
	(int.to.str ntInt)
	(ite ntBool ntString ntString)
	(str.substr ntString ntInt ntInt)
))
 (ntInt Int (
	0 1 2 3 4 5 
	(func76 ntInt ntInt)
	(func77 ntInt ntInt)
	(func78 ntInt ntInt)
	(func79 ntInt ntInt)
	(func83 ntInt ntString ntString ntInt)
	(str.len ntString)
	(str.to.int ntString)
	(ite ntBool ntInt ntInt)
))
 (ntBool Bool (
	true false
	(= ntInt ntInt)
	(str.suffixof ntString ntString)
))
))
(constraint (= (f "938-242-504") "(938) 242-504"))
(constraint (= (f "938-242-504") "(938) 242-504"))
(constraint (= (f "938-242-504") "(938) 242-504"))
(constraint (= (f "308-916-545") "(308) 916-545"))
(constraint (= (f "308-916-545") "(308) 916-545"))
(constraint (= (f "308-916-545") "(308) 916-545"))
(constraint (= (f "623-599-749") "(623) 599-749"))
(constraint (= (f "623-599-749") "(623) 599-749"))
(constraint (= (f "623-599-749") "(623) 599-749"))
(constraint (= (f "981-424-843") "(981) 424-843"))
(constraint (= (f "981-424-843") "(981) 424-843"))
(constraint (= (f "981-424-843") "(981) 424-843"))
(constraint (= (f "118-980-214") "(118) 980-214"))
(constraint (= (f "118-980-214") "(118) 980-214"))
(constraint (= (f "118-980-214") "(118) 980-214"))
(constraint (= (f "244-655-094") "(244) 655-094"))
(constraint (= (f "244-655-094") "(244) 655-094"))
(constraint (= (f "244-655-094") "(244) 655-094"))
(constraint (= (f "830-941-991") "(830) 941-991"))
(constraint (= (f "830-941-991") "(830) 941-991"))
(constraint (= (f "830-941-991") "(830) 941-991"))
(constraint (= (f "911-186-562") "(911) 186-562"))
(constraint (= (f "911-186-562") "(911) 186-562"))
(constraint (= (f "911-186-562") "(911) 186-562"))
(constraint (= (f "002-500-200") "(002) 500-200"))
(constraint (= (f "002-500-200") "(002) 500-200"))
(constraint (= (f "002-500-200") "(002) 500-200"))
(constraint (= (f "113-860-034") "(113) 860-034"))
(constraint (= (f "113-860-034") "(113) 860-034"))
(constraint (= (f "113-860-034") "(113) 860-034"))
(constraint (= (f "457-622-959") "(457) 622-959"))
(constraint (= (f "457-622-959") "(457) 622-959"))
(constraint (= (f "457-622-959") "(457) 622-959"))
(constraint (= (f "986-722-311") "(986) 722-311"))
(constraint (= (f "986-722-311") "(986) 722-311"))
(constraint (= (f "986-722-311") "(986) 722-311"))
(constraint (= (f "110-170-771") "(110) 170-771"))
(constraint (= (f "110-170-771") "(110) 170-771"))
(constraint (= (f "110-170-771") "(110) 170-771"))
(constraint (= (f "469-610-118") "(469) 610-118"))
(constraint (= (f "469-610-118") "(469) 610-118"))
(constraint (= (f "469-610-118") "(469) 610-118"))
(constraint (= (f "817-925-247") "(817) 925-247"))
(constraint (= (f "817-925-247") "(817) 925-247"))
(constraint (= (f "817-925-247") "(817) 925-247"))
(constraint (= (f "256-899-439") "(256) 899-439"))
(constraint (= (f "256-899-439") "(256) 899-439"))
(constraint (= (f "256-899-439") "(256) 899-439"))
(constraint (= (f "886-911-726") "(886) 911-726"))
(constraint (= (f "886-911-726") "(886) 911-726"))
(constraint (= (f "886-911-726") "(886) 911-726"))
(constraint (= (f "562-950-358") "(562) 950-358"))
(constraint (= (f "562-950-358") "(562) 950-358"))
(constraint (= (f "562-950-358") "(562) 950-358"))
(constraint (= (f "693-049-588") "(693) 049-588"))
(constraint (= (f "693-049-588") "(693) 049-588"))
(constraint (= (f "693-049-588") "(693) 049-588"))
(constraint (= (f "840-503-234") "(840) 503-234"))
(constraint (= (f "840-503-234") "(840) 503-234"))
(constraint (= (f "840-503-234") "(840) 503-234"))
(constraint (= (f "698-815-340") "(698) 815-340"))
(constraint (= (f "698-815-340") "(698) 815-340"))
(constraint (= (f "698-815-340") "(698) 815-340"))
(constraint (= (f "498-808-434") "(498) 808-434"))
(constraint (= (f "498-808-434") "(498) 808-434"))
(constraint (= (f "498-808-434") "(498) 808-434"))
(constraint (= (f "329-545-000") "(329) 545-000"))
(constraint (= (f "329-545-000") "(329) 545-000"))
(constraint (= (f "329-545-000") "(329) 545-000"))
(constraint (= (f "380-281-597") "(380) 281-597"))
(constraint (= (f "380-281-597") "(380) 281-597"))
(constraint (= (f "380-281-597") "(380) 281-597"))
(constraint (= (f "332-395-493") "(332) 395-493"))
(constraint (= (f "332-395-493") "(332) 395-493"))
(constraint (= (f "332-395-493") "(332) 395-493"))
(constraint (= (f "251-903-028") "(251) 903-028"))
(constraint (= (f "251-903-028") "(251) 903-028"))
(constraint (= (f "251-903-028") "(251) 903-028"))
(constraint (= (f "176-090-894") "(176) 090-894"))
(constraint (= (f "176-090-894") "(176) 090-894"))
(constraint (= (f "176-090-894") "(176) 090-894"))
(constraint (= (f "336-611-100") "(336) 611-100"))
(constraint (= (f "336-611-100") "(336) 611-100"))
(constraint (= (f "336-611-100") "(336) 611-100"))
(constraint (= (f "416-390-647") "(416) 390-647"))
(constraint (= (f "416-390-647") "(416) 390-647"))
(constraint (= (f "416-390-647") "(416) 390-647"))
(constraint (= (f "019-430-596") "(019) 430-596"))
(constraint (= (f "019-430-596") "(019) 430-596"))
(constraint (= (f "019-430-596") "(019) 430-596"))
(constraint (= (f "960-659-771") "(960) 659-771"))
(constraint (= (f "960-659-771") "(960) 659-771"))
(constraint (= (f "960-659-771") "(960) 659-771"))
(constraint (= (f "475-505-007") "(475) 505-007"))
(constraint (= (f "475-505-007") "(475) 505-007"))
(constraint (= (f "475-505-007") "(475) 505-007"))
(constraint (= (f "424-069-886") "(424) 069-886"))
(constraint (= (f "424-069-886") "(424) 069-886"))
(constraint (= (f "424-069-886") "(424) 069-886"))
(constraint (= (f "941-102-117") "(941) 102-117"))
(constraint (= (f "941-102-117") "(941) 102-117"))
(constraint (= (f "941-102-117") "(941) 102-117"))
(constraint (= (f "331-728-008") "(331) 728-008"))
(constraint (= (f "331-728-008") "(331) 728-008"))
(constraint (= (f "331-728-008") "(331) 728-008"))
(constraint (= (f "487-726-198") "(487) 726-198"))
(constraint (= (f "487-726-198") "(487) 726-198"))
(constraint (= (f "487-726-198") "(487) 726-198"))
(constraint (= (f "612-419-942") "(612) 419-942"))
(constraint (= (f "612-419-942") "(612) 419-942"))
(constraint (= (f "612-419-942") "(612) 419-942"))
(constraint (= (f "594-741-346") "(594) 741-346"))
(constraint (= (f "594-741-346") "(594) 741-346"))
(constraint (= (f "594-741-346") "(594) 741-346"))
(constraint (= (f "320-984-742") "(320) 984-742"))
(constraint (= (f "320-984-742") "(320) 984-742"))
(constraint (= (f "320-984-742") "(320) 984-742"))
(constraint (= (f "060-919-361") "(060) 919-361"))
(constraint (= (f "060-919-361") "(060) 919-361"))
(constraint (= (f "060-919-361") "(060) 919-361"))
(constraint (= (f "275-536-998") "(275) 536-998"))
(constraint (= (f "275-536-998") "(275) 536-998"))
(constraint (= (f "275-536-998") "(275) 536-998"))
(constraint (= (f "548-835-065") "(548) 835-065"))
(constraint (= (f "548-835-065") "(548) 835-065"))
(constraint (= (f "548-835-065") "(548) 835-065"))
(constraint (= (f "197-485-507") "(197) 485-507"))
(constraint (= (f "197-485-507") "(197) 485-507"))
(constraint (= (f "197-485-507") "(197) 485-507"))
(constraint (= (f "455-776-949") "(455) 776-949"))
(constraint (= (f "455-776-949") "(455) 776-949"))
(constraint (= (f "455-776-949") "(455) 776-949"))
(constraint (= (f "085-421-340") "(085) 421-340"))
(constraint (= (f "085-421-340") "(085) 421-340"))
(constraint (= (f "085-421-340") "(085) 421-340"))
(constraint (= (f "785-713-099") "(785) 713-099"))
(constraint (= (f "785-713-099") "(785) 713-099"))
(constraint (= (f "785-713-099") "(785) 713-099"))
(constraint (= (f "426-712-861") "(426) 712-861"))
(constraint (= (f "426-712-861") "(426) 712-861"))
(constraint (= (f "426-712-861") "(426) 712-861"))
(constraint (= (f "386-994-906") "(386) 994-906"))
(constraint (= (f "386-994-906") "(386) 994-906"))
(constraint (= (f "386-994-906") "(386) 994-906"))
(constraint (= (f "918-304-840") "(918) 304-840"))
(constraint (= (f "918-304-840") "(918) 304-840"))
(constraint (= (f "918-304-840") "(918) 304-840"))
(constraint (= (f "247-153-598") "(247) 153-598"))
(constraint (= (f "247-153-598") "(247) 153-598"))
(constraint (= (f "247-153-598") "(247) 153-598"))
(constraint (= (f "075-497-069") "(075) 497-069"))
(constraint (= (f "075-497-069") "(075) 497-069"))
(constraint (= (f "075-497-069") "(075) 497-069"))
(constraint (= (f "140-726-583") "(140) 726-583"))
(constraint (= (f "140-726-583") "(140) 726-583"))
(constraint (= (f "140-726-583") "(140) 726-583"))
(constraint (= (f "049-413-248") "(049) 413-248"))
(constraint (= (f "049-413-248") "(049) 413-248"))
(constraint (= (f "049-413-248") "(049) 413-248"))
(constraint (= (f "977-386-462") "(977) 386-462"))
(constraint (= (f "977-386-462") "(977) 386-462"))
(constraint (= (f "977-386-462") "(977) 386-462"))
(constraint (= (f "058-272-455") "(058) 272-455"))
(constraint (= (f "058-272-455") "(058) 272-455"))
(constraint (= (f "058-272-455") "(058) 272-455"))
(constraint (= (f "428-629-927") "(428) 629-927"))
(constraint (= (f "428-629-927") "(428) 629-927"))
(constraint (= (f "428-629-927") "(428) 629-927"))
(constraint (= (f "449-122-191") "(449) 122-191"))
(constraint (= (f "449-122-191") "(449) 122-191"))
(constraint (= (f "449-122-191") "(449) 122-191"))
(constraint (= (f "568-759-670") "(568) 759-670"))
(constraint (= (f "568-759-670") "(568) 759-670"))
(constraint (= (f "568-759-670") "(568) 759-670"))
(constraint (= (f "312-846-053") "(312) 846-053"))
(constraint (= (f "312-846-053") "(312) 846-053"))
(constraint (= (f "312-846-053") "(312) 846-053"))
(constraint (= (f "943-037-297") "(943) 037-297"))
(constraint (= (f "943-037-297") "(943) 037-297"))
(constraint (= (f "943-037-297") "(943) 037-297"))
(constraint (= (f "014-270-177") "(014) 270-177"))
(constraint (= (f "014-270-177") "(014) 270-177"))
(constraint (= (f "014-270-177") "(014) 270-177"))
(constraint (= (f "658-877-878") "(658) 877-878"))
(constraint (= (f "658-877-878") "(658) 877-878"))
(constraint (= (f "658-877-878") "(658) 877-878"))
(constraint (= (f "888-594-038") "(888) 594-038"))
(constraint (= (f "888-594-038") "(888) 594-038"))
(constraint (= (f "888-594-038") "(888) 594-038"))
(constraint (= (f "232-253-254") "(232) 253-254"))
(constraint (= (f "232-253-254") "(232) 253-254"))
(constraint (= (f "232-253-254") "(232) 253-254"))
(constraint (= (f "308-722-292") "(308) 722-292"))
(constraint (= (f "308-722-292") "(308) 722-292"))
(constraint (= (f "308-722-292") "(308) 722-292"))
(constraint (= (f "342-145-742") "(342) 145-742"))
(constraint (= (f "342-145-742") "(342) 145-742"))
(constraint (= (f "342-145-742") "(342) 145-742"))
(constraint (= (f "568-181-515") "(568) 181-515"))
(constraint (= (f "568-181-515") "(568) 181-515"))
(constraint (= (f "568-181-515") "(568) 181-515"))
(constraint (= (f "300-140-756") "(300) 140-756"))
(constraint (= (f "300-140-756") "(300) 140-756"))
(constraint (= (f "300-140-756") "(300) 140-756"))
(constraint (= (f "099-684-216") "(099) 684-216"))
(constraint (= (f "099-684-216") "(099) 684-216"))
(constraint (= (f "099-684-216") "(099) 684-216"))
(constraint (= (f "575-296-621") "(575) 296-621"))
(constraint (= (f "575-296-621") "(575) 296-621"))
(constraint (= (f "575-296-621") "(575) 296-621"))
(constraint (= (f "994-443-794") "(994) 443-794"))
(constraint (= (f "994-443-794") "(994) 443-794"))
(constraint (= (f "994-443-794") "(994) 443-794"))
(constraint (= (f "400-334-692") "(400) 334-692"))
(constraint (= (f "400-334-692") "(400) 334-692"))
(constraint (= (f "400-334-692") "(400) 334-692"))
(constraint (= (f "684-711-883") "(684) 711-883"))
(constraint (= (f "684-711-883") "(684) 711-883"))
(constraint (= (f "684-711-883") "(684) 711-883"))
(constraint (= (f "539-636-358") "(539) 636-358"))
(constraint (= (f "539-636-358") "(539) 636-358"))
(constraint (= (f "539-636-358") "(539) 636-358"))
(constraint (= (f "009-878-919") "(009) 878-919"))
(constraint (= (f "009-878-919") "(009) 878-919"))
(constraint (= (f "009-878-919") "(009) 878-919"))
(constraint (= (f "919-545-701") "(919) 545-701"))
(constraint (= (f "919-545-701") "(919) 545-701"))
(constraint (= (f "919-545-701") "(919) 545-701"))
(constraint (= (f "546-399-239") "(546) 399-239"))
(constraint (= (f "546-399-239") "(546) 399-239"))
(constraint (= (f "546-399-239") "(546) 399-239"))
(constraint (= (f "993-608-757") "(993) 608-757"))
(constraint (= (f "993-608-757") "(993) 608-757"))
(constraint (= (f "993-608-757") "(993) 608-757"))
(constraint (= (f "107-652-845") "(107) 652-845"))
(constraint (= (f "107-652-845") "(107) 652-845"))
(constraint (= (f "107-652-845") "(107) 652-845"))
(constraint (= (f "206-805-793") "(206) 805-793"))
(constraint (= (f "206-805-793") "(206) 805-793"))
(constraint (= (f "206-805-793") "(206) 805-793"))
(constraint (= (f "198-857-684") "(198) 857-684"))
(constraint (= (f "198-857-684") "(198) 857-684"))
(constraint (= (f "198-857-684") "(198) 857-684"))
(constraint (= (f "912-827-430") "(912) 827-430"))
(constraint (= (f "912-827-430") "(912) 827-430"))
(constraint (= (f "912-827-430") "(912) 827-430"))
(constraint (= (f "560-951-766") "(560) 951-766"))
(constraint (= (f "560-951-766") "(560) 951-766"))
(constraint (= (f "560-951-766") "(560) 951-766"))
(constraint (= (f "142-178-290") "(142) 178-290"))
(constraint (= (f "142-178-290") "(142) 178-290"))
(constraint (= (f "142-178-290") "(142) 178-290"))
(constraint (= (f "732-196-946") "(732) 196-946"))
(constraint (= (f "732-196-946") "(732) 196-946"))
(constraint (= (f "732-196-946") "(732) 196-946"))
(constraint (= (f "963-875-745") "(963) 875-745"))
(constraint (= (f "963-875-745") "(963) 875-745"))
(constraint (= (f "963-875-745") "(963) 875-745"))
(constraint (= (f "881-865-867") "(881) 865-867"))
(constraint (= (f "881-865-867") "(881) 865-867"))
(constraint (= (f "881-865-867") "(881) 865-867"))
(constraint (= (f "234-686-715") "(234) 686-715"))
(constraint (= (f "234-686-715") "(234) 686-715"))
(constraint (= (f "234-686-715") "(234) 686-715"))
(constraint (= (f "720-330-583") "(720) 330-583"))
(constraint (= (f "720-330-583") "(720) 330-583"))
(constraint (= (f "720-330-583") "(720) 330-583"))
(constraint (= (f "593-065-126") "(593) 065-126"))
(constraint (= (f "593-065-126") "(593) 065-126"))
(constraint (= (f "593-065-126") "(593) 065-126"))
(constraint (= (f "671-778-064") "(671) 778-064"))
(constraint (= (f "671-778-064") "(671) 778-064"))
(constraint (= (f "671-778-064") "(671) 778-064"))
(constraint (= (f "252-029-036") "(252) 029-036"))
(constraint (= (f "252-029-036") "(252) 029-036"))
(constraint (= (f "252-029-036") "(252) 029-036"))
(constraint (= (f "700-322-036") "(700) 322-036"))
(constraint (= (f "700-322-036") "(700) 322-036"))
(constraint (= (f "700-322-036") "(700) 322-036"))
(constraint (= (f "882-587-473") "(882) 587-473"))
(constraint (= (f "882-587-473") "(882) 587-473"))
(constraint (= (f "882-587-473") "(882) 587-473"))
(constraint (= (f "964-134-953") "(964) 134-953"))
(constraint (= (f "964-134-953") "(964) 134-953"))
(constraint (= (f "964-134-953") "(964) 134-953"))
(constraint (= (f "038-300-876") "(038) 300-876"))
(constraint (= (f "038-300-876") "(038) 300-876"))
(constraint (= (f "038-300-876") "(038) 300-876"))
(constraint (= (f "158-894-947") "(158) 894-947"))
(constraint (= (f "158-894-947") "(158) 894-947"))
(constraint (= (f "158-894-947") "(158) 894-947"))
(constraint (= (f "757-454-374") "(757) 454-374"))
(constraint (= (f "757-454-374") "(757) 454-374"))
(constraint (= (f "757-454-374") "(757) 454-374"))
(constraint (= (f "872-513-190") "(872) 513-190"))
(constraint (= (f "872-513-190") "(872) 513-190"))
(constraint (= (f "872-513-190") "(872) 513-190"))
(constraint (= (f "566-086-726") "(566) 086-726"))
(constraint (= (f "566-086-726") "(566) 086-726"))
(constraint (= (f "566-086-726") "(566) 086-726"))
(constraint (= (f "938-242-504") "(938) 242-504"))
(constraint (= (f "308-916-545") "(308) 916-545"))
(constraint (= (f "623-599-749") "(623) 599-749"))
(constraint (= (f "981-424-843") "(981) 424-843"))
(constraint (= (f "118-980-214") "(118) 980-214"))
(constraint (= (f "244-655-094") "(244) 655-094"))
(constraint (= (f "830-941-991") "(830) 941-991"))
(constraint (= (f "911-186-562") "(911) 186-562"))
(constraint (= (f "002-500-200") "(002) 500-200"))
(constraint (= (f "113-860-034") "(113) 860-034"))
(constraint (= (f "457-622-959") "(457) 622-959"))
(constraint (= (f "986-722-311") "(986) 722-311"))
(constraint (= (f "110-170-771") "(110) 170-771"))
(constraint (= (f "469-610-118") "(469) 610-118"))
(constraint (= (f "817-925-247") "(817) 925-247"))
(constraint (= (f "256-899-439") "(256) 899-439"))
(constraint (= (f "886-911-726") "(886) 911-726"))
(constraint (= (f "562-950-358") "(562) 950-358"))
(constraint (= (f "693-049-588") "(693) 049-588"))
(constraint (= (f "840-503-234") "(840) 503-234"))
(constraint (= (f "698-815-340") "(698) 815-340"))
(constraint (= (f "498-808-434") "(498) 808-434"))
(constraint (= (f "329-545-000") "(329) 545-000"))
(constraint (= (f "380-281-597") "(380) 281-597"))
(constraint (= (f "332-395-493") "(332) 395-493"))
(constraint (= (f "251-903-028") "(251) 903-028"))
(constraint (= (f "176-090-894") "(176) 090-894"))
(constraint (= (f "336-611-100") "(336) 611-100"))
(constraint (= (f "416-390-647") "(416) 390-647"))
(constraint (= (f "019-430-596") "(019) 430-596"))
(constraint (= (f "960-659-771") "(960) 659-771"))
(constraint (= (f "475-505-007") "(475) 505-007"))
(constraint (= (f "424-069-886") "(424) 069-886"))
(constraint (= (f "941-102-117") "(941) 102-117"))
(constraint (= (f "331-728-008") "(331) 728-008"))
(constraint (= (f "487-726-198") "(487) 726-198"))
(constraint (= (f "612-419-942") "(612) 419-942"))
(constraint (= (f "594-741-346") "(594) 741-346"))
(constraint (= (f "320-984-742") "(320) 984-742"))
(constraint (= (f "060-919-361") "(060) 919-361"))
(constraint (= (f "275-536-998") "(275) 536-998"))
(constraint (= (f "548-835-065") "(548) 835-065"))
(constraint (= (f "197-485-507") "(197) 485-507"))
(constraint (= (f "455-776-949") "(455) 776-949"))
(constraint (= (f "085-421-340") "(085) 421-340"))
(constraint (= (f "785-713-099") "(785) 713-099"))
(constraint (= (f "426-712-861") "(426) 712-861"))
(constraint (= (f "386-994-906") "(386) 994-906"))
(constraint (= (f "918-304-840") "(918) 304-840"))
(constraint (= (f "247-153-598") "(247) 153-598"))
(constraint (= (f "075-497-069") "(075) 497-069"))
(constraint (= (f "140-726-583") "(140) 726-583"))
(constraint (= (f "049-413-248") "(049) 413-248"))
(constraint (= (f "977-386-462") "(977) 386-462"))
(constraint (= (f "058-272-455") "(058) 272-455"))
(constraint (= (f "428-629-927") "(428) 629-927"))
(constraint (= (f "449-122-191") "(449) 122-191"))
(constraint (= (f "568-759-670") "(568) 759-670"))
(constraint (= (f "312-846-053") "(312) 846-053"))
(constraint (= (f "943-037-297") "(943) 037-297"))
(constraint (= (f "014-270-177") "(014) 270-177"))
(constraint (= (f "658-877-878") "(658) 877-878"))
(constraint (= (f "888-594-038") "(888) 594-038"))
(constraint (= (f "232-253-254") "(232) 253-254"))
(constraint (= (f "308-722-292") "(308) 722-292"))
(constraint (= (f "342-145-742") "(342) 145-742"))
(constraint (= (f "568-181-515") "(568) 181-515"))
(constraint (= (f "300-140-756") "(300) 140-756"))
(constraint (= (f "099-684-216") "(099) 684-216"))
(constraint (= (f "575-296-621") "(575) 296-621"))
(constraint (= (f "994-443-794") "(994) 443-794"))
(constraint (= (f "400-334-692") "(400) 334-692"))
(constraint (= (f "684-711-883") "(684) 711-883"))
(constraint (= (f "539-636-358") "(539) 636-358"))
(constraint (= (f "009-878-919") "(009) 878-919"))
(constraint (= (f "919-545-701") "(919) 545-701"))
(constraint (= (f "546-399-239") "(546) 399-239"))
(constraint (= (f "993-608-757") "(993) 608-757"))
(constraint (= (f "107-652-845") "(107) 652-845"))
(constraint (= (f "206-805-793") "(206) 805-793"))
(constraint (= (f "198-857-684") "(198) 857-684"))
(constraint (= (f "912-827-430") "(912) 827-430"))
(constraint (= (f "560-951-766") "(560) 951-766"))
(constraint (= (f "142-178-290") "(142) 178-290"))
(constraint (= (f "732-196-946") "(732) 196-946"))
(constraint (= (f "963-875-745") "(963) 875-745"))
(constraint (= (f "881-865-867") "(881) 865-867"))
(constraint (= (f "234-686-715") "(234) 686-715"))
(constraint (= (f "720-330-583") "(720) 330-583"))
(constraint (= (f "593-065-126") "(593) 065-126"))
(constraint (= (f "671-778-064") "(671) 778-064"))
(constraint (= (f "252-029-036") "(252) 029-036"))
(constraint (= (f "700-322-036") "(700) 322-036"))
(constraint (= (f "882-587-473") "(882) 587-473"))
(constraint (= (f "964-134-953") "(964) 134-953"))
(constraint (= (f "038-300-876") "(038) 300-876"))
(constraint (= (f "158-894-947") "(158) 894-947"))
(constraint (= (f "757-454-374") "(757) 454-374"))
(constraint (= (f "872-513-190") "(872) 513-190"))
(constraint (= (f "566-086-726") "(566) 086-726"))
(check-synth)
