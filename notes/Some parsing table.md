---
title: Some parsing table
description: ""
date: 2025-05-25
tags:
  - ECOTE
categories:
  - zettelkasten
draft: false
---

We will be using: 

- [First1 set build rules](First1%20set%20build%20rules.md)
- [Follow1 set build rules](Follow1%20set%20build%20rules.md)

Algorithm to construct **a predictive parsing table**:

- $A \rightarrow \alpha \wedge a \in \text{First}(\alpha)$
  Whenever **A** is an active symbol and **a** is the current input symbol, the parser will expand *A* by $\alpha$.

- If $\alpha = \epsilon \vee \alpha \Rightarrow^* \epsilon$
  The parser will expand **A** by $\alpha$ if the current input symbol is in $\text{Follow}_1(A)$,  
  or if \$ on the input has been reached and $\epsilon \in \text{Follow}_1(A)$

## Method

1. For each production $A \rightarrow \alpha$ of the grammar, do steps 2 and 3.
2. For each terminal $a \in \text{First}_1(\alpha)$, add $A \rightarrow \alpha$ to $M[A, a]$.
3. If $\epsilon \in \text{First}_1(\alpha)$, add $A \rightarrow \alpha$ to $M[A, b]$ for each terminal $b \in \text{Follow}_1(A)$.  
   If $\epsilon \in \text{First}_1(\alpha)$ and $\epsilon \in \text{Follow}_1(A)$, add $A \rightarrow \alpha$ to $M[A, \$]$.
4. Make each undefined entry of $M$ `error`.

## Example

Algorithm in *Method* section is complicated, let's brake it down step by step.

Say you have the production set:

$$
\begin{align}
S &\rightarrow AS' \\
S' &\rightarrow +AS' \mid \epsilon \\
A &\rightarrow BA' \\
A' &\rightarrow *BA' \mid \epsilon \\
B &\rightarrow (S) \mid a
\end{align}
$$


Then, we have 5 non-terminals: $S, S', A, A', B$. For each of them we shall
first calculate the $\text{First}_1$ and $\text{Follow}_1$ functions:

| Nonterminal | $\text{First}_1$    | $\text{Follow}_1$         |
| ----------- | ------------------- | ------------------------- |
| $S$         | $\{ (, a \}$        | $\{), \epsilon \}$        |
| S$'$        | $\{ +, \epsilon \}$ | $\{ ), \epsilon \}$       |
| $A$         | $\{ (, a \}$        | $\{ +, ), \epsilon \}$    |
| A$'$        | $\{ *, \epsilon \}$ | $\{ +, ), \epsilon \}$    |
| $B$         | $\{ (, a \}$        | $\{ +, *, ), \epsilon \}$ |

Then, we will do the steps 2 and 3 for all of the non terminals, 

- for the S symbol
    - production: $S \rightarrow AS'$
        - We get all terminals of First(AS'), so $\text{First}(A) = \{+, \epsilon\}$
        - Populate the $M[S, +]$ with the $S \rightarrow AS'$
        - Populate the $M[S, \epsilon]$ with the $S \rightarrow AS'$
- for the S' symbol
    - production: $S' \rightarrow +AS'$
        - We get all terminals of First(+AS'), so +
        - Populate the $M[S', +]$ with the $S \rightarrow +AS'$
    - production: $S' \rightarrow \epsilon$
        - Because the $\text{First}(\epsilon) = \epsilon$, then we need to add the production to $M[S, b]$, for all $b$ from $\text{Follow}_1(S')$
        - Populate the $M[S', )]$ with the $S' \rightarrow \epsilon$
        - Because the $\epsilon \in \text{Follow}(S')$, then we need to add the production to $M[S, \$]$
        - Populate the $M[S', \$]$ with the $S' \rightarrow \epsilon$
- for the A symbol
    - production: $A \rightarrow BA'$
        - We get all terminals of First(BA'), so $\text{First}(B) = \{(, a \}$
        - Populate the $M[A, (]$ with the $A \rightarrow BA'$
        - Populate the $M[A, a]$ with the $A \rightarrow BA'$

... you get the idea!

finally you should have:

![](attachments/Pasted%20image%2020250525204216.png)

