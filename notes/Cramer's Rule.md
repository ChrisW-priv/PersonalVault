---
categories:
- zettelkasten
date: 2025-02-14
description: No description provided.
tags: []
title: Cramer's Rule
---

We use Cramer's rule to calculate a [System of linear equations](System%20of%20linear%20equations.md). 

For a square matrix $M_{n \times n}$ of any size defining the [Linear transformation](Linear%20transformation.md), and a vector $\vec{v}$ of size $n$ result vector can be calculated using following algorithm:

1. calculate a $det(M)$
2. for each column in the matrix $M$ create new matrix with that column substituted with vector $\vec{v}$ 
3. calculate a determinant of this new matrix
4. save result to a corresponding component in result vector
5. multiply vector by $\frac{1}{det(M)}$ 

Result vector for 3d matrix:

$$\begin{bmatrix} 
det(M sub_1 \vec{v} ) / det(M) \\
det(M sub_2 \vec{v} ) / det(M) \\
det(M sub_3 \vec{v} ) / det(M) \\
\end{bmatrix}$$

Ex:

$$M = \begin{bmatrix} a & b & c \\ 
d & e & f \\ g & h & i 
\end{bmatrix}, \vec{v} = 
\begin{bmatrix} x \\ y \\ z \end{bmatrix}$$
Where:
$$M sub_1 \vec{v} = \begin{bmatrix} 
x & b & c \\ y & e & f \\ z & h & i 
\end{bmatrix},
M sub_2 \vec{v} = \begin{bmatrix} 
a & x & c \\ d & y & f \\ g & z & i 
\end{bmatrix},
M sub_3 \vec{v} = \begin{bmatrix} 
a & b & x \\ y & e & y \\ g & h & z 
\end{bmatrix}$$