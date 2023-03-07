; https=//stackoverflow.com/questions/25239569/excel-function-to-match-a-substring-from-text-with-a-list
(set-logic SLIA)
(define-fun succ ((X Int) ) Int (+ 1 X ))
(define-fun pred ((X Int) ) Int (+ -1 X ))
(define-fun firstidx ((X String) (Y String) ) Int (str.indexof X Y 1 ))
(define-fun rpself ((X String) (Y String) (N Int) (M Int)) String (str.replace X (str.substr X N M) Y))
(synth-fun f ((_arg_0 String)) String 
 ( (Start String (ntString)) 
 (ntString String (
	_arg_0
	"" " " "BRD" "DRS" "LDS" "Branding" "Direct Response" "Leads"
	(rpself ntString ntString ntInt ntInt)
	(str.++ ntString ntString) 
	(str.replace ntString ntString ntString) 
	(str.at ntString ntInt)
	(int.to.str ntInt)
	(ite ntBool ntString ntString)
	(str.substr ntString ntInt ntInt)
)) 
 (ntInt Int (
	
	1 0 -1
	(succ ntInt)
	(pred ntInt)
	(firstidx ntString ntString)
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
)) ))
(constraint (= (f "Adf_ROCLeader_BAN_728x90_CPM_STD _BRD _NRT_DCK") "Adf_ROCLeader_BAN_728x90_CPM_STD _Branding _NRT_DCK"))
(constraint (= (f "MMC_ContextualLarRec_BAN_336x280_CPM_STD _LDS _RTG_DCK") "MMC_ContextualLarRec_BAN_336x280_CPM_STD _Leads _RTG_DCK"))
(constraint (= (f "Adf_ROC_DLBD_728x90_CPM_STD_DRS_NRT_NOR_DCK") "Adf_ROC_DLBD_728x90_CPM_STD_Direct Response_NRT_NOR_DCK"))
(check-synth)
