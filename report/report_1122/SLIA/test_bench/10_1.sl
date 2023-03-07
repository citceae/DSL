; https=//stackoverflow.com/questions/38871714/excel-vba-how-to-remove-substrings-from-a-cell
(set-logic SLIA)
(define-fun succ ((X Int) ) Int (+ 1 X ))
(define-fun pred ((X Int) ) Int (+ -1 X ))
(define-fun firstidx ((X String) (Y String) ) Int (str.indexof X Y 1 ))
(define-fun rpself ((X String) (Y String) (N Int) (M Int)) String (str.replace X (str.substr X N M) Y))
(synth-fun f ((_arg_0 String) (_arg_1 String)) String 
 ( (Start String (ntString)) 
 (ntString String (
	_arg_0 _arg_1
	"" " " "_"
	(rpself ntString ntString ntInt ntInt)
)) 
 (ntInt Int (
	
	1 0 -1
	(succ ntInt)
	(firstidx ntString ntString)
)) 
 (ntBool Bool (
	
	true false
)) ))
(constraint (= (f "ann chang" "achang_maaker.com") "achang"))
(constraint (= (f "bobby smith" "bobt_sphynx.uk.co") "bobt"))
(constraint (= (f "art lennox" "art.lennox_svxn.com") "art.lennox"))
(check-synth)
(define-fun f_1 ((_arg_0 String) (_arg_1 String)) String (str.substr _arg_1 0 (str.indexof _arg_1 "_" 1)))
