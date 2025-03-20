---
categories:
- zettelkasten
date: 2025-02-14
description: The beta distribution is a family of continuous probability distributions
  defined on the closed interval from 0 to 1, characterized by shape parameters alpha
  and beta.
tags: []
title: Beta distribution
---

## Definition

In [Probability](Probability.md) and [Statistics](Statistics.md), the beta distribution function is a family of continuous probability distributions defined on the closed interval from 0 to 1. It is defined by two parameters: alpha $\alpha$ and beta $\beta$, which control the shape of the function.

The [Probability density function (PDF)](Probability%20density%20function%20(PDF)) of the beta distribution, for $0 \leq x \leq 1$ and shape parameters $\alpha, \beta > 0$, is a power function of the variable $x$ and of its reflection $(1 - x)$.

## Notation

The beta distribution can be represented with the following formula:

$$f(x,\alpha,\beta) = const. \times x^{\alpha-1} (1-x)^{\beta-1}$$

The $const.$ variable normalizes the output of the function into the 0-1 range (the integral of the whole equals 1). It can be represented by multiple functions:

### Integration from 0 to 1

$$\frac{1}{\int_0^1{ u^{\alpha-1} (1-u)^{\beta-1} du}}$$

[Integral](Integral.md)

### Gamma function

$$\frac{\Gamma(\alpha+\beta)}{\Gamma(\alpha)\Gamma(\beta)}$$

[Gamma function](Gamma%20function)

### Beta function

$$\frac{1}{B(\alpha,\beta)}$$

[Beta function](Beta%20function)

## Intuition

Given data, it can be often difficult to ascertain the exact probability of an event. Therefore, the beta distribution function acts as a helper that allows us to see how probable each outcome is. This function can often be used without the normalization constant because we are interested in understanding the likelihood of outcomes—what is most and least likely—rather than the precise probability.
