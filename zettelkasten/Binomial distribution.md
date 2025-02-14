---
title: "Binomial distribution"
date: 2025-02-14
description: ""
tags: 
  - "zettlekasten"
categories: []
---

# Binomial distribution
## Definition
Binomial distribution is used to calculate [Probability](Probability.md) of certain number of successes given certain number of tries and probability of them happening. 

Bi in binomial stands for certain outcome either happening or not. If situation does not have just 2 outcomes then we should use [Polynomial distribution](Polynomial%20distribution).

## Notation
We have three parameters:
- $n$ for number of tries
- $k$ for number of events happening
- $p$ for probability of event happening

We note binomial distribution function as $B(k;n,p)$
And formula for that function is equal
$$B(k;n,p) = {{n}\choose{k}} \times p^k \times p^{n-k}$$
Note that $k$ is separated from $n$ and $p$ by $;$ sign. That is because in general we will use Binomial Distribution simply as $B(n,p)$. 

## Intuition
We will often use Binomial Distribution formula as a substitute for [Calculating probability by counting events](Calculating%20probability%20by%20counting%20events.md). We do that because it's often easier to calculate all possibilities given parameters instead of calculating all possibilities separately (doing the same computation over and over with slightly different data).

### Example
#### Setup
It's best to understand this via solving concrete problem. Let's say we **toss a coin 3 times** and want to know how many times we **got face exactly 1 time**.

Cases we care about:
$${HHF, HFH, FHH}$$
$F$ - Face
$H$ - Head

We might be tempted to create set $\Omega$ and $X$ and do it classic way. However this gives us *just* a solution. What we want is a general solution to any problem where we have known number of cases and it's probability.

What we will do here is we will start with this setup and generalize it as much as we can. 

#### Generalize number of successes
First observation is that probability of each [Permutation](Permutation) of each case where we got exactly one face. In other words 
$$P(HHF) = P(HFH) = P(FHH)$$
What we could say is that it's really number of cases times probability of one of them happening. 
$$B(k;n,p) = N_{success} \times P(success)$$
To calculate $N$ we can use [Newton Symbol](Newton%20Symbol.md). We then get
$$B(k;n,p) = {{n}\choose{k}}\times P(success)$$
#### Generalize probability of success
We know that for each toss we can either get what we want or not. For example if we want to get $FFHHH$ we calculate it 
$$P(FFHHH) = p_f\times p_f\times p_h\times p_h\times p_h$$
which after rewrite becomes
$$P(FFHHH) = p_f\times p_f\times (1- p_f)\times (1-p_f)\times (1-p_f)$$
after we generalize:
$$P(\text{k faces in n tosses}) = p^k \times p^{n-k}$$
#### End result
$$B(k;n,p) ={{n}\choose{k}}\times p^k \times p^{n-k}$$
This function allows us to calculate the *discrete distribution* of each case.
