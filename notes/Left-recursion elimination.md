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

$$
\begin{align}
&\text{For } i := 1 \text{ to } n:\\
    &\quad\text{For } j := 1 \text{ to } i-1:\\
        &\quad\quad\text{Replace all productions of the form } A_i \rightarrow A_j \gamma\\
        &\quad\quad\text{by: } A_i \rightarrow \delta_1\gamma \mid \delta_2\gamma \mid \dots \delta_k\gamma,\\
        &\quad\quad\text{where } A_j \rightarrow \delta_1 \mid \delta_2 \mid \dots \delta_k\\
    &\quad\text{Eliminate immediate recursion among }A_i\text{ productions}\\
    &\quad\text{Eliminate }\epsilon\text{ productions}
\end{align}
$$

### Examples

#### Example 1

$$
\begin{align}
S  &\rightarrow a \mid \wedge \mid (T) \\
T  &\rightarrow T,S \mid S \\
\end{align}
$$

Notice:

$$
T  \rightarrow T,S \mid S
$$

$\alpha=,S;\beta=S$, So this should be transformed into:

$$
\begin{align}
T  &\rightarrow ST' \\
T'  &\rightarrow ,ST' \mid \epsilon \\
\end{align}
$$

So original productions:

$$
\begin{align}
S  &\rightarrow a \mid \wedge \mid (T) \\
T  &\rightarrow T,S \mid S \\
\end{align}
$$

Were transformed into:

$$
\begin{align}
S  &\rightarrow a \mid \wedge \mid (T) \\
T  &\rightarrow ST' \\
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

i = 1
B is not left-recursive, so do nothing 

i = 2
j = 1

There is a production of B in A in the form $A \rightarrow B\gamma$ ($\gamma=\epsilon$), so we inline:

$$
A \rightarrow A*B \mid (S) \mid a \\
$$

A is left recursive, with $\alpha = *B;\beta_1=(S);\beta_2=a$, so:

$$
\begin{align}
A  &\rightarrow (S)A' \mid aA' \\
A' &\rightarrow *B A' \mid \epsilon
\end{align}
$$

And after we eliminate all $\epsilon$ productions:

$$
\begin{align}
A  &\rightarrow (S)A' \mid aA' \mid (S) \mid a \\
A' &\rightarrow *B A' \mid *B \\
\end{align}
$$

i = 3
j = 1

There are no productions in the form $S \rightarrow A\gamma$, so skip.

i = 3
j = 2

There is a production of A in S in the form $S \rightarrow A\gamma$ ($\gamma=\epsilon$), so we inline:

$$
S \rightarrow S+A \mid (S)A' \mid aA' \mid (S) \mid a
$$

S is now left recursive, with $\alpha=+A;\beta=\{(S)A', aA', (S), a\}$, so:

$$
\begin{align}
S  &\rightarrow (S)A'S' \mid aA'S' \mid (S)S' \mid aS' \\
S' &\rightarrow +AS' \mid \epsilon \\
\end{align}
$$

And after we eliminate all $\epsilon$ productions:

$$
\begin{align}
S  &\rightarrow (S)A' \mid aA' \mid (S) \mid a \mid (S)A'S' \mid aA'S' \mid (S)S' \mid aS' \\
S' &\rightarrow +AS' \mid +A \\
\end{align}
$$

#### Example 3

$$
\begin{align}
S  &\rightarrow S+A \mid A \\
A  &\rightarrow A*B \mid B \\
B  &\rightarrow (S) \mid a
\end{align}
$$

Assume the order: $S, A, B$

i = 1

S: is left-recursive, with $\alpha=+A;\beta=A$, so

$$
\begin{align}
S  &\rightarrow AS' \\
S' &\rightarrow +AS' \mid \epsilon
\end{align}
$$

After we eliminate all $\epsilon$ productions:

$$
\begin{align}
S  &\rightarrow AS' \mid A \\
S' &\rightarrow +AS' \mid +A
\end{align}
$$

Notice: $S'$ could be reduced to simple $S' \rightarrow +S$, and when we inline that to $S$:

$$
S \rightarrow A+S \mid A
$$

i = 2
j = 1
There are no productions in the form $A \rightarrow S\gamma$, so skip.

A is left recursive, with $\alpha = *B;\beta=B$, so:

$$
\begin{align}
A  &\rightarrow BA' \\
A' &\rightarrow *B A' \mid \epsilon
\end{align}
$$

And after we eliminate all $\epsilon$ productions:

$$
\begin{align}
A  &\rightarrow BA' \mid B \\
A' &\rightarrow *B A' \mid *B
\end{align}
$$

Notice: $A'$ could be reduced to simple $A' \rightarrow *A$, and when we inline that to $A$:

$$
A \rightarrow B*A \mid B
$$

i = 3
B: no left-recursion + no productions of A or S, so just end early (lazy).
