---
title: DC analysis
description: No description provided.
date: 2025-02-14
tags: []
categories:
  - zettelkasten
---

[electronic circuit](electronic%20circuit)

A DC solution to a circuit is a solution consisting entirely of constant signals (all voltages and currents)

For DC all complicated ODEs normally ruling the circuits reduce to algebraic equations.

![Pasted image 20221028102718](attachments/Pasted%20image%2020221028102718.png)

At our desposal we allways have Kirchhoff's laws (KCL, KVL) and device equations!

## Nodal method

1. Label all the nodes with variables $e_1,e_2,...,e_n$ denoting electric potentials
![Pasted image 20221028103037](attachments/Pasted%20image%2020221028103037.png)
2. Labels all the currents $i_1,i_2,...,i_n$ flowing into all the elements. For each n-terminal element we introduce $n-1$ new variables in tis way.
The current flowing out of the last terminal of an n-terminal element equals the sum of the currents flowing into all the other terminals.
![Pasted image 20221028103400](attachments/Pasted%20image%2020221028103400.png)
3. Write down the KVL equations (for each node)
![Pasted image 20221028103621](attachments/Pasted%20image%2020221028103621.png)

4. Write down element equations expressed in terms of the electric potentials $e_1,e_2,...,e_n$ and currents $i_1,i_2,...,i_n$.
![Pasted image 20221028103829](attachments/Pasted%20image%2020221028103829.png)

5. Solve the equations
![Pasted image 20221028104024](attachments/Pasted%20image%2020221028104024.png)
![Pasted image 20221028103950](attachments/Pasted%20image%2020221028103950.png)

## Superposition rule

A solution to linear circuit with N independent sources is a sum of solutions to N circuits that result from the original circuit by reduction to zero all but one independent source (each time we let just a single independent source to act alone).

In this way one may find only the whole solutions but also the individual voltages and currents.

1. Reduction to zero
![Pasted image 20221028104554](attachments/Pasted%20image%2020221028104554.png)

![Pasted image 20221028104649](attachments/Pasted%20image%2020221028104649.png)

## Current Divider Formula (CDF)

![Pasted image 20221028104844](attachments/Pasted%20image%2020221028104844.png)

![Pasted image 20221028104925](attachments/Pasted%20image%2020221028104925.png)

## Voltage Divider Formula

![Pasted image 20221028105009](attachments/Pasted%20image%2020221028105009.png)
