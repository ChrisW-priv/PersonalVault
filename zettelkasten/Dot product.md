---
title: "Dot product"
date: 2025-02-14
description: ""
tags: 
  - "zettlekasten"
categories: []
---

## Definition
[Function in Mathematics](Function%20in%20Mathematics.md) taking two [vectors](Vector.md) as input and returning a real number. Order of vectors doesn't matter.
The same as multiplication of $1 \times m$ matrix and a vector of size m.
So in fact it's a linear transformation mapping a vector of arbitrary size to number line.

## Notation
For given vectors $\vec{u}, \vec{v}$ dot product between then will be noted as $$\vec{u} \cdot \vec{v}$$

## Intuition
For two vectors $\vec{w}, \vec{v}$ imagine projecting $\vec{w}$ onto $\vec{v}$. After multiplying length of projected $\vec{w}$ by length of $\vec{v}$ you get dot product of both vectors. 
[here nice video animations by 3Blue1Brown](https://www.youtube.com/watch?v=LyGKycYT2v0&list=PLZHQObOWTQDPD3MizzM2xVFitgF8hE_ab&index=9) 

- If vectors point in the same direction result is positive
- If vectors point in the opposite directions result is negative
- If they are perpendicular result is equal to 0

Notice: dot product of 2 vectors is equivalent to [Matrix multiplication](Matrix%20multiplication.md)

Notice those are the same as:

Equation for 3d vectors
$$\begin{bmatrix} a \\ b \\ c \end{bmatrix} 
\cdot 
\begin{bmatrix} d \\ e \\ f \end{bmatrix} = 
ad + be + cf$$
And it's equivalent matrix form:
$$\begin{bmatrix} a & b & c \end{bmatrix} \cdot \begin{bmatrix} d \\ e \\ f \end{bmatrix} = ad + be + cf$$

## Computation
Note: only possible if vectors are of the same size.

For corresponding pairs of components of vectors you apply multiplication, then add all results.
In short you can think of dot product as multiplication of $1 \times m$ matrix and a vector of size m.


In general for 3d vectors:

$$\begin{bmatrix} a \\ b \\ c \end{bmatrix} 
\cdot 
\begin{bmatrix} d \\ e \\ f \end{bmatrix} = 
ad + be + cf$$

Example:
$$\begin{bmatrix} 2 \\ 7 \\ 1 \end{bmatrix} 
\cdot 
\begin{bmatrix} 8 \\ 2 \\ 8 \end{bmatrix} = 
16 + 14 + 8 = 38$$
