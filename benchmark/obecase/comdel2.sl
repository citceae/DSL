(set-logic SLIA)
(synth-fun f ((_arg_0 String)) String 
 ( (Start String (ntString)) 
 (ntString String (
	_arg_0 
	"" " "
	(str.at ntString ntInt)
)) 
 (ntInt Int (
	
	ntIntx ntInty
	(+ ntIntx ntInty)
)) 
 (ntIntx Int (
	
	3 4
    	(+ ntIntx ntIntx)
))
 (ntInty Int (
	
	1 2
	(+ ntInty ntInty)
))
 ))
(constraint (= (f "xNNNNNNNNNNNNNNNNNNNNNN") "N"))
(constraint (= (f "xxSSSSSSSSSSSSSSSSSSSSS") "S"))
(constraint (= (f "xxxpppppppppppppppppppp") "p"))
(constraint (= (f "xxxxNNNNNNNNNNNNNNNNNNN") "N"))
(constraint (= (f "xxxxxSSSSSSSSSSSSSSSSSS") "S"))
(constraint (= (f "xxxxxxppppppppppppppppp") "p"))
(constraint (= (f "xxxxxxxNNNNNNNNNNNNNNNN") "N"))
(constraint (= (f "xxxxxxxxSSSSSSSSSSSSSSS") "S"))
(constraint (= (f "xxxxxxxxxoooooooooooooo") "o"))
(constraint (= (f "xxxxxxxxxxooooooooooooo") "o"))
(constraint (= (f "xxxxxxxxxxxoooooooooooo") "o"))
(constraint (= (f "xxxxxxxxxxxxooooooooooo") "o"))
(constraint (= (f "xxxxxxxxxxxxxoooooooooo") "o"))
(constraint (= (f "xxxxxxxxxxxxxxooooooooo") "o"))
(constraint (= (f "xxxxxxxxxxxxxxxoooooooo") "o"))
(constraint (= (f "xxxxxxxxxxxxxxxxooooooo") "o"))
(constraint (= (f "xxxxxxxxxxxxxxxxxoooooo") "o"))
(constraint (= (f "xxxxxxxxxxxxxxxxxxooooo") "o"))
(constraint (= (f "xxxxxxxxxxxxxxxxxxxoooo") "o"))
(constraint (= (f "xxxxxxxxxxxxxxxxxxxxooo") "o"))
(constraint (= (f "xxxxxxxxxxxxxxxxxxxxxoo") "o"))
(constraint (= (f "xxxxxxxxxxxxxxxxxxxxxxo") "o"))
(check-synth)
