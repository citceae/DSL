import numpy as np
import itertools
import generator
import os
import sys
tests_home = os.path.abspath("tests")
outs_home = os.path.abspath("outs")
run_home = os.path.abspath("../ISTool-main/build/executor/run_sygus")
#%matplotlib inline



n = 22 #dimension
bounds = np.array([0.0,1.0]*n).reshape(-1,2)
noise = 0

# def f(X, noise=noise):
#     X1 = X[:,0]
#     X2 = X[:,1]
#     return -np.sin(3*X1) + np.cos(5*X2) + X1**2 + X2**2 + 0.7*X1 -0.9*X2 + noise * np.random.randn(*X1.shape)

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



def f(X, noise = noise):
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
    


#Y_cnt = 2**n


import matplotlib.pyplot as plt

# Dense grid of points within bounds
# X1 = np.arange(bounds[0, 0], bounds[0, 1], 0.01)
# X2 = np.arange(bounds[1, 0], bounds[1, 1], 0.01)
# X = itertools.product(X1,X2)
# X = [list(i) for i in X]
# X = np.array(X)

zo = [0,1]
X = itertools.product(zo,repeat=n)
X = [list(i) for i in X]
X = np.array(X)

# Noise-free objective function values at X 
#Y = np.random.rand(Y_cnt)

#X_init = np.array([[0,0,0,0,0,0,0,0], [0,1,0,0,0,1,0,1]])
#Y_init = np.array([f(X_init[i],Y) for i in range(len(X_init))]).reshape(-1,1)

X_init = np.array([[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,1,0,0,0,0,0,1,0,0,0,0,1,0,1,0,0,1,0,0,0]])
Y_init = np.array([f(X_init[i]) for i in range(len(X_init))]).reshape(-1,1)

# Plot optimization objective with noise level 高维可视化？
#plt.plot(X, Y, 'y--', lw=2, label='Noise-free objective')
#plt.plot(X, f(X), 'bx', lw=1, alpha=0.1, label='Noisy samples')
#plt.plot(X_init, Y_init, 'kx', mew=3, label='Initial samples')
#plt.legend()

#plt.show()

from scipy.stats import norm

def expected_improvement(X, X_sample, Y_sample, gpr, xi=0.01):
    '''
    Computes the EI at points X based on existing samples X_sample
    and Y_sample using a Gaussian process surrogate model.
    
    Args:
        X: Points at which EI shall be computed (m x d).
        X_sample: Sample locations (n x d).
        Y_sample: Sample values (n x 1).
        gpr: A GaussianProcessRegressor fitted to samples.
        xi: Exploitation-exploration trade-off parameter.
    
    Returns:
        Expected improvements at points X.
    '''
    mu, sigma = gpr.predict(X, return_std=True)
    mu_sample = gpr.predict(X_sample)
    #print(mu)
    #print("sigma",sigma)
    sigma = sigma.reshape(-1, 1)
    #print(sigma)
    
    # Needed for noise-based model,
    # otherwise use np.max(Y_sample).
    # See also section 2.4 in [1]
    mu_sample_opt = np.max(mu_sample)
    #print(mu_sample_opt)

    with np.errstate(divide='warn'):
        imp = mu - mu_sample_opt - xi
        #print(imp)
        Z = imp / sigma
        #print(Z)
        ei = imp * norm.cdf(Z) + sigma * norm.pdf(Z)
        #print(sigma)
        #print(sigma == 0.0)
        ei[sigma == 0.0] = 0.0

    #print(ei)
    return ei

from scipy.optimize import minimize

def propose_location(acquisition, X_sample, Y_sample, gpr, n, n_restarts=25, n_search = 10):
    '''
    Proposes the next sampling point by optimizing the acquisition function.
    
    Args:
        acquisition: Acquisition function.
        X_sample: Sample locations (n x d).
        Y_sample: Sample values (n x 1).
        gpr: A GaussianProcessRegressor fitted to samples.

    Returns:
        Location of the acquisition function maximum.
    '''
    dim = X_sample.shape[1]
    #print("X_sample",X_sample)
    #print("dim",dim)
    min_val = 1e9
    min_x = None
    
    def min_obj(X):
        # Minimization objective is the negative acquisition function
        return -acquisition(X.reshape(-1, dim), X_sample, Y_sample, gpr)
    
    # Find the best optimum by starting from n_restart different random points.
    # for x0 in np.random.uniform(bounds[:, 0], bounds[:, 1], size=(n_restarts, dim)):
    #     res = minimize(min_obj, x0=x0, bounds=bounds, method='L-BFGS-B')        
    #     if res.fun < min_val:
    #         min_val = res.fun[0]
    #         min_x = res.x   

    for i in range(n_restarts):
        rd = np.random.rand(n)
        x0 = rd.round().astype(int)
        res = min_obj(x0)
        #print(res)
        for j in range(n_search):
            step_to = np.random.randint(n)
            x1 = x0.copy()
            x1[step_to] = 1 - x1[step_to]
            res1 = min_obj(x1)
            if res1 < res:
                res = res1
                x0 = x1.copy()
        if res < min_val:
            min_val = res
            min_x = x0
    
    #print("min_x",min_x)
    #return min_x.reshape(-1, dim)
    return min_x

from sklearn.gaussian_process import GaussianProcessRegressor
from sklearn.gaussian_process.kernels import ConstantKernel, Matern
from bayesian_optimization_util import plot_approximation, plot_acquisition

# Gaussian process with Mat??rn kernel as surrogate model
m52 = ConstantKernel(1.0) * Matern(length_scale=1.0, nu=2.5)
gpr = GaussianProcessRegressor(kernel=m52, alpha=noise**2)

# Initialize samples
X_sample = X_init
Y_sample = Y_init
#print(Y_sample)
#quit()

dim = X_sample.shape[1]
# Number of iterations
n_iter = 20

plt.figure(figsize=(12, n_iter * 3))
plt.subplots_adjust(hspace=0.4)

for i in range(n_iter):
    # Update Gaussian process with existing samples
    gpr.fit(X_sample, Y_sample)

    # Obtain next sampling point from the acquisition function (expected_improvement)
    X_next = propose_location(expected_improvement, X_sample, Y_sample, gpr, n)
    #print("X_next",X_next)
    # Obtain next noisy sample from the objective function
    Y_next = f(X_next).reshape(-1,1)
    #print("Y_next",Y_next)
    X_next = X_next.reshape(-1,dim)
    
    # Plot samples, surrogate function, noise-free objective and next sampling location
    #plt.subplot(n_iter, 2, 2 * i + 1)
    #plot_approximation(gpr, X, Y, X_sample, Y_sample, X_next, show_legend=i==0)
    #plt.title(f'Iteration {i+1}')

    #plt.subplot(n_iter, 2, 2 * i + 2)
    #plot_acquisition(X, expected_improvement(X, X_sample, Y_sample, gpr), X_next, show_legend=i==0)
    
    # Add sample to previous samples
    #print("Xs",X_sample)
    #print("Xn",X_next)
    #print("Ys",Y_sample)
    #print("Yn",Y_next)
    X_sample = np.vstack((X_sample, X_next))
    Y_sample = np.vstack((Y_sample, Y_next))

    print("iter:",i)
    print("Ysm",np.max(Y_sample))
    tmpY = list(Y_sample)
    print("X:",X_sample[tmpY.index(max(tmpY))])
    

#plt.show()
tmpX = list(X_sample)
tmpY = list(Y_sample)
for i in range(len(X_sample)):
    print(i,tmpX[i],tmpY[i])