---
title: Matrix multiplication
description: No description provided.
date: 2025-02-14
tags: []
categories:
  - zettelkasten
---

[Function in Mathematics](Function%20in%20Mathematics.md), commonly a [Linear transformation](Linear%20transformation.md)

### When is it possible?

Let $M_1, M_2$ be matrixes. Matrix multiplication $M_1 * M_2$ is only possible when number of **columns (n) in $M_1$**  is equal to number of **rows (m) in $M_2$**. Result is a matrix of size $M_{1_m} \times M_{2_n}$

### Multiplication with scalar

Each component is multiplied by the scalar.

Example:

Let $A$ be matrix and $x$ be a scalar. Result be is calculated as follows:

$$A = \begin{bmatrix} a & b \\ c & d \end{bmatrix}$$

$$B = A*x = \begin{bmatrix} ax & bx \\ cx & dx \end{bmatrix}$$

### Multiplication with a vector

A result of linear transformation of a vector. 

Note: only possible when number of columns in matrix match number of dimensions in a vector!

In general for 2d:

$$\begin{bmatrix} a & b \\ c & d \end{bmatrix} * 
\begin{bmatrix} x \\ y \end{bmatrix} = 
x \begin{bmatrix} a \\ c \end{bmatrix} + 
y \begin{bmatrix} b \\ d \end{bmatrix} = \begin{bmatrix} ax + by \\ cx + dy \end{bmatrix}$$

In general for 3d:
$$\begin{bmatrix} 
a & b & c \\ d & e & f \\ g & h & i 
\end{bmatrix} * 
\begin{bmatrix} x \\ y \\ z \end{bmatrix} = 
x \begin{bmatrix} a \\ d \\ g \end{bmatrix} + 
y \begin{bmatrix} b \\ e \\ h \end{bmatrix} + 
z \begin{bmatrix} c \\ f \\ i \end{bmatrix} = \begin{bmatrix} 
ax + by + cz \\ dx + ey + fz \\ gx + hy+iz 
\end{bmatrix}$$

### Multiplication with matrix of the same shape
For square matrices result is equivalent to applying 2 linear transformations one after the other. 
Order of matrix multiplication matters!!!
- We can split hard problem into smaller ones.
- Resulting matrix is created by a vector of vectors that are results of multiplication of corresponding columns by a matrix on the left.
Eg. 
Let $M _1, M _2$ be a 2d square matrices: 
$$M_1 = \begin{bmatrix} a & b \\ c & d \end{bmatrix}
M_2 = \begin{bmatrix} e & f \\ g & h \end{bmatrix} \ 
$$

$$R = M_1*M_2 = \begin{bmatrix} 
ae + bg & af+bh \\ ce+dg & cf+dh
\end{bmatrix}$$
Result matrix $R$ can be computed as follows:
$$R = M_2 * M_1 = 
\begin{bmatrix} a & b \\ c & d \end{bmatrix} * 
\begin{bmatrix} e & f \\ g & h \end{bmatrix} =
\begin{bmatrix} A & B \end{bmatrix}$$
$$A = \begin{bmatrix} a & b \\ c & d \end{bmatrix} * \begin{bmatrix} e \\ g \end{bmatrix} = 
e \begin{bmatrix} a \\ c \end{bmatrix} + 
g \begin{bmatrix} b \\ d \end{bmatrix} = \begin{bmatrix} ae + bg \\ ce + dg \end{bmatrix}$$
$$B = \begin{bmatrix} a & b \\ c & d \end{bmatrix} * \begin{bmatrix} f \\ h \end{bmatrix} = 
f \begin{bmatrix} a \\ c \end{bmatrix} + 
h \begin{bmatrix} b \\ d \end{bmatrix} = \begin{bmatrix} af + bh \\ cf + dh \end{bmatrix}$$
$$R = \begin{bmatrix} 
ae + bg & af+bh \\ ce+dg & cf+dh
\end{bmatrix}$$
