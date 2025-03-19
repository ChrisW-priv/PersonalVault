---
title: Bayes rule
date: 2025-02-14
description: A theorem that describes the probability of an event based on prior knowledge of conditions.
tags:
  - probability
  - math
categories:
  - zettelkasten
---

> Bayesian inference is fundamental to [Bayesian statistics](Bayesian%20statistics), being considered "to the theory of probability what Pythagoras's theorem is to geometry."

## What is it for?

Bayes' rule provides a way to update our beliefs about an event based on new evidence. In the context of Bayesian probability interpretation, the theorem expresses how a degree of belief, expressed as a probability, should rationally change to account for the availability of related evidence. 

## Notation

The equation for Bayes' rule is given by:

$$P(A\mid B)= \frac{P(A)\times P(B\mid A)}{P(B)} = \frac{P(A \cap B)}{P(B)}$$

- $P(A\mid B)$: Conditional probability—the probability of event $A$ occurring given that $B$ is true (posterior probability).
- $P(B\mid A)$: Conditional probability—the probability of event $B$ occurring given that $A$ is true.
- $P(A)$: The probability of observing event $A$ without conditions (prior probability).
- $P(B)$: The probability of observing event $B$ without conditions (prior probability).

> [!Notice]
> The second equation is derived directly from the [Conditional probability](Conditional%20probability.md).

## Intuition

The theorem can be visualized through various problems, aiding in understanding its application. To make the theorem clearer, we can rename the variables to reflect a typical hypothesis testing scenario:

$$P(H\mid D)= \frac{P(H)\times P(D\mid H)}{P(D)}$$

- $P(H\mid D)$: The probability of the hypothesis being true given observed data (posterior probability).
- $P(D\mid H)$: The probability of observing the data if we assume our hypothesis is true.
- $P(H)$: The probability of the hypothesis being true prior to observing any data.
- $P(D)$: The overall probability of observing the data without any conditions.

This interpretation allows us to understand the process as, "How probable is our hypothesis given the data if we know the probability of the data occurring under our hypothesis and the probability of our hypothesis ever occurring?"