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

(constraint (= (f #xc42992853cde8633) #x8853250a79bd0c66))
(constraint (= (f #x808d0e32bb2eeb12) #x011a1c65765dd624))
(constraint (= (f #x58bd008a4ee369e1) #x58bd008a4ee369e1))
(constraint (= (f #x21eba4ed54b0d81d) #x43d749daa961b03a))
(constraint (= (f #x1a7420b8d6d47d6e) #x34e84171ada8fadc))
(constraint (= (f #x25a117036b39c484) #x0000000000000001))
(constraint (= (f #xb4470ec910a3e605) #x0000000000000001))
(constraint (= (f #xe84a47363a7021d4) #xd0948e6c74e043a8))
(constraint (= (f #xea022ce03aa31bbc) #x0000000000000001))
(constraint (= (f #x73bdd7424cae1a7d) #xe77bae84995c34fa))
(constraint (= (f #x6390294319d70ea8) #x6390294319d70ea8))
(constraint (= (f #x4e39e7ed9de1de7e) #x4e39e7ed9de1de7e))
(constraint (= (f #x14b583ce707c1b7a) #x296b079ce0f836f4))
(constraint (= (f #xa5b2e55260c29368) #x4b65caa4c18526d0))
(constraint (= (f #x6ba0d38a1de7e538) #x6ba0d38a1de7e538))
(constraint (= (f #x56bc5767c160ee8a) #xad78aecf82c1dd14))
(constraint (= (f #x38b856a5a5321722) #x7170ad4b4a642e44))
(constraint (= (f #xe1a7914914d71e90) #xe1a7914914d71e90))
(constraint (= (f #x725d5d5965c349ec) #x725d5d5965c349ec))
(constraint (= (f #x790890a73d7caee6) #xf211214e7af95dcc))
(constraint (= (f #x83ee3383935e1ac5) #x07dc670726bc358a))
(constraint (= (f #xc8285d2737699938) #xc8285d2737699938))
(constraint (= (f #x894485e91ce5e707) #x894485e91ce5e707))
(constraint (= (f #xd80a8756a583397e) #x0000000000000001))
(constraint (= (f #xe8ceb8b5058bd8bb) #x0000000000000001))
(constraint (= (f #x4dd3890b4de3b921) #x4dd3890b4de3b921))
(constraint (= (f #x73e67dae99c07365) #xe7ccfb5d3380e6ca))
(constraint (= (f #xd511d1ed7a84ee0c) #xaa23a3daf509dc18))
(constraint (= (f #xce86555aa3e6323b) #x9d0caab547cc6476))
(constraint (= (f #xb4716e9168e4d985) #x68e2dd22d1c9b30a))
(constraint (= (f #x8a6ecebde7e82e0e) #x14dd9d7bcfd05c1c))
(constraint (= (f #x0aeb330c2ea342ae) #x0000000000000001))
(constraint (= (f #x8397e399ba2e7ae9) #x072fc733745cf5d2))
(constraint (= (f #xdde96a91e9db125e) #xdde96a91e9db125e))
(constraint (= (f #xdd43b44d258b745d) #x0000000000000001))
(constraint (= (f #x9518756e50a0beb7) #x2a30eadca1417d6e))
(constraint (= (f #x517ad63edcc8a5dc) #xa2f5ac7db9914bb8))
(constraint (= (f #x808eb60d6a75d8cb) #x808eb60d6a75d8cb))
(constraint (= (f #x9ceb1b77a20ee72e) #x39d636ef441dce5c))
(constraint (= (f #xde4e30d97b3ac3ae) #xbc9c61b2f675875c))
(constraint (= (f #x69239215ade22bc4) #xd247242b5bc45788))
(constraint (= (f #xd68761301774e460) #xad0ec2602ee9c8c0))
(constraint (= (f #x1e2896d147b21c3d) #x3c512da28f64387a))
(constraint (= (f #x32400b738649223b) #x32400b738649223b))
(constraint (= (f #x64b3c7a0cd436eb9) #x64b3c7a0cd436eb9))
(constraint (= (f #x555536b73aedb5e9) #x555536b73aedb5e9))
(constraint (= (f #x565e239edeee2619) #xacbc473dbddc4c32))
(constraint (= (f #xd083e2ba80aee0ca) #xa107c575015dc194))
(constraint (= (f #x735a08c274923e38) #xe6b41184e9247c70))
(constraint (= (f #xbe6531ad2e9652e3) #x7cca635a5d2ca5c6))
(constraint (= (f #x8be3aec395468e2b) #x17c75d872a8d1c56))
(constraint (= (f #x2a2e4296bec5101a) #x2a2e4296bec5101a))
(constraint (= (f #xb36460c791e723c5) #xb36460c791e723c5))
(constraint (= (f #x99d3c571dedb9e2a) #x99d3c571dedb9e2a))
(constraint (= (f #x9851de1201483ae6) #x30a3bc24029075cc))
(constraint (= (f #xd02e83422e0d9e03) #x0000000000000001))
(constraint (= (f #xd655c36144e0e18a) #xacab86c289c1c314))
(constraint (= (f #x67d6babe5ee53362) #x67d6babe5ee53362))
(constraint (= (f #xe2ab2341469e0540) #xc55646828d3c0a80))
(constraint (= (f #x41c2d53826aee8ee) #x8385aa704d5dd1dc))
(constraint (= (f #x16aa5aa3147cee24) #x2d54b54628f9dc48))
(constraint (= (f #x4d207c4ce5e465c8) #x9a40f899cbc8cb90))
(constraint (= (f #x6a9685145ae87e38) #xd52d0a28b5d0fc70))
(constraint (= (f #x39eb8ac30373be86) #x39eb8ac30373be86))
(constraint (= (f #x4215e4cbee6a5d1c) #x842bc997dcd4ba38))
(constraint (= (f #x4b9ce2b25e25943e) #x0000000000000001))
(constraint (= (f #x4be3ee2c5c10c748) #x97c7dc58b8218e90))
(constraint (= (f #x58e5e892eb56b380) #xb1cbd125d6ad6700))
(constraint (= (f #x5be131e4b27b517e) #x5be131e4b27b517e))
(constraint (= (f #xe9849a93aa8116e3) #x0000000000000001))
(constraint (= (f #x82de15aad3c89da3) #x05bc2b55a7913b46))
(constraint (= (f #x3b88d17188641ce2) #x7711a2e310c839c4))
(constraint (= (f #x9eee8d06d97e6b3a) #x3ddd1a0db2fcd674))
(constraint (= (f #x5e7b2a1ae03e8109) #xbcf65435c07d0212))
(constraint (= (f #x4aeb886a9e3e776a) #x95d710d53c7ceed4))
(constraint (= (f #x3c0c28d81e8b4134) #x0000000000000001))
(constraint (= (f #x4601a9bc02d6a28a) #x8c03537805ad4514))
(constraint (= (f #x50ab6b3b38a3e29e) #x0000000000000001))
(constraint (= (f #x1d52194819a35e9c) #x0000000000000001))
(constraint (= (f #xcd09e82377bebb5e) #x9a13d046ef7d76bc))
(constraint (= (f #x8d9ec24167db3526) #x8d9ec24167db3526))
(constraint (= (f #x48ab9819d0d49e6a) #x91573033a1a93cd4))
(constraint (= (f #xe3ed4e6ab80e7e28) #xc7da9cd5701cfc50))
(constraint (= (f #xe6cca82b2c4d4b39) #xe6cca82b2c4d4b39))
(constraint (= (f #xa58e9d9e8db808aa) #x4b1d3b3d1b701154))
(constraint (= (f #x6d7e0e786ba1c925) #x0000000000000001))
(constraint (= (f #x9d6162bb7709b849) #x0000000000000001))
(constraint (= (f #xea2a3091b173792e) #xea2a3091b173792e))
(constraint (= (f #x5bdd7d47a9c976ec) #x5bdd7d47a9c976ec))
(constraint (= (f #xd4ea0e4a5900ab84) #xa9d41c94b2015708))
(constraint (= (f #xba63be5e983348c2) #x0000000000000001))
(constraint (= (f #x4de19608e4a13c9e) #x0000000000000001))
(constraint (= (f #x763eb6c1ca292e01) #x0000000000000001))
(constraint (= (f #x0c13c436959e8e69) #x1827886d2b3d1cd2))
(constraint (= (f #x4750eb3516474ee1) #x4750eb3516474ee1))
(constraint (= (f #x0537897b15d1adeb) #x0537897b15d1adeb))
(constraint (= (f #xb8aa6a28a28b31d3) #x0000000000000001))
(constraint (= (f #x8deeb433b3126272) #x1bdd68676624c4e4))
(constraint (= (f #xad13cc6e1c446a04) #x5a2798dc3888d408))
(constraint (= (f #xe3383886b15907d5) #xe3383886b15907d5))

(check-synth)

