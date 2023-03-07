; https=//stackoverflow.com/questions/11604909/using-formulas-extract-an-os-version-number-from-a-variable-string/11605768%11605768
(set-logic SLIA)
(define-fun succ ((X Int) ) Int (+ 1 X ))
(define-fun pred ((X Int) ) Int (+ -1 X ))
(define-fun firstidx ((X String) (Y String) ) Int (str.indexof X Y 1 ))
(define-fun rpself ((X String) (Y String) (N Int) (M Int)) String (str.replace X (str.substr X N M) Y))
(synth-fun f ((_arg_0 String)) String 
 ( (Start String (ntString)) 
 (ntString String (
	_arg_0
	"" " " "."
	(rpself ntString ntString ntInt ntInt)
	(str.++ ntString ntString) 
	(str.replace ntString ntString ntString) 
	(str.at ntString ntInt)
	(int.to.str ntInt)
	(ite ntBool ntString ntString)
	(str.substr ntString ntInt ntInt)
)) 
 (ntInt Int (
	
	1 0 -1 1
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
(constraint (= (f "AIX 5.1") "5.1"))
(constraint (= (f "VMware ESX Server 3.5.0 build-110268") "3.5"))
(constraint (= (f "Linux Linux 2.6 Linux") "2.6"))
(constraint (= (f "Red Hat Enterprise AS 4 <2.6-78.0.13.ELlargesmp>") "2.6"))
(constraint (= (f "Microsoft <R> Windows <R> 2000 Advanced Server 1.0") "1.0"))
(constraint (= (f "Microsoft Windows XP Win2008R2 6.1.7601") "6.1"))
(check-synth)
