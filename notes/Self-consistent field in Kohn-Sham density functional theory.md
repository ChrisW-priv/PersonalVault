---
categories: []
date: 2025-02-14
description: No description provided.
tags:
- zettlekasten
title: Self-consistent field in Kohn-Sham density functional theory
---

[electronic circuit](electronic%20circuit)

In Kohn–Sham [density functional theory (DFT)](density%20functional%20theory%20(DFT)), the [self-consistent field (SCF)](self-consistent%20field%20(SCF)) is a mathematical method used to solve the [Schrödinger equation](Schrödinger%20equation), which describes the behavior of electrons in a system. The Schrödinger equation is a complex and nonlinear equation that cannot be solved exactly in most cases, so the SCF method is used to approximate the solution.

The SCF method is an iterative process in which an initial guess is made for the electronic wave function (the solution to the Schrödinger equation) and the corresponding electron density is calculated. This density is used to solve the Schrödinger equation again, yielding a new wave function and density. This process is repeated until the wave function and density converge to a stable solution, at which point the SCF calculation is considered to be complete.

Computing the SCF is a critical step in DFT calculations, as it allows the electronic structure of a system to be determined from its density. This is important for many applications in chemistry and materials science, where the electronic structure of a system is directly related to its properties and behavior. The accuracy and efficiency of the SCF calculation can greatly affect the accuracy and efficiency of the overall DFT calculation, so much research has been done to improve the SCF method and make it more robust and efficient.

![Pasted image 20221027204249](attachments/Pasted%20image%2020221027204249.png)