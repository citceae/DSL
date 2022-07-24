(set-logic SLIA)
(define-fun doublestr ((x String) (s String) (t String)) String (str.++ (str.++ x s) t))
(define-fun fourstr ((x String) (s String) (t String) (q String) (l String)) String (str.++ (str.++ (str.++ (str.++ x s) t) q) l))
(define-fun xstr ((x String) (s String) (t String) (q String)) String (str.++ (str.replace x s t) q))
(synth-fun f ((_arg_0 String) (_arg_1 String) (_arg_2 String)) String 
(
 (Start String(
    ntString
))
 (ntString String(
    _arg_0 _arg_1 _arg_2 "" " " "/n"
    (str.++ ntString ntString)
    (str.replace ntString ntString ntString)
    (str.at ntString ntInt)
    (int.to.str ntInt)
    (doublestr ntString ntString ntString)
    (fourstr ntString ntString ntString ntString ntString)
    (xstr ntString ntString ntString ntString)
))
 (ntInt Int(
    1 0 -1
    (+ ntInt ntInt)
    (- ntInt ntInt)
    (str.len ntString)
    (str.to.int ntString)
    (str.indexof ntString ntString ntInt)
))
 (ntBool Bool(
    true
    (= ntInt ntInt)
    (str.contains ntString ntString)
))
)
)
(constraint (= (f "Traci Brown" "1301 Robinson Court" "Saginaw, MI 48607") "Traci Brown/n1301 Robinson Court/nSaginaw, MI 48607"))
(constraint (= (f "Mary Hannan" "1195 Amethyst Drive" "Lansing, MI 48933") "Mary Hannan/n1195 Amethyst Drive/nLansing, MI 48933"))
(constraint (= (f "Linda Thomas" "2479 North Bend Road" "Allen, KY 41601") "Linda Thomas/n2479 North Bend Road/nAllen, KY 41601"))
(check-synth)


