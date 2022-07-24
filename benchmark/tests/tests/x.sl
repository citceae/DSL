(set-logic SLIA)
(extension depth-limit)
(define-fun tristr ((x String) (s String) (t String) (q String)) String (str.++ (str.++ (str.++ x s) t) q))
(synth-fun f ((_arg_0 String) (_arg_1 String) (_arg_2 String)) String
(
 (Start String(
    ntString
))
 (ntString String(
    _arg_0 _arg_1 _arg_2 "" " " "/n"
    (str.++ ntString@4 ntString@1)
    (str.at ntString@1 ntInt)
    (int.to.str ntInt)
    (ite ntBool ntString@0 ntString)
    (str.substr ntString@0 ntInt ntInt)
    (tristr ntString@0 ntString ntString ntString)
))
 (ntInt Int(
    1 0 -1
    (- ntInt ntInt)
    (str.len ntString)
    (str.to.int ntString)
    (ite ntBool ntInt ntInt)
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



