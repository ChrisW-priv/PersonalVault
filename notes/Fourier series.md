---
categories:
- null
- zettelkasten
date: 2025-02-14
description: No description provided.
tags:
- math
title: Fourier series
---

[Function approximation](Function%20approximation)

[Function in Mathematics](Function%20in%20Mathematics.md)

## Notation

$$
\hat g(t) = \int_{t_{1}}^{t_{2}}g(t)\cdot e^{-2\pi ift} dt
$$

Where limit of $t_{1}, t_{2}$ is $\infty$. 

## Intuition

Fourier series is a method that can be used to decompose functions into it's harmonics. This allows us to solve the problem for those simple harmonics and then sum them up, rather than solve one complex system

### Lab manual explanation for Electrical circuits

A signal $x(t)$ is called periodic if there exists a number $T > 0$, called a period of the signal, such that for every time instant t the following equality holds

$$x(t+T)=x(t)$$

In the remaining part of this chapter, we assume that $T$ is a fundamental period, i.e., it is the smallest period of the given signal. If a series

$$X_{0} + X_{1m}\cos(\omega t + \phi_{1}) + X_{2m}\cos(2\omega t + \phi_{2}) + \dots$$

is point-wise convergent to $x(t)$ at every continuity point of x then it is called a Fourier series of signal $x$. 

If series above is the Fourier series of signal $x$, then its coefficients are given by following formulas

![Pasted image 20221214211842](attachments/Pasted%20image%2020221214211842.png)