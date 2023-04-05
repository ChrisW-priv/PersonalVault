import numpy as np
h = 6.626e-34
h_tilda = 1.055e-34
m0 = 9.11e-31
q = 1.602e-19
evToJoule = q
kb = 1.381e-23
elipson0 = 8.854e-12
c = 3e8
pi2 = 3.14*3.14
b = 2e-9
Vb = 2 * evToJoule
def exp(x): return np.exp(x)


E1 = 0.0111 * evToJoule
def E(n): return E*n**2
def energy_delta(m, n): return E1*(m**2-n**2)
