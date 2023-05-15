(set-logic SLIA)
(define-fun succ ((X Int) ) Int (+ 1 X ))
(define-fun pred ((X Int) ) Int (+ -1 X )) 
(define-fun firstidx ((X String) (Y String) ) Int (str.indexof X Y 1 )) 
(define-fun idxplus ((X String) (Y String) (P Int) (Q Int)) Int (+ (str.indexof X Y P) Q)) 
(define-fun idxminus ((X String) (Y String) (P Int) (Q Int)) Int (- (str.indexof X Y P) Q)) 
(define-fun getfirst ((X String)) String (str.substr X 0 1))
(define-fun getprefix ((X String) (Y Int)) String (str.substr X 0 Y))
(define-fun getsuffix ((X String) (Y Int)) String (str.substr X Y (str.len X)))
(define-fun getprefixone ((X String) (Y Int)) String (str.substr X 1 Y))
(define-fun doubleconcat ((X String) (Y String) (Z String)) String (str.++ (str.++ X Y) Z))
(define-fun sesuffix ((X String) (Y String) (P Int) (Q Int) (R Int)) String (str.substr X (+ (str.indexof X Y P) Q) R))
(define-fun lasuffix ((X String) (Y Int) (Z Int)) String (str.substr X (- Y 1) Z))
(define-fun subsconcat ((X String) (Y Int) (P Int) (Q Int)) String (str.++ (str.substr X 0 Y) (str.substr X P Q)))
(define-fun rpself ((X String) (Y String) (N Int) (M Int)) String (str.replace X (str.substr X N M) Y))
(define-fun doublerp ((X String) (Y String) (Z String) (P String) (Q String)) String (str.replace (str.replace X Y Z) P Q ))
(synth-fun f ((_arg_0 String)) String 
 ( (Start String (ntString)) 
 (ntString String (
	_arg_0	"" " " "."
	(doubleconcat ntString ntString ntString)
	(sesuffix ntString ntString ntInt ntInt ntInt)
	(lasuffix ntString ntInt ntInt)
	(str.++ ntString ntString)
	(str.replace ntString ntString ntString)
	(ite ntBool ntString ntString)
))
 (ntInt Int (
	1 0 -1
	(firstidx ntString ntString)
	(idxplus ntString ntString ntInt ntInt)
	(- ntInt ntInt)
	(str.len ntString)
))
 (ntBool Bool (
	true false
	(= ntInt ntInt)
	(str.suffixof ntString ntString)
))
))
(constraint (= (f "AIX 5.1") "5.1"))
(constraint (= (f "VMware ESX Server 3.5.0 build-110268") "3.5"))
(constraint (= (f "Linux Linux 2.6 Linux") "2.6"))
(constraint (= (f "Red Hat Enterprise AS 4 <2.6-78.0.13.ELlargesmp>") "2.6"))
(constraint (= (f "Microsoft <R> Windows <R> 2000 Advanced Server 1.0") "1.0"))
(constraint (= (f "Microsoft Windows XP Win2008R2 6.1.7601") "6.1"))
(check-synth)
