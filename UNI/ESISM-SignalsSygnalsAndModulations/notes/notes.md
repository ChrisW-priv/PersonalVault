# Decibels
Comparison of power and reference power:
$P_{dB} = 10 log_{10} \frac{P}{P_r}$

Comparison of 2 amplitudes of rms values:
$P_{dB} = 10 log_{10} (\frac{A}{A_r})^2 = 20 log_{10} \frac{A}{A_r}$

# Signal energy and power
Instantaneous power: $P(t) = x^2(t)$

Energy: $E = \int_0^T x^2(t) dt$

Average power: $P = \frac1T\int_0^T x^2(t) dt$

# Periodic signals
$\forall x(t+T) = x(t)$
$T > 0$ is a period 

# Fourier Transform
$$X(f) = F[x(t)] = \int_{-\infty}^{\infty} x(t) e^{-j2\pi ft} dt$$

# Inverse Fourier Transform
$$x(t) = F^{-1}[X(f)] = \int_{-\infty}^{\infty} X(f) e^{j2\pi ft} df$$

# Shift theorem 
$$ F[x(t-t_0)] = e^{-2\pi ft_0} X(f) $$

# Inv Fourier Transform Calculation
$X(f) = rect_{2B}(f)$ 
$$x(t) = F^{-1}[X(f)] = \int_{-\infty}^{\infty} X(f) e^{j2\pi ft} df = 2B\frac{sin(2\pi Bt)}{2\pi Bt}$$

# Z transform
A series of samples {xn}, ideal sampling: $x_s(t) = \sum_n x_n\delta (t-nT)$
$$X_s(f) = \sum x_n F[\delta(t-nT)]=\sum x_n e^{-j2\pi fnT}$$
substitute $z = e^{j 2\pi fT}$

| f | z |
| :-: | :-: |
| 0 | 1 |
| $\frac{1}{4T}$ | j |
| $\frac{1}{2T}$ | -1 |
| $\frac{3}{4T}$ | -j |
| $\frac{1}{T}$ | 1 |

Z Transform: $X(z) = Z[\{x_n\}] = \sum_n x_n z^{-n}$ defined for any complex variable z.

## Properties
$Z[\{ax_n+by_n\}] = aX(z) + bY(z)$

$Z[\{x_{n+k}\}] = z^kX(z)$

$F[x(t)*y(t)] = F[x(t)]F[y(t)] = X(f)Y(f)$
$F^{-1}[x(t) y(t)]=X(f)*Y(f)$

