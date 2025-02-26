---
title: "Derivative of exponential functions"
date: 2025-02-14
description: ""
tags: 
  - "zettlekasten"
categories: []
---

[Exponential functions](Exponential%20functions.md)

## Intro

Using definition of derivatives:

$$\frac{df}{dx}(x) = \lim_{dx \rightarrow 0}  \frac{f(x+dt) - f(x)}{dt} = \lim_{dx \rightarrow 0} \frac{\mathbb{c}^{x+dx} - \mathbb{c}^x}{dx} = \lim_{dx \rightarrow 0}\mathbb{c}^x\cdot \frac{\mathbb{c}^{dx}-1}{dx}$$

So the derivative of this function is itself times some constant $\lim_{dx \rightarrow 0}\frac{\mathbb{c}^{dx}-1}{dx}$.

Question: "Is there a special number for which this constant equals 1?" 

Answer: "YES, there is, it's a special number $e$". In a sense it is what defines $e$.

Properties of this number e can be found [here](Number%20e.md).

## Steps to calculate the derivative:

1. Write $\mathbb{c}$ as $e^{ln(\mathbb{c})}$ and $\mathbb{c}^{x} = e^{ln(\mathbb{c})\cdot x}$
2. Using chain rule we see that $\frac{df}{dx}\ e^{ln(\mathbb{c})\cdot x} = ln(n)\cdot e^{ln(\mathbb{c})\cdot x}$
3. And then since $\mathbb{c}^{x} = e^{ln(\mathbb{c})\cdot x}$ we note that $\mathbb{c}^{x} = ln(\mathbb{c})\cdot \mathbb{c}^{x}$ 

So a rate of change of any exponential function is itself times $ln(base)$ 
