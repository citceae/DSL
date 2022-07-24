import generator
import os
import sys
import numpy as np

tests_home = os.path.abspath("tests")
outs_home = os.path.abspath("outs")
run_home = os.path.abspath("../ISTool-main/build/executor/run_sygus")

n = 22

def getname(X):#string s
    s  = ''
    for i in range(len(X)):
        if (X[i] == 1):
            s = s + '1'
        else:
            s = s + '0'
    return s

def dealdsl(X):
    dsl = generator.DSL()
    for i in range(len(X)):
        if (X[i] == 1):
            dsl.dsldeal(generator.opdict[i+1])
        else:
            pass
    dsl.printDSL(0)

def f(X):
    idx = 0
    for i in range(len(X)):
        idx += 2**i * X[i]
    #print(idx)
    idx = int(idx)

    output = sys.stdout
    generator.initial()
    tests_id = getname(X)
    tmptest=open("%s/%s.sl"%(tests_home,tests_id),'w+')
    sys.stdout = tmptest
    dealdsl(X)
    tmptest.close()
    sys.stdout = output

    
    tests_name = tests_home + "/" + tests_id + ".sl"
    outs_name = outs_home + "/" + tests_id + ".out"
    #print(outs_name)
    if not (os.path.exists(outs_name)):
        cmdstr = "{runname} {testsname} {outsname} {solvername}".format(runname = run_home,testsname = tests_name, outsname = outs_name, solvername = "vsa")
        print(cmdstr)
        os.system(cmdstr)
    if not (os.path.exists(outs_name)):
        value = np.float64(1145141919)
    else:
        tmpouts = open(outs_name,'r')
        lines = tmpouts.readlines()
        value = np.float64(lines[1])
        tmpouts.close()

    return -value

if __name__ == "__main__":
    X_sample = []
    Y_sample = []
    for i in range(20):
        rd = np.random.rand(n)
        x = rd.round().astype(int)
        y = f(x)
        X_sample.append(x)
        Y_sample.append(y)
        print("iter:",i,",",y," max:",np.max(Y_sample))

    for i in range(len(X_sample)):
        print(i,X_sample[i],Y_sample[i])
    print(np.max(Y_sample))
    print("X:",X_sample[Y_sample.index(max(Y_sample))])

