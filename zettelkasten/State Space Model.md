---
title: "State Space Model"
date: 2025-02-14
description: ""
tags: 
  - "zettlekasten"
categories: []
---

[[math model]]
Each model will have variables like:
$$
\begin{split}
x = Ax + Bu\\
y = Cx + Du
\end{split}
$$
where 
$x$ = real vector of size $n$
$u$ = real vector of size $m$
$y$ = real vector of size $p$
$A$ is a matrix of real numbers with size $n\times n$
$B$ is a matrix of real numbers with size $n\times m$
$C$ is a matrix of real numbers with size $p\times n$ = $I$
$D$ is a matrix of real numbers with size $p\times m$ = zeros

## Stability
if $\text{eig}(A) < 0$ then model is stable

## Example
### Ex1
$T_p\frac{dy}{dt} = -y + K_pu$
Can be transformed into
$$
\begin{split}
\dot{x} &= -\frac{1}{T_p}x +\frac{K_p}{T_p}u \\
y &= x
\end{split}
$$
Thus, 
$A = -\frac{1}{T_p}$
$B = \frac{K_p}{T_p}$
$C = 1$
$D = 0$

### Ex2
$T_{p1}\frac{dx}{dt} = -x_1 + K_pu$
$T_{p2}\frac{dx}{dt} = -x_2 + x_1$
$y = x_2$
$$
\begin{split}
\begin{bmatrix} x_1 \\ x_2\end{bmatrix} 
&= \begin{bmatrix} -\frac{1}{T_{p1}} & 0 \\ \frac{1}{T_{p2}} & -\frac{1}{T_{p1}}\end{bmatrix}\begin{bmatrix} x_1 \\ x_2\end{bmatrix} + \begin{bmatrix} \frac{K_p}{T_{p2}} \\ 0 \end{bmatrix} u \\
y &= x_2
\end{split}
$$