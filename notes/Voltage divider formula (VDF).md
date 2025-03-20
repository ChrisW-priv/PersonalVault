---
categories: []
date: 2025-02-14
description: No description provided.
tags:
- zettlekasten
title: Voltage divider formula (VDF)
---

[electronic circuit](electronic%20circuit)

Note: we only consider series connection because voltage flowing through a parrarel elements is ALLWAYS the same (in ideal case).

Note: knowing the voltage and total resistance we can deduce the current and then calculate the voltage across the resistors in a two step fasion. Below is given the alternative to this method.

## For a pair resistors

$R_1,R_2$ and currents $I_1,I_2$ flowing though them then 

$V_1 = V_{in} \frac{R_1}{R_1+R_2}$, $V_2 = V_{in} \frac{R_2}{R_1+R_2}$.

### Intution

We take the value from "the other resistor" because when resistance of that resistor is gonna get bigger->current though it is gonna get lower so current though "our" resistor is gonna get proportionally higher.

## For more then two resistors

It's better to use conductance instead of resistance ($G=\frac1R$) and follow the formula:

$I_1 = I_{in} \frac{G_1}{G_1+G_2+G_3}$ 

Note: we HAVE TO change it into conductance, there is no easier/better way to do this!