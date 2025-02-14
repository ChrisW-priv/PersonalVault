---
title: "Quantum computing"
date: 2025-02-14
description: ""
tags: 
  - "zettlekasten"
categories: []
---

note taken based on [this](https://www.youtube.com/watch?v=F_Riqjdh2oM) youtube
video.

From now on, a classical bit will be written as cbit or 'regular bit'

One bit with value 0, also written as $|0\rangle$ ([Dirac vector notation](Dirac%20vector%20notation))
$$1\choose 0$$

One bit with value 1, also written as $|1\rangle$
$$0\choose 1$$

When we have this defined, we can use [Matrix multiplication](Matrix%20multiplication.md) rules to
manipulate the bits. Those transformations will take form of Functions. 

Reminder: 4 operations on one cbit 
identity
negation
set0
set1

To represent these in vector notation we will take matrix $A$ and some vector
$\vec{v}$. Then our general function will be defined as $f(A, \vec{v})$.
We can use [Partial pattern](Partial%20pattern.md) to build the operations with some matrix $A$.

Identity 
$$A = \begin{bmatrix} 1 & 0 \\ 0 & 1 \end{bmatrix}$$
Negation
$$A = \begin{bmatrix} 0 & 1 \\ 1 & 0 \end{bmatrix}$$
Set 0
$$A = \begin{bmatrix} 1 & 1 \\ 0 & 0 \end{bmatrix}$$
Set 1
$$A = \begin{bmatrix} 0 & 0 \\ 1 & 1 \end{bmatrix}$$

Reversible computing describes a situation when one knows the operation applied
and the result of the operation, then we can deduce what was an input of the
operation.

Intuitively, when you shuffle bits around or negate them, they will be
reversible.

If you discard the bit and overwright the value with new one, then the
operation is not reversible.

Here we can see that when appling the 'Set 0' operation we loose information on
what was there before. 

Quantum computing uses only reversible computing.

There is a theory that reversible computing may lead us to break the "Von
Neuman Landauer limit" which is said to be lowest posible limit of energy of
computation.

$$ {x_0\choose x_1} \bigotimes {y_0\choose y_1} = 
\left( 
\begin{matrix} x_0 {y_0\choose y_1} \\ x_1 {y_0\choose y_1} \end{matrix} 
\right) = 
\left( 
\begin{matrix} x_0 y_0 \\ x_0 y_1 \\ x_1 y_0 \\ x_1 y_1 \end{matrix} 
\right)
$$

example:
$$ {1\choose 2} \bigotimes {3\choose 4} = 
\left( 
\begin{matrix} 3 \\ 4 \\ 6 \\ 8 \end{matrix} 
\right)
$$

$$ {0\choose 1} \bigotimes {0\choose 1} \bigotimes {1\choose 0} = 
\left( 
\begin{matrix} 0 \\ 0 \\ 0 \\ 0 \\ 0 \\ 0 \\ 1 \\ 0 \end{matrix} 
\right)
$$

$$|00\rangle = {1\choose 0} \bigotimes {1\choose 0} = 
\left( 
\begin{matrix} 1 \\ 0 \\ 0 \\ 0 \end{matrix} 
\right)
$$

$$|10\rangle = {0\choose 1} \bigotimes {1\choose 0} = 
\left( 
\begin{matrix} 0 \\ 0 \\ 1 \\ 0 \end{matrix} 
\right)
$$

$$|01\rangle = {1\choose 0} \bigotimes {0\choose 1} = 
\left( 
\begin{matrix} 0 \\ 1 \\ 0 \\ 0 \end{matrix} 
\right)
$$

$$|11\rangle = {0\choose 1} \bigotimes {0\choose 1} = 
\left( 
\begin{matrix} 0 \\ 0 \\ 0 \\ 1 \end{matrix} 
\right)
$$


$$|4\rangle = |100\rangle = {0\choose 1} \bigotimes {1\choose 0} \bigotimes {1\choose 0} = 
\left( 
\begin{matrix} 0 \\ 0 \\ 0 \\ 0 \\ 1 \\ 0 \\ 0 \\ 0 \end{matrix} 
\right)
$$

Operates on pairs of bits. One is "control" bit and the other is "target" bit.

If control bit is 1: target is flipped

If control bit is 0: target is unchanged

The control bit is always unchanged

The control bit is always unchanged

We can represent this as matrix multiplication in the form of:
$$C = \begin{bmatrix} 
1 & 0 & 0 & 0 \\
0 & 1 & 0 & 0 \\
0 & 0 & 0 & 1 \\
0 & 0 & 1 & 0 \\
\end{bmatrix}$$

Example:
apply cnot to $|10\rangle$:
$$C\left({0\choose 1} \bigotimes {1\choose 0}\right) = 
\begin{bmatrix} 
1 & 0 & 0 & 0 \\
0 & 1 & 0 & 0 \\
0 & 0 & 0 & 1 \\
0 & 0 & 1 & 0 \\
\end{bmatrix} = 
\left( 
\begin{matrix} 0 \\ 0 \\ 0 \\ 1 \end{matrix} 
\right) 
= {0\choose 1} \bigotimes {0\choose 1} = |11\rangle$$

Which behaves as expected

CNOT is like a NAND gate to Quantum Computing

Surprise!! We've been using qbits all along! Cbit is just a special case of
qbit. 

qbit is a represented by ${a\choose b}$ where $a$ and $b$ are Complex numbers 
and $||a||^2 + ||b||^2 = 1$

Example qbits:
$$
\left( \begin{matrix} \frac{1}{\sqrt{2}} \\ \frac{1}{\sqrt{2}} \end{matrix} \right)
\left( \begin{matrix} \frac12 \\ \frac{\sqrt{3}}{2} \end{matrix} \right)
\left( \begin{matrix} -1 \\ 0 \end{matrix} \right)
\left( \begin{matrix} \frac{1}{\sqrt{2}} \\ \frac{-1}{\sqrt{2}} \end{matrix} \right)
$$

Now, qbits that are defined are in superposition as they are neither 1 or 0.

Only when we measure the qbit value, it collapses to an actual value of 0 or 1.

Qbit with value ${a\choose b}$ collapses to 0 with probability $||a||^2$ and 1
with probability $||b||^2$.

Examples:
$\left(\begin{matrix}
\frac{1}{\sqrt{2}}\\\frac{1}{\sqrt{2}}
\end{matrix}\right)$
has $\frac12$ probability of becoming a 0 or a 1.
${1\choose 0}$ has 100% chance of collapsing to 0.
${0\choose 1}$ has 100% chance of collapsing to 1.

The Hadamard gate takes a 0 or 1 bit and puts it into exactly equal superposition. We can think of it as a operation with matrix 
$$H = 
\left( \begin{matrix}
\frac{1}{\sqrt{2}} & \frac{1}{\sqrt{2}} \\
\frac{1}{\sqrt{2}} & \frac{-1}{\sqrt{2}}
\end{matrix} \right)
$$

Example:
$$H|0\rangle = 
\left( \begin{matrix}
\frac{1}{\sqrt{2}} & \frac{1}{\sqrt{2}} \\
\frac{1}{\sqrt{2}} & \frac{-1}{\sqrt{2}}
\end{matrix} \right) {1\choose 0} = 
\left(\begin{matrix} \frac{1}{\sqrt{2}}\\\frac{1}{\sqrt{2}} \end{matrix}\right)
$$

$$H|1\rangle = 
\left( \begin{matrix}
\frac{1}{\sqrt{2}} & \frac{1}{\sqrt{2}} \\
\frac{1}{\sqrt{2}} & \frac{-1}{\sqrt{2}}
\end{matrix} \right) {0\choose 1} = 
\left(\begin{matrix} \frac{1}{\sqrt{2}}\\\frac{-1}{\sqrt{2}} \end{matrix}\right)
$$

As it is common with vectors, we will draw them on unit circle. Then, we can
think of CNOT Gate as a gate that moves the point from one part of unit circle
to another with respect to $y=x$ axis and Hadamard gate as a gate that moves
the values in some other way.
