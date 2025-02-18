---
title: "Beta distribution"
date: 2025-02-14
description: ""
tags: 
  - "zettlekasten"
categories: []
---

## Definition

In [Probability](Probability.md) and [Statistics](Statistics.md), the beta distribution function is a family of continuous probability distributions defined on the closed interval from 0 to 1.
It is defined by two parameters: alpha $\alpha$ and beta $\beta$, that control the shape of the function

The [Probability density function (PDF)](Probability%20density%20function%20(PDF)) of the beta distribution, for 0 ≤ x ≤ 1, and shape parameters α, β > 0, is a power function of the variable x and of its reflection (1 − x).

## Notation

$$f(x,\alpha,\beta)=const. \times x^{\alpha-1} (1-x)^{\beta-1}$$
$const.$ variable is a variable that normalizes the output of the function into 0-1 range (integral of whole equals 1). It can be represented by multiple functions:

### Integration from 0 to 1

$$\frac1{\int_0^1{ u^{\alpha-1} (1-u)^{\beta-1}du}}$$
[Integral](Integral.md)

### Gamma function

$$\frac{\Gamma(\alpha+\beta)}{\Gamma(\alpha)\Gamma(\beta)}$$
[Gamma function](Gamma%20function)

### Beta function

$$\frac1{B(\alpha,\beta)}$$
[Beta function](Beta%20function)

## Intuition

Given data it can be often difficult to say what is the exact probability of an event. Therefore beta distribution function acts as a helper that allows us to see how probable are each probabilities. this function can be often used without normalisation constant because we just want to know how likely is something, what is most and least likely, not the precise probability