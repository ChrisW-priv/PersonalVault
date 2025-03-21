---
title: Phasor
description: No description provided.
date: 2025-02-14
tags: []
categories:
  - zettelkasten
---

> [!Definition]
> A phasor is a [Complex number](Complex%20number.md) representing a sinusoidal function. 

It is often used in electrical engineering to represent the magnitude and phase of an [Alternating current (AC)](Alternating%20current%20(AC)) or voltage in a [electronic circuit](electronic%20circuit). A phasor can be thought of as a vector in the [Complex plane](Complex%20plane.md), with its magnitude representing the amplitude of the sinusoidal function and its phase representing the shift in time of the function relative to a reference. Phasors can be added and multiplied, and are useful for analyzing and solving problems involving sinusoidal signals.

Any signal $x(t)$ can be written in the form

$$x(t) = X_m \cdot cos(\omega t + \psi_x)$$$X_m \geq 0, \omega > 0$

- $X_m$ is called amplitude
- $\omega$ is pulsation
- $\psi_x$ is the initial state of the signal 

Can be written as a phasor $X$.

$$X = X_me^{j\psi_x} = X_m cos\psi_x + jX_m sin\psi_x$$

[Number e](Number%20e.md) used here.

This transformation is a [Linear isomorphism](Linear%20isomorphism). Because of this we can reconstruct the signal using property below:

$$x(t) = ∣X∣ cos(\omega t + arg X) = Re(Xe^j\omega t)$$

![](Complex%20number.md#Argument|Argument%20of%20complex%20number)

![](Complex%20number.md#Magnitude|Magnitude)
