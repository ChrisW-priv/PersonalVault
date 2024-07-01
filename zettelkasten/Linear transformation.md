# Linear transformation
> [!Definition]
> Process of exploiting [Linear isomorphism](Linear%20isomorphism). It's a [Function in Mathematics](Function%20in%20Mathematics.md) that takes in a [Vector](Vector.md) and turns it into new vector. 

## Notation
It is customary to describe linear transformation with a [matrix](Matrix.md). Each column of matrix corresponds to change in values of [unit vectors](Unit%20Vector.md).

Eg.
 $$ M = \begin{bmatrix} 3 & 2 \\ -2 & 1 \end{bmatrix} $$
M is a transformation matrix where $\vec{i}$ lands at $\begin{bmatrix} 3 \\ -2 \end{bmatrix}$ and  $\vec{j}$ lands at $\begin{bmatrix} 2 \\ 1 \end{bmatrix}$
So each column describes a change to consecutive unit vectors of space. 

Note: in a special case where we have a $1 \times m$ matrix and a vector of size m we are in fact dealing with a [Dot product](Dot%20product.md) between two vectors. We can also think of it as a transformation between a number line with one unit vector $\vec{i}$ of length one and result scaling that vector resulting in a real number. 

## Is transformation linear?
To check if a transformation is linear then visually two properties must be true:
1. lines must be evenly spaced and remain straight
2. origin point must be fixed

In order to check where a new point land it is necessary to check where unit vectors land and scale those to match our vector properties. 
