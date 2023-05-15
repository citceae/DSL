from sklearn.datasets import load_boston

boston = load_boston()
data = boston['data']
target = boston['target']



from sklearn.model_selection import train_test_split
train_data,test_data,train_target,test_target = train_test_split(data,target,test_size=0.2,random_state=42)

from sklearn.preprocessing import StandardScaler
std = StandardScaler()
train_data_std = std.fit_transform(train_data)
test_data_std = std.transform(test_data)

from sklearn.neural_network import MLPRegressor
regr = MLPRegressor(solver='adam',hidden_layer_sizes=(50,50),activation='tanh',max_iter=5000).fit(train_data_std,train_target)
y_pred = regr.predict(test_data_std)

from sklearn.metrics import mean_absolute_error
error = mean_absolute_error(test_target,y_pred)
print(error)

import matplotlib.pyplot as plt
plt.figure()
plt.plot(range(len(y_pred)),y_pred,color='blue')
plt.plot(range(len(y_pred)),test_target,color='red')
plt.show()

import pickle
with open("modeltest.txt","wb") as f:
    pickle.dump(regr, f)

with open("modeltest.txt","rb") as f:
    newr = pickle.load(f)

newy = newr.predict(test_data_std)
error = mean_absolute_error(test_target,y_pred)
print(error)
