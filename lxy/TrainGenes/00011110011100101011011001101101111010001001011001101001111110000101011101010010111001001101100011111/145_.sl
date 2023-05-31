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
	(func3 ntString ntString ntString ntString)
	(func4 ntString ntString ntString ntInt ntInt)
	(func5 ntString ntString ntString ntInt ntInt)
	(func6 ntString ntString ntString ntInt ntInt)
	(func9 ntString ntString ntString ntInt ntInt)
	(func10 ntString ntString ntString ntInt ntInt)
	(func11 ntString ntString ntString ntInt ntInt)
	(func14 ntString ntString ntString ntInt ntInt)
	(func16 ntString ntString ntString)
	(func18 ntString ntString ntInt ntInt)
	(func19 ntString ntString ntInt ntInt)
	(func21 ntString ntInt ntInt ntString ntInt ntInt)
	(func22 ntString ntString ntInt ntInt)
	(func25 ntString ntString ntInt ntInt)
	(func26 ntString ntString ntInt ntInt)
	(func28 ntString ntString ntInt ntInt)
	(func29 ntString ntString ntInt ntInt)
	(func31 ntString ntString ntInt ntInt ntInt)
	(func32 ntString ntString ntInt ntInt ntInt)
	(func33 ntString ntString ntInt ntInt ntInt)
	(func34 ntString ntString ntInt ntInt ntInt)
	(func36 ntString ntString ntInt ntInt ntInt)
	(func40 ntString ntString ntInt ntInt)
	(func43 ntString ntInt ntInt)
	(func45 ntString ntInt ntInt ntInt)
	(func46 ntString ntInt ntInt)
	(func49 ntString ntInt ntString)
	(func50 ntString ntInt ntInt ntInt)
	(func52 ntString ntInt ntInt ntInt)
	(func55 ntString ntInt ntInt ntInt)
	(func56 ntString ntInt ntInt ntString ntString ntInt)
	(func57 ntString ntInt ntInt ntString ntString ntInt)
	(func58 ntString ntInt ntInt ntString ntString ntInt)
	(func59 ntString ntInt ntInt ntString ntString ntInt)
	(func60 ntString ntInt ntInt ntString ntString ntInt)
	(func65 ntString ntInt ntInt ntString ntString ntInt)
	(func67 ntString ntInt ntInt ntString ntString ntInt)
	(func69 ntString ntInt ntInt ntInt)
	(func70 ntString ntInt ntInt ntInt)
	(func71 ntString ntInt ntInt ntInt)
	(func73 ntString ntInt ntString)
	(func75 ntString ntInt ntInt)
	(str.++ ntString ntString)
	(str.at ntString ntInt)
	(int.to.str ntInt)
	(ite ntBool ntString ntString)
))
 (ntInt Int (
	0 1 2 3 4 5 
	(func78 ntInt ntInt)
	(func80 ntInt ntInt)
	(func81 ntInt ntInt)
	(func82 ntInt ntString ntString ntInt)
	(+ ntInt ntInt)
	(str.to.int ntString)
	(ite ntBool ntInt ntInt)
	(str.indexof ntString ntString ntInt)
))
 (ntBool Bool (
	true false
))
))
(constraint (= (f "+106 769-858-438") "106.769.858.438"))
(constraint (= (f "+106 769-858-438") "106.769.858.438"))
(constraint (= (f "+106 769-858-438") "106.769.858.438"))
(constraint (= (f "+83 973-757-831") "83.973.757.831"))
(constraint (= (f "+83 973-757-831") "83.973.757.831"))
(constraint (= (f "+83 973-757-831") "83.973.757.831"))
(constraint (= (f "+62 647-787-775") "62.647.787.775"))
(constraint (= (f "+62 647-787-775") "62.647.787.775"))
(constraint (= (f "+62 647-787-775") "62.647.787.775"))
(constraint (= (f "+172 027-507-632") "172.027.507.632"))
(constraint (= (f "+172 027-507-632") "172.027.507.632"))
(constraint (= (f "+172 027-507-632") "172.027.507.632"))
(constraint (= (f "+72 001-050-856") "72.001.050.856"))
(constraint (= (f "+72 001-050-856") "72.001.050.856"))
(constraint (= (f "+72 001-050-856") "72.001.050.856"))
(constraint (= (f "+95 310-537-401") "95.310.537.401"))
(constraint (= (f "+95 310-537-401") "95.310.537.401"))
(constraint (= (f "+95 310-537-401") "95.310.537.401"))
(constraint (= (f "+6 775-969-238") "6.775.969.238"))
(constraint (= (f "+6 775-969-238") "6.775.969.238"))
(constraint (= (f "+6 775-969-238") "6.775.969.238"))
(constraint (= (f "+174 594-539-946") "174.594.539.946"))
(constraint (= (f "+174 594-539-946") "174.594.539.946"))
(constraint (= (f "+174 594-539-946") "174.594.539.946"))
(constraint (= (f "+155 927-275-860") "155.927.275.860"))
(constraint (= (f "+155 927-275-860") "155.927.275.860"))
(constraint (= (f "+155 927-275-860") "155.927.275.860"))
(constraint (= (f "+167 405-461-331") "167.405.461.331"))
(constraint (= (f "+167 405-461-331") "167.405.461.331"))
(constraint (= (f "+167 405-461-331") "167.405.461.331"))
(constraint (= (f "+10 538-347-401") "10.538.347.401"))
(constraint (= (f "+10 538-347-401") "10.538.347.401"))
(constraint (= (f "+10 538-347-401") "10.538.347.401"))
(constraint (= (f "+60 971-986-103") "60.971.986.103"))
(constraint (= (f "+60 971-986-103") "60.971.986.103"))
(constraint (= (f "+60 971-986-103") "60.971.986.103"))
(constraint (= (f "+13 258-276-941") "13.258.276.941"))
(constraint (= (f "+13 258-276-941") "13.258.276.941"))
(constraint (= (f "+13 258-276-941") "13.258.276.941"))
(constraint (= (f "+2 604-746-137") "2.604.746.137"))
(constraint (= (f "+2 604-746-137") "2.604.746.137"))
(constraint (= (f "+2 604-746-137") "2.604.746.137"))
(constraint (= (f "+25 998-898-180") "25.998.898.180"))
(constraint (= (f "+25 998-898-180") "25.998.898.180"))
(constraint (= (f "+25 998-898-180") "25.998.898.180"))
(constraint (= (f "+151 862-946-541") "151.862.946.541"))
(constraint (= (f "+151 862-946-541") "151.862.946.541"))
(constraint (= (f "+151 862-946-541") "151.862.946.541"))
(constraint (= (f "+118 165-041-038") "118.165.041.038"))
(constraint (= (f "+118 165-041-038") "118.165.041.038"))
(constraint (= (f "+118 165-041-038") "118.165.041.038"))
(constraint (= (f "+144 170-592-272") "144.170.592.272"))
(constraint (= (f "+144 170-592-272") "144.170.592.272"))
(constraint (= (f "+144 170-592-272") "144.170.592.272"))
(constraint (= (f "+94 462-008-482") "94.462.008.482"))
(constraint (= (f "+94 462-008-482") "94.462.008.482"))
(constraint (= (f "+94 462-008-482") "94.462.008.482"))
(constraint (= (f "+82 685-122-086") "82.685.122.086"))
(constraint (= (f "+82 685-122-086") "82.685.122.086"))
(constraint (= (f "+82 685-122-086") "82.685.122.086"))
(constraint (= (f "+82 675-366-472") "82.675.366.472"))
(constraint (= (f "+82 675-366-472") "82.675.366.472"))
(constraint (= (f "+82 675-366-472") "82.675.366.472"))
(constraint (= (f "+80 066-433-096") "80.066.433.096"))
(constraint (= (f "+80 066-433-096") "80.066.433.096"))
(constraint (= (f "+80 066-433-096") "80.066.433.096"))
(constraint (= (f "+163 039-436-166") "163.039.436.166"))
(constraint (= (f "+163 039-436-166") "163.039.436.166"))
(constraint (= (f "+163 039-436-166") "163.039.436.166"))
(constraint (= (f "+138 808-083-074") "138.808.083.074"))
(constraint (= (f "+138 808-083-074") "138.808.083.074"))
(constraint (= (f "+138 808-083-074") "138.808.083.074"))
(constraint (= (f "+42 643-245-738") "42.643.245.738"))
(constraint (= (f "+42 643-245-738") "42.643.245.738"))
(constraint (= (f "+42 643-245-738") "42.643.245.738"))
(constraint (= (f "+169 822-542-726") "169.822.542.726"))
(constraint (= (f "+169 822-542-726") "169.822.542.726"))
(constraint (= (f "+169 822-542-726") "169.822.542.726"))
(constraint (= (f "+176 767-782-369") "176.767.782.369"))
(constraint (= (f "+176 767-782-369") "176.767.782.369"))
(constraint (= (f "+176 767-782-369") "176.767.782.369"))
(constraint (= (f "+47 414-369-343") "47.414.369.343"))
(constraint (= (f "+47 414-369-343") "47.414.369.343"))
(constraint (= (f "+47 414-369-343") "47.414.369.343"))
(constraint (= (f "+138 885-618-512") "138.885.618.512"))
(constraint (= (f "+138 885-618-512") "138.885.618.512"))
(constraint (= (f "+138 885-618-512") "138.885.618.512"))
(constraint (= (f "+104 158-671-355") "104.158.671.355"))
(constraint (= (f "+104 158-671-355") "104.158.671.355"))
(constraint (= (f "+104 158-671-355") "104.158.671.355"))
(constraint (= (f "+188 280-087-526") "188.280.087.526"))
(constraint (= (f "+188 280-087-526") "188.280.087.526"))
(constraint (= (f "+188 280-087-526") "188.280.087.526"))
(constraint (= (f "+50 268-571-336") "50.268.571.336"))
(constraint (= (f "+50 268-571-336") "50.268.571.336"))
(constraint (= (f "+50 268-571-336") "50.268.571.336"))
(constraint (= (f "+183 225-960-024") "183.225.960.024"))
(constraint (= (f "+183 225-960-024") "183.225.960.024"))
(constraint (= (f "+183 225-960-024") "183.225.960.024"))
(constraint (= (f "+58 191-982-491") "58.191.982.491"))
(constraint (= (f "+58 191-982-491") "58.191.982.491"))
(constraint (= (f "+58 191-982-491") "58.191.982.491"))
(constraint (= (f "+9 507-092-535") "9.507.092.535"))
(constraint (= (f "+9 507-092-535") "9.507.092.535"))
(constraint (= (f "+9 507-092-535") "9.507.092.535"))
(constraint (= (f "+64 061-601-398") "64.061.601.398"))
(constraint (= (f "+64 061-601-398") "64.061.601.398"))
(constraint (= (f "+64 061-601-398") "64.061.601.398"))
(constraint (= (f "+189 831-591-877") "189.831.591.877"))
(constraint (= (f "+189 831-591-877") "189.831.591.877"))
(constraint (= (f "+189 831-591-877") "189.831.591.877"))
(constraint (= (f "+129 425-765-844") "129.425.765.844"))
(constraint (= (f "+129 425-765-844") "129.425.765.844"))
(constraint (= (f "+129 425-765-844") "129.425.765.844"))
(constraint (= (f "+94 856-734-046") "94.856.734.046"))
(constraint (= (f "+94 856-734-046") "94.856.734.046"))
(constraint (= (f "+94 856-734-046") "94.856.734.046"))
(constraint (= (f "+35 082-845-261") "35.082.845.261"))
(constraint (= (f "+35 082-845-261") "35.082.845.261"))
(constraint (= (f "+35 082-845-261") "35.082.845.261"))
(constraint (= (f "+185 394-622-272") "185.394.622.272"))
(constraint (= (f "+185 394-622-272") "185.394.622.272"))
(constraint (= (f "+185 394-622-272") "185.394.622.272"))
(constraint (= (f "+163 905-707-740") "163.905.707.740"))
(constraint (= (f "+163 905-707-740") "163.905.707.740"))
(constraint (= (f "+163 905-707-740") "163.905.707.740"))
(constraint (= (f "+23 448-213-807") "23.448.213.807"))
(constraint (= (f "+23 448-213-807") "23.448.213.807"))
(constraint (= (f "+23 448-213-807") "23.448.213.807"))
(constraint (= (f "+42 634-077-089") "42.634.077.089"))
(constraint (= (f "+42 634-077-089") "42.634.077.089"))
(constraint (= (f "+42 634-077-089") "42.634.077.089"))
(constraint (= (f "+18 051-287-382") "18.051.287.382"))
(constraint (= (f "+18 051-287-382") "18.051.287.382"))
(constraint (= (f "+18 051-287-382") "18.051.287.382"))
(constraint (= (f "+29 773-545-520") "29.773.545.520"))
(constraint (= (f "+29 773-545-520") "29.773.545.520"))
(constraint (= (f "+29 773-545-520") "29.773.545.520"))
(constraint (= (f "+43 249-097-743") "43.249.097.743"))
(constraint (= (f "+43 249-097-743") "43.249.097.743"))
(constraint (= (f "+43 249-097-743") "43.249.097.743"))
(constraint (= (f "+158 674-736-891") "158.674.736.891"))
(constraint (= (f "+158 674-736-891") "158.674.736.891"))
(constraint (= (f "+158 674-736-891") "158.674.736.891"))
(constraint (= (f "+45 124-771-454") "45.124.771.454"))
(constraint (= (f "+45 124-771-454") "45.124.771.454"))
(constraint (= (f "+45 124-771-454") "45.124.771.454"))
(constraint (= (f "+180 029-457-654") "180.029.457.654"))
(constraint (= (f "+180 029-457-654") "180.029.457.654"))
(constraint (= (f "+180 029-457-654") "180.029.457.654"))
(constraint (= (f "+75 227-250-652") "75.227.250.652"))
(constraint (= (f "+75 227-250-652") "75.227.250.652"))
(constraint (= (f "+75 227-250-652") "75.227.250.652"))
(constraint (= (f "+5 528-317-854") "5.528.317.854"))
(constraint (= (f "+5 528-317-854") "5.528.317.854"))
(constraint (= (f "+5 528-317-854") "5.528.317.854"))
(constraint (= (f "+81 849-629-290") "81.849.629.290"))
(constraint (= (f "+81 849-629-290") "81.849.629.290"))
(constraint (= (f "+81 849-629-290") "81.849.629.290"))
(constraint (= (f "+46 005-119-176") "46.005.119.176"))
(constraint (= (f "+46 005-119-176") "46.005.119.176"))
(constraint (= (f "+46 005-119-176") "46.005.119.176"))
(constraint (= (f "+108 150-380-705") "108.150.380.705"))
(constraint (= (f "+108 150-380-705") "108.150.380.705"))
(constraint (= (f "+108 150-380-705") "108.150.380.705"))
(constraint (= (f "+40 122-224-247") "40.122.224.247"))
(constraint (= (f "+40 122-224-247") "40.122.224.247"))
(constraint (= (f "+40 122-224-247") "40.122.224.247"))
(constraint (= (f "+68 890-680-027") "68.890.680.027"))
(constraint (= (f "+68 890-680-027") "68.890.680.027"))
(constraint (= (f "+68 890-680-027") "68.890.680.027"))
(constraint (= (f "+169 060-204-504") "169.060.204.504"))
(constraint (= (f "+169 060-204-504") "169.060.204.504"))
(constraint (= (f "+169 060-204-504") "169.060.204.504"))
(constraint (= (f "+95 620-820-945") "95.620.820.945"))
(constraint (= (f "+95 620-820-945") "95.620.820.945"))
(constraint (= (f "+95 620-820-945") "95.620.820.945"))
(constraint (= (f "+43 592-938-846") "43.592.938.846"))
(constraint (= (f "+43 592-938-846") "43.592.938.846"))
(constraint (= (f "+43 592-938-846") "43.592.938.846"))
(constraint (= (f "+7 023-296-647") "7.023.296.647"))
(constraint (= (f "+7 023-296-647") "7.023.296.647"))
(constraint (= (f "+7 023-296-647") "7.023.296.647"))
(constraint (= (f "+20 541-401-396") "20.541.401.396"))
(constraint (= (f "+20 541-401-396") "20.541.401.396"))
(constraint (= (f "+20 541-401-396") "20.541.401.396"))
(constraint (= (f "+64 751-365-934") "64.751.365.934"))
(constraint (= (f "+64 751-365-934") "64.751.365.934"))
(constraint (= (f "+64 751-365-934") "64.751.365.934"))
(constraint (= (f "+163 546-119-476") "163.546.119.476"))
(constraint (= (f "+163 546-119-476") "163.546.119.476"))
(constraint (= (f "+163 546-119-476") "163.546.119.476"))
(constraint (= (f "+198 557-666-779") "198.557.666.779"))
(constraint (= (f "+198 557-666-779") "198.557.666.779"))
(constraint (= (f "+198 557-666-779") "198.557.666.779"))
(constraint (= (f "+14 673-759-017") "14.673.759.017"))
(constraint (= (f "+14 673-759-017") "14.673.759.017"))
(constraint (= (f "+14 673-759-017") "14.673.759.017"))
(constraint (= (f "+161 086-020-168") "161.086.020.168"))
(constraint (= (f "+161 086-020-168") "161.086.020.168"))
(constraint (= (f "+161 086-020-168") "161.086.020.168"))
(constraint (= (f "+65 970-575-488") "65.970.575.488"))
(constraint (= (f "+65 970-575-488") "65.970.575.488"))
(constraint (= (f "+65 970-575-488") "65.970.575.488"))
(constraint (= (f "+2 455-126-377") "2.455.126.377"))
(constraint (= (f "+2 455-126-377") "2.455.126.377"))
(constraint (= (f "+2 455-126-377") "2.455.126.377"))
(constraint (= (f "+196 728-585-376") "196.728.585.376"))
(constraint (= (f "+196 728-585-376") "196.728.585.376"))
(constraint (= (f "+196 728-585-376") "196.728.585.376"))
(constraint (= (f "+33 117-430-125") "33.117.430.125"))
(constraint (= (f "+33 117-430-125") "33.117.430.125"))
(constraint (= (f "+33 117-430-125") "33.117.430.125"))
(constraint (= (f "+195 488-831-768") "195.488.831.768"))
(constraint (= (f "+195 488-831-768") "195.488.831.768"))
(constraint (= (f "+195 488-831-768") "195.488.831.768"))
(constraint (= (f "+86 468-718-108") "86.468.718.108"))
(constraint (= (f "+86 468-718-108") "86.468.718.108"))
(constraint (= (f "+86 468-718-108") "86.468.718.108"))
(constraint (= (f "+194 278-716-950") "194.278.716.950"))
(constraint (= (f "+194 278-716-950") "194.278.716.950"))
(constraint (= (f "+194 278-716-950") "194.278.716.950"))
(constraint (= (f "+43 730-685-847") "43.730.685.847"))
(constraint (= (f "+43 730-685-847") "43.730.685.847"))
(constraint (= (f "+43 730-685-847") "43.730.685.847"))
(constraint (= (f "+140 794-289-551") "140.794.289.551"))
(constraint (= (f "+140 794-289-551") "140.794.289.551"))
(constraint (= (f "+140 794-289-551") "140.794.289.551"))
(constraint (= (f "+21 679-740-834") "21.679.740.834"))
(constraint (= (f "+21 679-740-834") "21.679.740.834"))
(constraint (= (f "+21 679-740-834") "21.679.740.834"))
(constraint (= (f "+98 717-997-323") "98.717.997.323"))
(constraint (= (f "+98 717-997-323") "98.717.997.323"))
(constraint (= (f "+98 717-997-323") "98.717.997.323"))
(constraint (= (f "+47 401-100-231") "47.401.100.231"))
(constraint (= (f "+47 401-100-231") "47.401.100.231"))
(constraint (= (f "+47 401-100-231") "47.401.100.231"))
(constraint (= (f "+143 726-462-368") "143.726.462.368"))
(constraint (= (f "+143 726-462-368") "143.726.462.368"))
(constraint (= (f "+143 726-462-368") "143.726.462.368"))
(constraint (= (f "+147 864-005-968") "147.864.005.968"))
(constraint (= (f "+147 864-005-968") "147.864.005.968"))
(constraint (= (f "+147 864-005-968") "147.864.005.968"))
(constraint (= (f "+130 590-757-665") "130.590.757.665"))
(constraint (= (f "+130 590-757-665") "130.590.757.665"))
(constraint (= (f "+130 590-757-665") "130.590.757.665"))
(constraint (= (f "+197 700-858-976") "197.700.858.976"))
(constraint (= (f "+197 700-858-976") "197.700.858.976"))
(constraint (= (f "+197 700-858-976") "197.700.858.976"))
(constraint (= (f "+158 344-541-946") "158.344.541.946"))
(constraint (= (f "+158 344-541-946") "158.344.541.946"))
(constraint (= (f "+158 344-541-946") "158.344.541.946"))
(constraint (= (f "+56 242-901-234") "56.242.901.234"))
(constraint (= (f "+56 242-901-234") "56.242.901.234"))
(constraint (= (f "+56 242-901-234") "56.242.901.234"))
(constraint (= (f "+132 313-075-754") "132.313.075.754"))
(constraint (= (f "+132 313-075-754") "132.313.075.754"))
(constraint (= (f "+132 313-075-754") "132.313.075.754"))
(constraint (= (f "+130 517-953-149") "130.517.953.149"))
(constraint (= (f "+130 517-953-149") "130.517.953.149"))
(constraint (= (f "+130 517-953-149") "130.517.953.149"))
(constraint (= (f "+158 684-878-743") "158.684.878.743"))
(constraint (= (f "+158 684-878-743") "158.684.878.743"))
(constraint (= (f "+158 684-878-743") "158.684.878.743"))
(constraint (= (f "+52 836-582-035") "52.836.582.035"))
(constraint (= (f "+52 836-582-035") "52.836.582.035"))
(constraint (= (f "+52 836-582-035") "52.836.582.035"))
(constraint (= (f "+138 117-484-671") "138.117.484.671"))
(constraint (= (f "+138 117-484-671") "138.117.484.671"))
(constraint (= (f "+138 117-484-671") "138.117.484.671"))
(constraint (= (f "+50 012-148-873") "50.012.148.873"))
(constraint (= (f "+50 012-148-873") "50.012.148.873"))
(constraint (= (f "+50 012-148-873") "50.012.148.873"))
(constraint (= (f "+105 048-919-483") "105.048.919.483"))
(constraint (= (f "+105 048-919-483") "105.048.919.483"))
(constraint (= (f "+105 048-919-483") "105.048.919.483"))
(constraint (= (f "+18 209-851-997") "18.209.851.997"))
(constraint (= (f "+18 209-851-997") "18.209.851.997"))
(constraint (= (f "+18 209-851-997") "18.209.851.997"))
(constraint (= (f "+176 938-056-084") "176.938.056.084"))
(constraint (= (f "+176 938-056-084") "176.938.056.084"))
(constraint (= (f "+176 938-056-084") "176.938.056.084"))
(constraint (= (f "+141 018-132-973") "141.018.132.973"))
(constraint (= (f "+141 018-132-973") "141.018.132.973"))
(constraint (= (f "+141 018-132-973") "141.018.132.973"))
(constraint (= (f "+199 936-162-415") "199.936.162.415"))
(constraint (= (f "+199 936-162-415") "199.936.162.415"))
(constraint (= (f "+199 936-162-415") "199.936.162.415"))
(constraint (= (f "+33 547-051-264") "33.547.051.264"))
(constraint (= (f "+33 547-051-264") "33.547.051.264"))
(constraint (= (f "+33 547-051-264") "33.547.051.264"))
(constraint (= (f "+161 233-981-513") "161.233.981.513"))
(constraint (= (f "+161 233-981-513") "161.233.981.513"))
(constraint (= (f "+161 233-981-513") "161.233.981.513"))
(constraint (= (f "+115 101-728-328") "115.101.728.328"))
(constraint (= (f "+115 101-728-328") "115.101.728.328"))
(constraint (= (f "+115 101-728-328") "115.101.728.328"))
(constraint (= (f "+45 095-746-635") "45.095.746.635"))
(constraint (= (f "+45 095-746-635") "45.095.746.635"))
(constraint (= (f "+45 095-746-635") "45.095.746.635"))
(constraint (= (f "+106 769-858-438") "106.769.858.438"))
(constraint (= (f "+83 973-757-831") "83.973.757.831"))
(constraint (= (f "+62 647-787-775") "62.647.787.775"))
(constraint (= (f "+172 027-507-632") "172.027.507.632"))
(constraint (= (f "+72 001-050-856") "72.001.050.856"))
(constraint (= (f "+95 310-537-401") "95.310.537.401"))
(constraint (= (f "+6 775-969-238") "6.775.969.238"))
(constraint (= (f "+174 594-539-946") "174.594.539.946"))
(constraint (= (f "+155 927-275-860") "155.927.275.860"))
(constraint (= (f "+167 405-461-331") "167.405.461.331"))
(constraint (= (f "+10 538-347-401") "10.538.347.401"))
(constraint (= (f "+60 971-986-103") "60.971.986.103"))
(constraint (= (f "+13 258-276-941") "13.258.276.941"))
(constraint (= (f "+2 604-746-137") "2.604.746.137"))
(constraint (= (f "+25 998-898-180") "25.998.898.180"))
(constraint (= (f "+151 862-946-541") "151.862.946.541"))
(constraint (= (f "+118 165-041-038") "118.165.041.038"))
(constraint (= (f "+144 170-592-272") "144.170.592.272"))
(constraint (= (f "+94 462-008-482") "94.462.008.482"))
(constraint (= (f "+82 685-122-086") "82.685.122.086"))
(constraint (= (f "+82 675-366-472") "82.675.366.472"))
(constraint (= (f "+80 066-433-096") "80.066.433.096"))
(constraint (= (f "+163 039-436-166") "163.039.436.166"))
(constraint (= (f "+138 808-083-074") "138.808.083.074"))
(constraint (= (f "+42 643-245-738") "42.643.245.738"))
(constraint (= (f "+169 822-542-726") "169.822.542.726"))
(constraint (= (f "+176 767-782-369") "176.767.782.369"))
(constraint (= (f "+47 414-369-343") "47.414.369.343"))
(constraint (= (f "+138 885-618-512") "138.885.618.512"))
(constraint (= (f "+104 158-671-355") "104.158.671.355"))
(constraint (= (f "+188 280-087-526") "188.280.087.526"))
(constraint (= (f "+50 268-571-336") "50.268.571.336"))
(constraint (= (f "+183 225-960-024") "183.225.960.024"))
(constraint (= (f "+58 191-982-491") "58.191.982.491"))
(constraint (= (f "+9 507-092-535") "9.507.092.535"))
(constraint (= (f "+64 061-601-398") "64.061.601.398"))
(constraint (= (f "+189 831-591-877") "189.831.591.877"))
(constraint (= (f "+129 425-765-844") "129.425.765.844"))
(constraint (= (f "+94 856-734-046") "94.856.734.046"))
(constraint (= (f "+35 082-845-261") "35.082.845.261"))
(constraint (= (f "+185 394-622-272") "185.394.622.272"))
(constraint (= (f "+163 905-707-740") "163.905.707.740"))
(constraint (= (f "+23 448-213-807") "23.448.213.807"))
(constraint (= (f "+42 634-077-089") "42.634.077.089"))
(constraint (= (f "+18 051-287-382") "18.051.287.382"))
(constraint (= (f "+29 773-545-520") "29.773.545.520"))
(constraint (= (f "+43 249-097-743") "43.249.097.743"))
(constraint (= (f "+158 674-736-891") "158.674.736.891"))
(constraint (= (f "+45 124-771-454") "45.124.771.454"))
(constraint (= (f "+180 029-457-654") "180.029.457.654"))
(constraint (= (f "+75 227-250-652") "75.227.250.652"))
(constraint (= (f "+5 528-317-854") "5.528.317.854"))
(constraint (= (f "+81 849-629-290") "81.849.629.290"))
(constraint (= (f "+46 005-119-176") "46.005.119.176"))
(constraint (= (f "+108 150-380-705") "108.150.380.705"))
(constraint (= (f "+40 122-224-247") "40.122.224.247"))
(constraint (= (f "+68 890-680-027") "68.890.680.027"))
(constraint (= (f "+169 060-204-504") "169.060.204.504"))
(constraint (= (f "+95 620-820-945") "95.620.820.945"))
(constraint (= (f "+43 592-938-846") "43.592.938.846"))
(constraint (= (f "+7 023-296-647") "7.023.296.647"))
(constraint (= (f "+20 541-401-396") "20.541.401.396"))
(constraint (= (f "+64 751-365-934") "64.751.365.934"))
(constraint (= (f "+163 546-119-476") "163.546.119.476"))
(constraint (= (f "+198 557-666-779") "198.557.666.779"))
(constraint (= (f "+14 673-759-017") "14.673.759.017"))
(constraint (= (f "+161 086-020-168") "161.086.020.168"))
(constraint (= (f "+65 970-575-488") "65.970.575.488"))
(constraint (= (f "+2 455-126-377") "2.455.126.377"))
(constraint (= (f "+196 728-585-376") "196.728.585.376"))
(constraint (= (f "+33 117-430-125") "33.117.430.125"))
(constraint (= (f "+195 488-831-768") "195.488.831.768"))
(constraint (= (f "+86 468-718-108") "86.468.718.108"))
(constraint (= (f "+194 278-716-950") "194.278.716.950"))
(constraint (= (f "+43 730-685-847") "43.730.685.847"))
(constraint (= (f "+140 794-289-551") "140.794.289.551"))
(constraint (= (f "+21 679-740-834") "21.679.740.834"))
(constraint (= (f "+98 717-997-323") "98.717.997.323"))
(constraint (= (f "+47 401-100-231") "47.401.100.231"))
(constraint (= (f "+143 726-462-368") "143.726.462.368"))
(constraint (= (f "+147 864-005-968") "147.864.005.968"))
(constraint (= (f "+130 590-757-665") "130.590.757.665"))
(constraint (= (f "+197 700-858-976") "197.700.858.976"))
(constraint (= (f "+158 344-541-946") "158.344.541.946"))
(constraint (= (f "+56 242-901-234") "56.242.901.234"))
(constraint (= (f "+132 313-075-754") "132.313.075.754"))
(constraint (= (f "+130 517-953-149") "130.517.953.149"))
(constraint (= (f "+158 684-878-743") "158.684.878.743"))
(constraint (= (f "+52 836-582-035") "52.836.582.035"))
(constraint (= (f "+138 117-484-671") "138.117.484.671"))
(constraint (= (f "+50 012-148-873") "50.012.148.873"))
(constraint (= (f "+105 048-919-483") "105.048.919.483"))
(constraint (= (f "+18 209-851-997") "18.209.851.997"))
(constraint (= (f "+176 938-056-084") "176.938.056.084"))
(constraint (= (f "+141 018-132-973") "141.018.132.973"))
(constraint (= (f "+199 936-162-415") "199.936.162.415"))
(constraint (= (f "+33 547-051-264") "33.547.051.264"))
(constraint (= (f "+161 233-981-513") "161.233.981.513"))
(constraint (= (f "+115 101-728-328") "115.101.728.328"))
(constraint (= (f "+45 095-746-635") "45.095.746.635"))
(check-synth)
