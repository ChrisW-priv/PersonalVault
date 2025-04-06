---
title: "Left-recursion elimination"
description: ""
date: "2025-04-05"
tags: []
categories:
  - zettelkasten
draft: false
---

## Simplest example

Production that is left recursive:

$$
A \rightarrow A\alpha \mid \beta
$$

This can be replaced by:

$$
\begin{align}
A  &\rightarrow \beta A' \\
A' &\rightarrow \alpha A' \mid \epsilon
\end{align}
$$

## General case

Setup:

$$
A \rightarrow A\alpha_1 \mid A\alpha_2 \mid \dots \mid A\alpha_m \mid \beta_1 \mid \beta_2 \mid \dots \mid \beta_n
$$

This can be replaced by:

$$
\begin{align}
A  &\rightarrow \beta_1 A'  \mid \beta_2 A'  \mid \dots \mid \beta_n A' \\
A' &\rightarrow \alpha_1 A' \mid \alpha_2 A' \mid \dots \mid \alpha_m A' \mid \epsilon
\end{align}
$$

This will work only if the grammar has no cycles like:

$$
\begin{align}
S  &\rightarrow Aa \mid b \\
A  &\rightarrow Ac \mid Sd \mid e
\end{align}
$$

$S$ is left-recursive: $S \rightarrow Aa \rightarrow Sda$

### Truly general case

1. Arrange non-terminals of Grammar in some order $A_1,A_2,\dots,A_n$
2. Then:

Do naive left recursion for $A_1$, and:

for i := 2 to n:
    for j := 1 to i-1
        Replace all productions of the form $A_i \rightarrow A_j \gamma$
        by: $A_i \rightarrow \delta_1\gamma \mid \delta_2\gamma \mid \dots \delta_k\gamma$, where $A_j \rightarrow \delta_1 \mid \delta_2 \mid \dots \delta_k$
        then, eliminate immediate recursion among $A_i$ productions

#### Example 1

> [!Note]
> This example does not need to use the "complex" algorithm. It can just use the "naive" solution

So this sounds complex, but really, if we have an example:

$$
\begin{align}
S  &\rightarrow a \\
S  &\rightarrow \wedge \\
S  &\rightarrow (T) \\
T  &\rightarrow T,S \\
T  &\rightarrow S \\
\end{align}
$$

We can follow this algorithm:

1. Arrange terminals: $S, T$
2. Then:

$A_i = T; A_j = S$

Do naive left recursion for $S$ (here, there are none), and:

for i := 2 to 2:
    for j := 1 to i-1:
        Replace all productions of the form $T \rightarrow S \gamma$
        by: $T \rightarrow \delta_1\gamma \mid \delta_2\gamma \mid \dots \delta_k\gamma$, where $S \rightarrow \delta_1 \mid \delta_2 \mid \dots \delta_k$

notice: there is just one loop execution

$$
\begin{align}
T  &\rightarrow T,S \\
T  &\rightarrow S \\
\end{align}
$$

Should be transformed into:

$$
\begin{align}
T  &\rightarrow ST' \mid S \\
T'  &\rightarrow ,ST' \mid \epsilon \\
\end{align}
$$

So in summary:

$$
\begin{align}
S  &\rightarrow a \mid \wedge \mid (T) \\
T  &\rightarrow T,S \mid S \\
\end{align}
$$

Was transformed into:

$$
\begin{align}
S  &\rightarrow a \mid \wedge \mid (T) \\
T  &\rightarrow ST' \mid S \\
T'  &\rightarrow ,ST' \mid \epsilon \\
\end{align}
$$

#### Example 2

$$
\begin{align}
S  &\rightarrow S+A \mid A \\
A  &\rightarrow A*B \mid B \\
B  &\rightarrow (S) \mid a
\end{align}
$$

Assume the order: $B, A, S$

Do naive left recursion for $B$ (here, there are none), and:

for i := 2 to 3:
    for i=1:
    for j := 1:
        $A_i = A; A_j = B$
        Replace all productions of the form $B \rightarrow A \gamma$
        by: $B \rightarrow \delta_1\gamma \mid \delta_2\gamma \mid \dots \delta_k\gamma$, where $A \rightarrow \delta_1 \mid \delta_2 \mid \dots \delta_k$
