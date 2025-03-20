---
categories: []
date: 2025-02-14
description: No description provided.
tags:
- zettlekasten
title: Taylor series
---

## Definition

In mathematics, the Taylor series of a function is an infinite sum of terms that are expressed in terms of the function's derivatives at a single point. The partial sum formed by the first n + 1 terms of a Taylor series is a polynomial of degree n that is called the nth Taylor polynomial of the function. Taylor polynomials are approximations of a function, which become generally better as n increases, however it's not general - sometimes the derivatives don't converge and adding more terms don't add more information.

Often: for points "near" that single point value of original function is close if not equal to it's Taylor series equivalent

IMPORTANT: you have to be able to differentiate a function at a certain point to be able to do this!

## Notation

The Taylor series of a real or complex-valued function f (x) that is infinitely differentiable at a real or complex number a is the power series

$$f(a)+\frac{df(a)}{1!}(x-a)+\frac{d^2f(a)}{2!}(x-a)^{2}+\frac{d^3f(a)}{3!}(x-a)^{3}+\cdots$$

where n! denotes the factorial of n. In the more compact [Sigma notation](Sigma%20notation.md), this can be written as

$$\sum_{n=0}^{\infty}{\frac{f^{(n)}(a)}{n!}(x-a)^{n}}$$

This uses [Derivative](Derivative.md) and [Factorial function](Factorial%20function.md).

## Intuition

Each component of this sum gives you more information about the point and it's surroundings. First gives you a value at that point, second it's general slope, third gives you curve around that point etc.

**

## Additional materials

[3b1b video](https://www.youtube.com/watch?v=3d6DsjIBzJ4)