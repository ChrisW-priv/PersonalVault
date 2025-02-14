---
title: "Proportional form of Bayes Rule"
date: 2025-02-14
description: ""
tags: 
  - "zettlekasten"
categories: []
---

## Definition
Simplified form of [Bayes rule](Bayes%20rule.md). It leaves out the proportionality factor of $\frac1{P(D)}$. Therefore the values of this form are not normalised between 0-1.

## Notation
$$P(H|D)\propto P(H)\times P(D|H)$$
## Intuition
It is often very difficult to know the precise value of $P(D)$. Often however we do not need the precise value and we just need to compare how well different hypothesis explain the data we see. Therefore if we try $\frac{P(H_1|D)}{P(H_2|D)}$ then fraction of $\frac1{P(D)}$ can be simplified out of the equation.