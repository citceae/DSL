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

feature = arr_data[:,1:-1]#非正规化 保留
#print(feature[0])
#quit()
#feature = arr_data[:,1:33]#后面不要了被正规化太蠢了
target = arr_data[:,-1]


from sklearn.model_selection import train_test_split
train_data,test_data,train_target,test_target = train_test_split(feature,target,test_size=0.2,random_state=42)

params = {
    "n_estimators": 500,
    "max_depth": 4,
    "min_samples_split": 5,
    "learning_rate": 0.01,
    "loss": "squared_error",
}

from sklearn import ensemble
reg = ensemble.GradientBoostingRegressor(**params)
reg.fit(train_data, train_target)

from sklearn.metrics import mean_squared_error

mse = mean_squared_error(test_target, reg.predict(test_data))
print("The mean squared error (MSE) on test set: {:.4f}".format(mse))

test_score = np.zeros((params["n_estimators"],), dtype=np.float64)
for i, y_pred in enumerate(reg.staged_predict(test_data)):
    test_score[i] = mean_squared_error(test_target, y_pred)

import matplotlib.pyplot as plt

fig = plt.figure(figsize=(6, 6))
plt.subplot(1, 1, 1)
plt.title("Deviance")
plt.plot(
    np.arange(params["n_estimators"]) + 1,
    reg.train_score_,
    "b-",
    label="Training Set Deviance",
)
plt.plot(
    np.arange(params["n_estimators"]) + 1, test_score, "r-", label="Test Set Deviance"
)
plt.legend(loc="upper right")
plt.xlabel("Boosting Iterations")
plt.ylabel("Deviance")
fig.tight_layout()
plt.show()

with open("tmp","w") as f:
    for i in range(len(y_pred)):
        f.write(str(y_pred[i])+' '+str(test_target[i])+'\n')

import pickle
with open("gbreg","wb") as f:
    pickle.dump(reg, f)