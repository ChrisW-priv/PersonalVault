---
title: "Combining probability with OR"
date: 2025-02-14
description: ""
tags: 
  - "zettlekasten"
categories: []
---

[Probability](Probability.md)
# Combining probability with OR
## Definition
We use OR logic operator when we want to know what is the probability of either of two (or more) events happening.

## Notation
If we have two events $A,B$ then probability of EITHER of them happening will be noted as $\text{P(A) OR P(B)}$.

We can calculate it by multiplying the probabilities of both $\text{P(A) OR P(B)} = P(A) + P(B) - P(A,B)$
Where $P(A,B)$ is a result of [Combining probability with AND](Combining%20probability%20with%20AND.md).

> [!Note] 
> For events that are mutually exclusive $P(A,B) = 0$ and so we can simplify equation to $\text{P(A) OR P(B)} = P(A) + P(B)$

## Intuition
First part of the equation is rather intuitive. If we say "What is the probability of rolling 1 or 2" then we intuitively know that it's $\frac16 +\frac16$. This works for any mutually exclusive events! However when we consider "What is the probability of rolling 6 or tossing heads" then when you actually list all possibilities:
$${(1,h),(2,h),(3,h),(4,h),(5,h),(6,h), (6,t)}$$
Note that if we simply added probabilities of both then we would count $(6,h)$ twice! To eliminate the double count we have to subtract intersection of two events once.