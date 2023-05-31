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

(constraint (= (f #x0a1bc5287e8e51e7) #xebc875af02e35c32))
(constraint (= (f #xece15135491a2601) #x263d5d956dcbb3fe))
(constraint (= (f #x73a10d735a6de310) #x000073a10d735a6d))
(constraint (= (f #xcc58c695cc6e6499) #x674e72d4672336ce))
(constraint (= (f #xca11792adb4456bd) #x6bdd0daa49775286))
(constraint (= (f #x8ee2d578e9e324be) #x00008ee2d578e9e3))
(constraint (= (f #x1dd80a0e3e01dc3b) #x00001dd827e64810))
(constraint (= (f #xc950cec140a665d8) #x6d5e627d7eb3344c))
(constraint (= (f #xd9c1d67e8e8ee02d) #x4c7c5302e2e23fa6))
(constraint (= (f #x952ea704c3239aec) #x0000952ea704c323))
(constraint (= (f #xe2de5e344e282aa6) #x3a43439763afaab0))
(constraint (= (f #xb60c549a0e45dbca) #x0000b60c549a0e45))
(constraint (= (f #xe5ba7aec17457586) #x0000e5ba7aec1745))
(constraint (= (f #x3e0dc7c80ac3cd99) #x00003e0e05d5d28b))
(constraint (= (f #xa7ab30201e43624d) #x0000a7abd7cb4e63))
(constraint (= (f #x7524109156a2951d) #x15b7dedd52bad5c6))
(constraint (= (f #xe63debc966983d4e) #x3384286d32cf8560))
(constraint (= (f #x11570ced4bb74978) #x000011570ced4bb7))
(constraint (= (f #xeeecca144d563a24) #x22266bd765538bb4))
(constraint (= (f #x0cb2c9e575a526b2) #x00000cb2c9e575a5))
(constraint (= (f #x1c51c7ead5b769ea) #x00001c51c7ead5b7))
(constraint (= (f #x5e31ae9338ee0dcc) #x439ca2d98e23e464))
(constraint (= (f #xe29e098951aa2ea0) #x3ac3eced5caba2bc))
(constraint (= (f #xa7d16b70d21b13be) #x0000a7d16b70d21b))
(constraint (= (f #x2ae04172b6690720) #x00002ae04172b669))
(constraint (= (f #x996625e3da63c84a) #x0000996625e3da63))
(constraint (= (f #x111b5ad5cea50cce) #x0000111b5ad5cea5))
(constraint (= (f #x91e5c88907e5d25c) #x000091e5c88907e5))
(constraint (= (f #x683cdd42905a7c95) #x2f86457adf4b06d6))
(constraint (= (f #xb845a4d29961694d) #x0000b8465d183e34))
(constraint (= (f #x0321e92b2219ee8d) #x00000321ec4d0b45))
(constraint (= (f #x8a5673ce6732c400) #xeb531863319a77fc))
(constraint (= (f #x867de93640d0ae01) #xf3042d937e5ea3fe))
(constraint (= (f #xbb0b500839ee7769) #x89e95fef8c23112e))
(constraint (= (f #x46227e3e77e5bb32) #x000046227e3e77e5))
(constraint (= (f #xb288e5873046076b) #x9aee34f19f73f12a))
(constraint (= (f #x706e576b1ed4b1ae) #x1f235129c2569ca0))
(constraint (= (f #x9983dc9e48b190c9) #x000099847622254f))
(constraint (= (f #x86ce21eac9d24aa8) #xf263bc2a6c5b6aac))
(constraint (= (f #x634a7c6ee920e8ce) #x396b07222dbe2e60))
(constraint (= (f #xc706e7732089c792) #x0000c706e7732089))
(constraint (= (f #xe5e12bea5219e622) #x0000e5e12bea5219))
(constraint (= (f #xe3384b3ea309eeed) #x0000e3392e76ee48))
(constraint (= (f #xe2905b95ee2ed7e9) #x3adf48d423a2502e))
(constraint (= (f #x4e1195e5336eee87) #x63dcd435992222f2))
(constraint (= (f #xdc91ea7d088172da) #x0000dc91ea7d0881))
(constraint (= (f #x93798e90880d1946) #x000093798e90880d))
(constraint (= (f #x3b41c034a74e523c) #x897c7f96b1635b84))
(constraint (= (f #x34e67b354e29960b) #x000034e6b01bc95e))
(constraint (= (f #x70a2ee1e75003a63) #x1eba23c315ff8b3a))
(constraint (= (f #x0637e23dbeb3395d) #x00000637e875a0f0))
(constraint (= (f #x1d15e6567c8ce1c3) #xc5d4335306e63c7a))
(constraint (= (f #x2e8c43e365a99a32) #x00002e8c43e365a9))
(constraint (= (f #x6930456bb91d1d78) #x00006930456bb91d))
(constraint (= (f #xb999e1e24d43361b) #x0000b99a9b7c2f25))
(constraint (= (f #x8a14625b388bd33d) #x00008a14ec6f9ae7))
(constraint (= (f #xd635e79aa0e61e06) #x539430cabe33c3f0))
(constraint (= (f #xa5ce2054d235bbbd) #x0000a5cec622f28a))
(constraint (= (f #xe28345e5d486c049) #x3af9743456f27f6e))
(constraint (= (f #xae099ed153e70376) #x0000ae099ed153e7))
(constraint (= (f #x870159d092ad3a73) #x00008701e0d1ec7d))
(constraint (= (f #xcdae905ec58d0418) #x0000cdae905ec58d))
(constraint (= (f #xe76a6622e1b76d33) #x0000e76b4d8d47da))
(constraint (= (f #xe7e3dc9742b2a8bb) #x303846d17a9aae8a))
(constraint (= (f #x65ec71c9ec8c678e) #x34271c6c26e730e0))
(constraint (= (f #x6392e0e67d948985) #x38da3e3304d6ecf6))
(constraint (= (f #x096b098263be5365) #xed29ecfb38835936))
(constraint (= (f #x82c3aae7993643e2) #xfa78aa30cd937838))
(constraint (= (f #xc2a9c90b2787c078) #x0000c2a9c90b2787))
(constraint (= (f #xd6c2ee755ea908e2) #x0000d6c2ee755ea9))
(constraint (= (f #x3b0e061e892a82dc) #x89e3f3c2edaafa44))
(constraint (= (f #x5659d10e801c1ec5) #x534c5de2ffc7c276))
(constraint (= (f #xe8e4975464719e9c) #x0000e8e497546471))
(constraint (= (f #x247e4464375e2786) #xb70377379143b0f0))
(constraint (= (f #xe98644a92eb9ad61) #x0000e9872e2f7362))
(constraint (= (f #x4a78445a8da36808) #x00004a78445a8da3))
(constraint (= (f #x3ece4a07ad3ee75d) #x82636bf0a5823146))
(constraint (= (f #xc3c05dd23340ade1) #x787f445b997ea43e))
(constraint (= (f #x922e15814794ee1d) #xdba3d4fd70d623c6))
(constraint (= (f #xe3870a70353c46c8) #x38f1eb1f9587726c))
(constraint (= (f #xd605554b522607cd) #x53f555695bb3f066))
(constraint (= (f #x68728a12128b45ec) #x000068728a12128b))
(constraint (= (f #xc63d606cc077b6ca) #x0000c63d606cc077))
(constraint (= (f #x765647ed98047a91) #x13537024cff70ade))
(constraint (= (f #x0b4db65be1e9892c) #x00000b4db65be1e9))
(constraint (= (f #x51623c4a4b19ceba) #x000051623c4a4b19))
(constraint (= (f #x5a854928c4e47edc) #x4af56dae76370244))
(constraint (= (f #x47ae1b3d4de3044c) #x000047ae1b3d4de3))
(constraint (= (f #xce2b3a8967339c54) #x0000ce2b3a896733))
(constraint (= (f #x6045236e3db829d4) #x3f75b923848fac54))
(constraint (= (f #x44895b72a902038e) #x76ed491aadfbf8e0))
(constraint (= (f #x6e45e2e29c5a20e0) #x23743a3ac74bbe3c))
(constraint (= (f #x2cde545959514a88) #x00002cde54595951))
(constraint (= (f #xb51ad68389d57bbc) #x0000b51ad68389d5))
(constraint (= (f #x5a47cbbe9be5e4d5) #x00005a48260667a4))
(constraint (= (f #x6eee684e1331de35) #x00006eeed73c7b7f))
(constraint (= (f #x968eeb26046ebe8e) #xd2e229b3f72282e0))
(constraint (= (f #x540539e86ebda183) #x000054058deda8a6))
(constraint (= (f #xc6e1ea2eecc2eeb9) #x723c2ba2267a228e))
(constraint (= (f #x758717e490a20b6e) #x14f1d036debbe920))

(check-synth)

