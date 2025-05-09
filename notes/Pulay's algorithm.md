---
title: Pulay's algorithm
description: No description provided.
date: 2025-02-14
tags: []
categories:
  - zettelkasten
---

Pulay's algorithm is a method for accelerating the convergence of the
[self-consistent field (SCF)](self-consistent%20field%20(SCF)) iteration in
[density functional theory (DFT)](density%20functional%20theory%20(DFT))
calculations. It was developed by Peter Pulay in 1980.

The basic idea behind Pulay's algorithm is to incorporate information from
previous SCF iterations into the current iteration in order to improve the
convergence rate. This is done by adding a correction term to the 
[Fock matrix](Fock%20matrix.md), which is used to update the electronic density
and the potential in each SCF iteration. The correction term is constructed from
the difference between the electronic density from the current iteration and the
density from the previous iteration.

Pulay's algorithm has been shown to be effective at speeding up the convergence
of SCF iterations, especially for systems with a large number of electrons or
for calculations using high-accuracy functionals. It is commonly used in
conjunction with other methods for accelerating SCF convergence, such as direct
inversion in the iterative subspace (DIIS) and preconditioning techniques.
