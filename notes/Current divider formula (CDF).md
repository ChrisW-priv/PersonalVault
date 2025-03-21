---
title: Current divider formula (CDF)
description: No description provided.
date: 2025-02-14
tags: []
categories:
  - zettelkasten
---

[electronic circuits](electronic%20circuit)

> [!Note]
> We only consider paralel connection because current flowing through series
elements is ALWAYS the same.

## For a pair resistors

$R_1,R_2$ and currents $I_1,I_2$ flowing though them then 

$I_1 = I_{in} \frac{R_2}{R_1+R_2}$ 

$I_2 = I_{in} \frac{R_1}{R_1+R_2}$ 

### Intuition

We take the value from "the other resistor" because when resistance of that

resistor is gonna get bigger->current though it is gonna get lower so current

though "our" resistor is gonna get proportionally higher.

## For more then two resistors

It's better to use conductance instead of resistance ($G=\frac1R$) and follow

the formula:

$I_1 = I_{in} \frac{G_1}{G_1+G_2+G_3}$ 

Note: we HAVE TO change it into conductance, there is no easier/better way to do

this!
