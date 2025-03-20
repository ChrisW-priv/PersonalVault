---
categories:
- zettelkasten
date: 2025-02-14
description: No description provided.
tags: []
title: Matrix
---

> [!Definition]
Matrix is a table of rows and columns containing data. Matrix is commonly used to describe linear transformations. We often build matrix with [Vector](Vector.md) as it's column.

## Notation

Dimensions of matrix are often described with letters **m** and **n**. We often note matrix of size m, n.

- m stands for number of rows
- n stands for number of columns

Example of 3x2 matrix:

 $$M = \begin{bmatrix} 3 & 2 \\ 2 & 4 \\ 4 & 5 \end{bmatrix}$$

If we want to access specific element we use subscript notation and say the index of row and column. It's common to use letter i to determine a row and j as column. 

In general: $M_{i,j} = x$ 

Example:

For matrix $M$ above $M_{1,1} = 3$ and $M _{3,2} = 5$ . Notice it is 3,2 not 2,3. order of arguments matters.

## Identity transformation

Identity transformations a transformation that does nothing - result is the same as if we didn't apply it at all.

## Related ideas

[Matrix multiplication](Matrix%20multiplication.md)

[Determinant of a matrix](Determinant%20of%20a%20matrix.md)

[[Inverse matrix]]

## Rank of matrix

Rank of a matrix is a number of dimensions in the output of the transformation. 

### Full rank

When the matrix has maximum rank as it can have $n^{th}$ rank for $n \times n$ matrix

## Null space kernel

A set of vectors that fall into origin point after linear transformation is applied.

Also known as kernel

## Column space

A span of basis vectors
