---
title: GOTO function
description: ""
date: 2025-05-26
tags:
  - ECOTE
categories:
  - zettelkasten
draft: false
---

Let:
- $I$ be a set of items
- $X$ be a grammar symbol

Then:

$$
\text{GOTO}(I, X) = \text{CLOSURE}\left(\left\{ [A \rightarrow \alpha X \cdot \beta] \mid [A \rightarrow \alpha \cdot X \beta] \in I \right\} \right)
$$

That is, GOTO$(I, X)$ is the closure of the set of all items $[A \rightarrow \alpha X \cdot \beta]$ such that $[A \rightarrow \alpha \cdot X \beta]$ is in $I$.

Or in other words: for all productions in set $I$ in the form $[A \rightarrow \alpha \cdot X \beta]$, we will create, $[A \rightarrow \alpha X \cdot \beta]$

---

## Example

Let:

$$
I = \{ [S' \rightarrow S \cdot],\ [S \rightarrow S \cdot + A] \}
$$

Then:

$$
\text{GOTO}(I, +) = 
\begin{cases}
S \rightarrow S + \cdot A \\
A \rightarrow \cdot B \\
A \rightarrow \cdot A * B \\
B \rightarrow \cdot a \\
B \rightarrow \cdot (S)
\end{cases}
$$
