---
title: "System of linear equations"
date: 2025-02-14
description: ""
tags: 
  - "zettlekasten"
categories: []
---

### System of linear equations
Example system of equations:
$2x + 5y + 3z = -3$
$4x + 0y + 8z = 0$
$1x + 3y + 0z = 2$

A system of equations like this can be represented as follows:

$$\begin{bmatrix} 2 & 5 & 3 \\ 4 & 0 & 8 \\ 1 & 3 & 0 \end{bmatrix} * \begin{bmatrix} x \\ y \\ z \end{bmatrix} = 
\begin{bmatrix} -3 \\ 0 \\ 2 \end{bmatrix}$$
Then we can denote that:
$$A = \begin{bmatrix} 2 & 5 & 3 \\ 4 & 0 & 8 \\ 1 & 3 & 0 \end{bmatrix},\ 
\vec{x} = \begin{bmatrix} x \\ y \\ z \end{bmatrix},\ 
\vec{v} = \begin{bmatrix} -3 \\ 0 \\ 2 \end{bmatrix}$$
To solve this system:
- we have to find an inverse of $A$ matrix and compute $A^{-1} \times \vec{v}$. Calculating the $A^{-1}$ is commonly done using [Gaussian elimination](Gaussian%20elimination.md)
or 
- we can use [Cramer's Rule](Cramer's%20Rule.md). Note: Cramer's rule is slower but is a good way to try to solve the equation as it can be explained simply with geometry. [video with explenation](https://www.youtube.com/watch?v=jBsC34PxzoM&list=PLZHQObOWTQDPD3MizzM2xVFitgF8hE_ab&index=12)
