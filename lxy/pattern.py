'''
['set-logic', 'SLIA']
['extension', 'depth-limit']
['define-fun', 'succ', [['X', 'Int']], 'Int', ['+', ['Int', 1], 'X']]
['define-fun', 'pred', [['X', 'Int']], 'Int', ['+', ['Int', -1], 'X']]
['define-fun', 'firstidx', [['X', 'String'], ['Y', 'String']], 'Int', ['str.indexof', 'X', 'Y', ['Int', 1]]]
['define-fun', 'rpself', [['X', 'String'], ['Y', 'String'], ['N', 'Int'], ['M', 'Int']], 'String', ['str.replace', 'X', ['str.substr', 'X', 'N', 'M'], 'Y']]
['define-fun', 'getprefix', [['X', 'String'], ['Y', 'Int']], 'String', ['str.substr', 'X', ['Int', 0], 'Y']]
['define-fun', 'getsuffix', [['X', 'String'], ['Y', 'Int']], 'String', ['str.substr', 'X', 'Y', ['str.len', 'X']]]
['define-fun', 'doublerp', [['X', 'String'], ['Y', 'String'], ['Z', 'String'], ['P', 'String'], ['Q', 'String']], 'String', ['str.replace', ['str.replace', 'X', 'Y', 'Z'], 'P', 'Q']]
['synth-fun', 'f', [['_arg_0', 'String']], 'String', [['Start', 'String', ['ntString']], ['ntString', 'String', ['_arg_0', ['String', ''], ['String', ' '], ['String', '/n'], ['getprefix', 'ntString', 'ntInt'], ['doublerp', 'ntString', 'ntString', 'ntString', 'ntString', 'ntString'], ['str.replace', 'ntString', 'ntString', 'ntString'], ['str.at', 'ntString', 'ntInt'], ['ite', 'ntBool', 'ntString', 'ntString'], ['str.++', 'ntString', 'ntString'], ['str.substr', 'ntString', 'ntInt', 'ntInt'], ['int.to.str', 'ntInt']]], ['ntInt@10', 'Int', [['succ', 'ntInt'], ['firstidx', 'ntString', 'ntString'], ['str.len', 'ntString'], ['str.indexof', 'ntString', 'ntString', 'ntInt'], ['+', 'ntInt', 'ntInt'], ['-', 'ntInt', 'ntInt'], ['str.to.int', 'ntString']]], ['ntBool', 'Bool', [['=', 'ntInt', 'ntInt'], ['str.prefixof', 'ntString', 'ntString'], ['str.suffixof', 'ntString', 'ntString'], ['str.contains', 'ntString', 'ntString']]]]]
['constraint', ['=', ['f', ['String', 'This is a <string>, It should be <changed> to <a> number.']], ['String', 'This is a string, It should be changed to a number.']]]
['constraint', ['=', ['f', ['String', 'a < 4 and a > 0']], ['String', 'a  4 and a  0']]]
['check-synth']
'''
#str.++ (str.++ S S) S
#str.++ (str.substr p0 0 N）(str.substr p0)
#substr p0 str.len(p0)
#1 2 -1 8 5 2 -1 6  - 683 str.substr p0 (+ (str.indexof p0 S N) N) N 
#str.substr p0 (- 1) N   / str.substr p0 (- N 1) N
#1 3  - 939 str.substr p0 0 N 取前缀
#1 4  - 852 str.substr p0 1 N/ str.substr p0 N 1
#1 3 -1 4  - 434 substr S 0 1 取首字符
#1 8 5 2 -1 6  - 731 substr S (+ str.index p0 S N)
#5 2 -1 6 -1 4  - 526 str.indexof p0 S 1
# + 1 N
#8 5 2 -1 6  - 839 + (str.indexof p0 S N) N
# + -1 N
#9 5 2 -1 6  - 414 - (str.indexof p0 S N) N