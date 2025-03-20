---
categories:
- zettelkasten
date: 2025-02-14
description: No description provided.
tags: []
title: Calculating probability by counting events
---

## Definition

One easy way of calculating [Probability](Probability.md) of events is to calculate number of all situations we care about and divide it by number of all situations that can happen.

## Notation

A set of events we care about is often noted as $X$

A set of all possible events is noted as greek Omega letter: $\Omega$ 

Probability of event in set $X$ happening will be calculated as:

$$P(X) = \frac{\text{Number of elements in X}}{\text{Number of elements in}\ \Omega} \in <0,1>$$

## Intuition

Set $\Omega$ doesn't have to contain only singular elements. Instead it can hold ordered pairs of elements. For example if we roll the dice two times our $\Omega$ set would look like this: $${(1,1), (1,2), (1,3), ..., (2,1),...(6,4),(6,5),(6,6)}$$

if we want to ask "How many times do we roll 1 if we roll dice two times" our $X$ is gonna be $$(1,1), (1,2), (1,3), (1,4), (1,5), (1,6), (2,1), (3,1), (4,1), (5,1), (6,1)$$

> [!note] 
> Here we don't care about the order! 

In this example $P(X) = \frac{11}{36}$. 

Notice that if we weren't careful we could count case $(1,1)$ twice! That's because we could say "We can roll 1 if we get 1 in first or second roll". Then when we calculated those we would get $P(1 \text{ in first roll}) = \frac16$, $P(1 \text{ in second roll}) = \frac16$. If we simply added them that would result in $\frac26$ or $\frac{12}{36}$ instead of correct $\frac{11}{36}$!