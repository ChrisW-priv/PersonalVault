---
title: First1 set build rules
description: ""
date: 2025-05-25
tags:
  - ECOTE
categories:
  - zettelkasten
draft: false
---

[ECOTE](../projects/ECOTE/ECOTE.md)
[ECOTE-5-EN-mod](../projects/ECOTE/ECOTE-5-EN-mod.pdf)

If $\alpha$ is any string of grammar symbols, let $\text{First}(\alpha)$ be the
set of terminals that begin strings derived from $\alpha$.

## compute $\text{First}_1(\alpha)$

For all grammar symbols $\alpha$,  
apply the following rules until no more terminals or $\epsilon$ can be added to any First set:

Here is your note rewritten using LaTeX-style notation for $\epsilon$:

1. If $\alpha$ is a **terminal**, then:
   $\text{First}_1(\alpha) = {\alpha}$
2. If $\alpha$ is a **nonterminal** and if $\alpha \rightarrow a\beta$ is a production, then:
   * Add $a$ to $\text{First}\_1(\alpha)$
   * If $\alpha \rightarrow \epsilon$ is a production, then add $\epsilon$ to $\text{First}_1(\alpha)$
1. If $\alpha \rightarrow \beta_1 , \beta_2 , \dots , \beta_n$ is a production, then:
   For all $i$ such that all of $\beta_1, \beta_2, \dots, \beta_{i-1}$ are nonterminals and
   $\text{First}_1(\beta\_j)$ contains $\epsilon$ for $j = 1, 2, \dots, i-1$
   (i.e., $\beta_1 \beta_2 \dots \beta*{i-1} \Rightarrow^* \epsilon$),
   * Add every non-$\epsilon$ symbol in $\text{First}_1(\beta_i)$ to $\text{First}_1(\alpha)$
   If $\epsilon \in \text{First}_1(\beta_j)$ for all $j = 1, 2, \dots, n$,
   then add $\epsilon$ to $\text{First}_1(\alpha)$
