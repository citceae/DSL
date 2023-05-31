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

(constraint (= (f #xA00F8AC08F2AFEF5) #x0000A00F8AC08F2A))
(constraint (= (f #x2A22876638E685B1) #x00002A22876638E6))
(constraint (= (f #xAECF58FF494C3795) #x0000AECF58FF494C))
(constraint (= (f #x5A8EF8794E10B4B3) #x00005A8EF8794E10))
(constraint (= (f #x55695C07EB2B47FF) #x000055695C07EB2B))
(constraint (= (f #x13C15D3E9A635D0C) #x2782BA7D34C6BA19))
(constraint (= (f #x6D21B287F7CD0067) #xDA43650FEF9A00CF))
(constraint (= (f #xFE73157B314F896B) #xFCE62AF6629F12D7))
(constraint (= (f #x1D2FCA7A1B32EB05) #x3A5F94F43665D60B))
(constraint (= (f #xC9C7EA318EAADBEA) #x938FD4631D55B7D5))
(constraint (= (f #xF0F0F0F0F0F0F0F2) #x0000FFFFFFFFFFFF))
(constraint (= (f #x0000000000000002) #x0000000000000000))
(constraint (= (f #xF800000000000001) #xF800000000000002))
(constraint (= (f #x0000000000000001) #x0000000000000002))
(constraint (= (f #x41CA4A990D5B8027) #x839495321AB7004F))
(constraint (= (f #xDDDC679B7FA1C65E) #x0000DDDC679B7FA1))
(constraint (= (f #x635D801EB3F0E639) #x0000635D801EB3F0))
(constraint (= (f #xE4E867F5170C2592) #x0000E4E867F5170C))
(constraint (= (f #x2285D997CE73179D) #x00002285D997CE73))
(constraint (= (f #x716101E48A709856) #x0000716101E48A70))
(constraint (= (f #x76DC50FF93AF8BC0) #xEDB8A1FF275F1781))
(constraint (= (f #x6D03939343DA0D61) #xDA07272687B41AC3))
(constraint (= (f #x990607C5DD27091E) #x0000990607C5DD27))
(constraint (= (f #xEEFCF7548A4F7673) #x0000EEFCF7548A4F))
(constraint (= (f #xF0F0F0F0F0F0F0F2) #x0000FFFFFFFFFFFF))
(constraint (= (f #xF800000000000001) #xF800000000000002))
(constraint (= (f #x0000000000000001) #x0000000000000002))
(constraint (= (f #x0000000000000002) #x0000000000000000))
(constraint (= (f #x0000000000000003) #x0000000000000007))
(constraint (= (f #xFFFFFFFFC0000001) #xFFFFFFFF80000003))
(constraint (= (f #x6BDF000000000001) #xD7BE000000000003))
(constraint (= (f #xC000000000000001) #x8000000000000003))
(constraint (= (f #xFFFC000000000001) #xFFF8000000000003))
(constraint (= (f #xFFF0000000000001) #xFFE0000000000003))
(constraint (= (f #xA000000000000001) #x4000000000000003))
(constraint (= (f #xF000000000000001) #xE000000000000003))
(constraint (= (f #x1800000000000001) #x3000000000000003))
(constraint (= (f #xA800000000000001) #x5000000000000003))

(check-synth)

