(set-logic BV)

(define-fun ehad ((x (_ BitVec 64))) (_ BitVec 64)
    (bvlshr x #x0000000000000001))
(define-fun arba ((x (_ BitVec 64))) (_ BitVec 64)
    (bvlshr x #x0000000000000004))
(define-fun shesh ((x (_ BitVec 64))) (_ BitVec 64)
    (bvlshr x #x0000000000000010))
(define-fun smol ((x (_ BitVec 64))) (_ BitVec 64)
    (bvshl x #x0000000000000001))
(define-fun im ((x (_ BitVec 64)) (y (_ BitVec 64)) (z (_ BitVec 64))) (_ BitVec 64)
    (ite (= x #x0000000000000001) y z))
(synth-fun f ((x (_ BitVec 64))) (_ BitVec 64)
    ((Start (_ BitVec 64)))
    ((Start (_ BitVec 64) (#x0000000000000000 #x0000000000000001 x (bvnot Start) (smol Start) (ehad Start) (arba Start) (shesh Start) (bvand Start Start) (bvor Start Start) (bvxor Start Start) (bvadd Start Start) (im Start Start Start)))))

(constraint (= (f #xCC7A8EA8BDF89664) #xFFFFF33857157420))
(constraint (= (f #x0B5FA486B0280BF2) #xFFFFFF4A05B794FD))
(constraint (= (f #x8F66DEAECCD804D2) #xFFFFF70992151332))
(constraint (= (f #x98BA9E89269A3BB6) #xFFFFF67456176D96))
(constraint (= (f #x551E01FA20E2DF62) #xFFFFFAAE1FE05DF1))
(constraint (= (f #x000000000000002E) #xFFFFFFFFFFFFFFFF))
(constraint (= (f #x000000000000002C) #xFFFFFFFFFFFFFFFF))
(constraint (= (f #x0000000000000038) #xFFFFFFFFFFFFFFFF))
(constraint (= (f #x0000000000000028) #xFFFFFFFFFFFFFFFF))
(constraint (= (f #x2537B2B04CE7887E) #xDAC84D4FB3187781))
(constraint (= (f #xB8584D1625B9F66C) #x47A7B2E9DA460993))
(constraint (= (f #xBD89DBCAB6EFD94E) #x42762435491026B1))
(constraint (= (f #x4DD0DC0863ED5080) #xB22F23F79C12AF7F))
(constraint (= (f #x5858A008F55FFEB8) #xA7A75FF70AA00147))
(constraint (= (f #x65AF5FCF5D6B4EA3) #xFFFFF9A50A030A29))
(constraint (= (f #x45E57E0F63E6A63D) #xFFFFFBA1A81F09C1))
(constraint (= (f #x901DA118BC6C4B1D) #xFFFFF6FE25EE7439))
(constraint (= (f #x8E72D5E6A46E42FD) #xFFFFF718D2A195B9))
(constraint (= (f #xCF2FB108DC4B3975) #xFFFFF30D04EF723B))
(constraint (= (f #x0000000000000027) #xFFFFFFFFFFFFFFFF))
(constraint (= (f #x0000000000000021) #xFFFFFFFFFFFFFFFF))
(constraint (= (f #x0000000000000025) #xFFFFFFFFFFFFFFFF))
(constraint (= (f #x000000000000003D) #xFFFFFFFFFFFFFFFF))
(constraint (= (f #x0000000000000033) #xFFFFFFFFFFFFFFFF))
(constraint (= (f #xB1381AAB5A1F4787) #xFFFFF4EC7E554A5E))
(constraint (= (f #x5FDA6347DF99BC77) #xFFFFFA0259CB8206))
(constraint (= (f #x29B0AE103A87D7B7) #xFFFFFD64F51EFC57))
(constraint (= (f #x2BC0E5A3831D2775) #xFFFFFD43F1A5C7CE))
(constraint (= (f #x92056131D64796ED) #xFFFFF6DFA9ECE29B))

(check-synth)

