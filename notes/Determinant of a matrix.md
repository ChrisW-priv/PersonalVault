---
title: Determinant of a matrix
description: No description provided.
date: 2025-02-14
tags: []
categories:
  - zettelkasten
---

## Notation

We denote a determinant of a matrix $M$ as:

- det($M$) 
- $\vert M \vert$

## Intuition

Determinant is a factor by which a space is scaled by the matrix after a [Linear transformation](Linear%20transformation.md).

Special cases: 

- If the determinant of a matrix is 0 then a transformation reduces a dimensionality of space. In other words makes the basis vectors [linearly dependent](Linear%20dependence.md). For example turns a 2d space into a 1d line.
- If the determinant of a matrix is negative then a transformation "flips" the space as in flipping a sheet of paper.

## Computation

> [!Warning] 
> Only possible if square matrixes!!

#### For 2d

$Let\ M = \begin{bmatrix} a & b \\ c & d \end{bmatrix}$, $det(M) = ad-bc$ 

#### For 3d

$$Let\ M = \begin{bmatrix} a & b &c \\ d & e & f \\ g & h & i \end{bmatrix}$$

$$det(M) = 
a \begin{bmatrix} e & f \\ h & i \end{bmatrix} -
b \begin{bmatrix} d & f \\ g & i \end{bmatrix} + 
c \begin{bmatrix} d & e \\ g & h \end{bmatrix} = 
aei + bfg + cdh - ath - bdi - ceg$$
Notice: first 3 components are products of components of diagonals from one side. Other three are products of components of diagonals from the other side.

#### For general n $\times$ n matrix
In general if is possible to calculate a determinant of any matrix recursively similarly to the way shown in 3d example. It is important to remember that the signs of components switches between + and -. 
However, if we want to start from different column you can! Remember that + and - sign follow chess board pattern like the one below:
$$\begin{bmatrix} + & - & + & - \\ - & + & - & + \\ + & - & + & - \\ - & + & - & + \\ \end{bmatrix}$$
> [!sidenote]
>  For each index sign of the index will be determined by equation: $-1^{i+j}$. 

For example for 4d matrix:
$$m=\begin{bmatrix} 1 & 2 & 3 & 4 \\ 1 & 0 & 2 & 0 \\ 0 & 1 & 2 & 3 \\ 2 & 3 & 0 & 0 \\ \end{bmatrix}$$
$$det(M) = 
+1\begin{bmatrix} 0 & 2 & 0 \\ 1 & 2 & 3 \\ 3 & 0 & 0 \end{bmatrix}
-2\begin{bmatrix} 1 & 2 & 0 \\ 0 & 2 & 3 \\ 2 & 0 & 0 \end{bmatrix}
+3\begin{bmatrix} 1 & 0 & 0 \\ 0 & 1 & 3 \\ 2 & 3 & 0 \end{bmatrix}
-4\begin{bmatrix} 1 & 0 & 2 \\ 0 & 1 & 2 \\ 2 & 3 & 0 \end{bmatrix}
=\ ...$$
OR
$$det(M) = 
-1\begin{bmatrix} 2 & 3 & 4 \\ 1 & 2 & 3 \\ 3 & 0 & 0 \end{bmatrix}
+0\begin{bmatrix} 1 & 3 & 4 \\ 0 & 2 & 3 \\ 2 & 0 & 0 \end{bmatrix}
-2\begin{bmatrix} 1 & 2 & 4 \\ 0 & 1 & 3 \\ 2 & 3 & 0 \end{bmatrix}
+0\begin{bmatrix} 1 & 2 & 3 \\ 0 & 1 & 2 \\ 2 & 3 & 0 \end{bmatrix}
=\ ...$$
Notice that in the second approach we can skip the calculations of 2nd or 4th determinants because of multiplication by zero.
Also notice: when creating a determinant of lower dimensions we skipped the rows and columns of given index.
