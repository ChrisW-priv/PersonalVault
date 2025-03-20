---
categories:
- zettelkasten
date: 2025-02-14
description: No description provided.
tags: []
title: Fock matrix
---

In quantum chemistry, the Fock Matrix (also known as the Fock operator or the Fock matrix representation) is a [Matrix](Matrix.md) that represents the effective one-electron Hamiltonian for a system of electrons in a given molecular orbital basis. The matrix elements of the Fock matrix are given by $F_{pq} = h_{pq} + \sum_{i}^{occ} \sum_{r}^{basis} (2J_{prqs} - K_{prqs}) \phi_r(i) \phi_s(i)$ where $h_{pq}$ is the one-electron part of the Hamiltonian, which includes the kinetic energy and the potential energy of the electrons due to the nuclei; $J_{prqs}$ and $K_{prqs}$ are the Coulomb and exchange integrals, respectively, which describe the electron-electron interactions; and the sum is over all occupied molecular orbitals and all basis functions.

The Fock matrix is an important quantity in density functional theory (DFT) calculations, as it is used in the self-consistent field (SCF) iteration to update the electronic density and the potential. It is also used to construct the one-electron density matrix, which can be used to calculate various properties of the system, such as the total energy and the electron density at a given point in space.