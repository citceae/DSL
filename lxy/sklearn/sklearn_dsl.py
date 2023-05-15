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
    #if re_d[-1]>1000 or re_d[-1]<0.001:
    #    continue
    re_data.append(re_d)

arr_data = np.array(re_data)
#print(arr_data[0][32])


feature = arr_data[:,1:33]#后面不要了被正规化太蠢了
#print(feature[0])
target = arr_data[:,-1]
#print(feature.shape)
#print(target.shape)


from sklearn.model_selection import train_test_split
train_data,test_data,train_target,test_target = train_test_split(feature,target,test_size=0.2,random_state=42)


from sklearn.preprocessing import StandardScaler
std = StandardScaler()
train_data_std = std.fit_transform(train_data)
#train_data_std = train_data
test_data_std = std.transform(test_data)
#test_data_std = test_data

from sklearn.neural_network import MLPRegressor
regr = MLPRegressor(solver='adam',hidden_layer_sizes=(500,500),activation='tanh',max_iter=500000).fit(train_data_std,train_target)
y_pred = regr.predict(test_data_std)
#y_test = regr.predict(test_data_std[0].reshape(1,-1))
#print(y_test)
#quit()

#a = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0]
#a = np.array(a)
#y_test = regr.predict(a.reshape(1,-1))
#print(y_test)


from sklearn.metrics import mean_absolute_error
error = mean_absolute_error(test_target,y_pred)

with open("tmp","w") as f:
    for i in range(len(y_pred)):
        f.write(str(y_pred[i])+' '+str(test_target[i])+'\n')

print(error)

import matplotlib.pyplot as plt
plt.figure()
plt.plot(range(len(y_pred)),y_pred,color='blue')
plt.plot(range(len(y_pred)),test_target,color='red')
plt.show()

import pickle
with open("modeldsl","wb") as f:
    pickle.dump(regr, f)

with open('stddsl','wb') as f:
    pickle.dump(std,f)
 

#with open("modeldsl","rb") as f:
#    newr = pickle.load(f)