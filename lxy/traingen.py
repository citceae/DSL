import os

for i in range(22,41):
    print("start " + str(i) + ':')
    cmdline = '/home/citceae/ISTool0109max/ISTool/build/executor/test /home/citceae/DSL/lxy/origin/{}.sl > /home/citceae/DSL/lxy/trainset/{}.out'.format(str(i),str(i))
    os.system(cmdline)