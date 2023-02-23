# Linear transformation
> [!Definition]
> Process of exploiting [[Linear isomorphism]]. It's a [[Function in Mathematics]] that takes in a [[Vector]] and turns it into new vector. 

## Notation
It is customary to describe linear transformation with a [[Matrix|matrix]]. Each column of matrix corresponds to change in values of [[Unit Vector|unit vectors]].

Eg.
 $$ M = \begin{bmatrix} 3 & 2 \\ -2 & 1 \end{bmatrix} $$
M is a transformation matrix where $\vec{i}$ lands at $\begin{bmatrix} 3 \\ -2 \end{bmatrix}$ and  $\vec{j}$ lands at $\begin{bmatrix} 2 \\ 1 \end{bmatrix}$
So each column describes a change to consecutive unit vectors of space. 

Note: in a special case where we have a $1 \times m$ matrix and a vector of size m we are in fact dealing with a [[Dot product]] between two vectors. We can also think of it as a transformation between a number line with one unit vector $\vec{i}$ of length one and result scaling that vector resulting in a real number. 

## Is transformation linear?
To check if a transformation is linear then visually two properties must be true:
1. lines must be evenly spaced and remain straight
2. origin point must be fixed

In order to check where a new point land it is necessary to check where unit vectors land and scale those to match our vector properties. 
