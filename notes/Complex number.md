---
categories: []
date: 2025-02-14
description: No description provided.
tags:
- zettlekasten
title: Complex number
---

## Definition

A complex number is an element of a number system that extends the real numbers with a specific element denoted $i$, called the imaginary unit and satisfying the equation $i^2 = −1$.

## Notation

Set of Complex numbers is denoted by symbol $\mathbb{C}$.

Every complex number can be expressed in the form $z=a+bi$, where a and b are real numbers where a is real part and b is imaginary part

Real part can be noted as $Re\{z\} = a$

Imaginary part can be noted as $Im\{z\} = b$

## Properties

Despite being called "imaginary" have many useful applications. Often used to describe rotations on 2d plane and solutions to polynomial equations.

### Magnitude

Defined as length of a vector, calculated using: $\sqrt{a^2+b^2}$.

### Argument

The argument of a complex number is the angle that the complex number makes with the real axis in the complex plane. It is often denoted by the symbol "arg" or "$\phi$" and is typically measured in radians.

### Complex conjugate

[Complex conjugate](Complex%20conjugate.md)

### Reciprocal

$\frac{1}{z}=\frac{\bar{z}}{z\bar{z}} = \frac{\bar{z}}{|z|^2} = \frac{a-bi}{a^2+b^2}$

### Addition and multiplication

Addition, subtraction and multiplication of complex numbers can be naturally defined by using the rule $i^2 = −1$ combined with the [associative](Associative%20binary%20property.md), [comunicative](Communicative%20binary%20property.md) and [distributive](Distributive%20binary%20property.md) laws. 

for eg. 

- addition: $1+2i + 3 + 5i = 4 + 7i$ 
- [multiplication](Complex%20multiplication%20as%20a%20rotation.md): $(1+2i) \cdot (3 + 5i) = 3+5i+6i+10i^2 = 3-10+11i = -7+11i$ 

> [!Note] 
> Although complex numbers can be seen as vectors multiplication is either matrix multiplication or normal multiplication with rule $i^2 = −1$ defined.

### Division

Using property $\frac{w}{z} = w\cdot \frac{1}{z}$

After that we use shortened form of multiplication $\frac{(ac+bd) + (ad-bc)i}{a^2+b^2}$

### Exponentiation

Exponentiation can be represented by repeated multiplication and therefore rotation.

## Alternative representation

### Cartesian complex plane

Complex numbers can be represented by 2d [vector](Vector.md) with ordered pair $(Re\{z\}, Im\{z\})$ as basis. We can then visualise them with [Complex plane](Complex%20plane.md).

### Polar complex plane

[Polar coordinate system](Polar%20coordinate%20system) that uses the distance of the point z from the origin, and the angle between the positive real axis in a counter clockwise sense. This leads to the **polar form** $r(cos(\theta) + i\cdot sin(\theta)$ where $r$ is absolute distance from origin $r=|z|=\sqrt{a^2+b^2}$. 

> [!Note]
> There is no polar form for zero number!

#### Multiplication in polar form

Using the geometric representation we can see that $[r_1(cos(\theta_1) + i\cdot sin(\theta_1)]\cdot[r_2(cos(\theta_2) + i\cdot sin(\theta_2)] = r1r2(cos(\theta_1+\theta_2) + i sin(\theta_1+\theta_2))$

### Using Euler formula

Uses [Exp(x) function](Exp(x)%20function.md) as definition: $z = re^{i \theta} = r\cdot exp(i\theta)$. 

> [!Note] 
> Here for fixed $r$ function is cyclic! Also: $\theta$ is in radians!!!

Famous formula: $e^{i\pi} = -1$