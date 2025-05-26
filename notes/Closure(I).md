---
title: Closure(I)
description: ""
date: 2025-05-26
tags:
  - ECOTE
categories:
  - zettelkasten
draft: false
---

If $I$ is a set of items for a grammar $G$, then the set of items $\text{Closure}(I)$ is constructed from $I$ by the rules:

1. Every item in $I$ is in $\text{Closure}(I)$.
2. If $A \rightarrow \alpha \cdot B \beta$ is in $\text{Closure}(I)$ and $B \rightarrow \gamma$ is a production, then add the item $B \rightarrow \cdot \gamma$ if it is not already there.
3. Repeat step 2 until no more items can be added.

## Example

$$
\begin{align}
S &\rightarrow A \mid S+A \\
A &\rightarrow B \mid A*B \\
B &\rightarrow (S) \mid a
\end{align}
$$

Given the initial set of items $I = \{ S' \rightarrow \cdot S \}$, the computed $\text{Closure}(I)$ contains:

- $S' \rightarrow \cdot S$
- $S \rightarrow \cdot A$
- $S \rightarrow \cdot S + A$
- $A \rightarrow \cdot B$
- $A \rightarrow \cdot A * B$
- $B \rightarrow \cdot a$
- $B \rightarrow \cdot (S)$
