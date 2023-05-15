import csv
import numpy as np

data = []
with open('data.csv',encoding='utf-8') as f:
    for row in csv.reader(f,skipinitialspace=True):
        data.append(row)


re_data = []
for d in data:
    re_d = []
    for s in d:
        if '.' in s:
            re_d.append(float(s))
        else:
            re_d.append(int(s))
    re_data.append(re_d)

arr_data = np.array(re_data)

feature = arr_data[:,1:33]#非正规化 保留
#print(feature[0])
#quit()
#feature = arr_data[:,1:33]#后面不要了被正规化太蠢了
target = arr_data[:,-1]


from sklearn.model_selection import train_test_split
train_data,test_data,train_target,test_target = train_test_split(feature,target,test_size=0.2,random_state=42)

from sklearn.preprocessing import StandardScaler
std = StandardScaler()
train_data_std = std.fit_transform(train_data)
#train_data_std = train_data
test_data_std = std.transform(test_data)

from sklearn import svm
reg = svm.SVR(kernel='sigmoid').fit(train_data_std,train_target)


from sklearn.metrics import mean_squared_error

mse = mean_squared_error(test_target, reg.predict(test_data))
print("The mean squared error (MSE) on test set: {:.4f}".format(mse))
mse0 = mean_squared_error(train_target, reg.predict(train_data))
print("The mean squared error (MSE) on train set: {:.4f}".format(mse0))

y_pred = reg.predict(test_data)

with open("tmp","w") as f:
    for i in range(len(y_pred)):
        f.write(str(y_pred[i])+' '+str(test_target[i])+'\n')

import pickle
with open("linreg","wb") as f:
    pickle.dump(reg, f)