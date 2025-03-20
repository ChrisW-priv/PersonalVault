---
categories: []
date: 2025-02-14
description: No description provided.
tags:
- zettlekasten
title: Pumping lemma
---

[[ELAC]]

The word lemma in mathematics refers to "mini theorem"

Pumping lemma states that if a language is regular then every string in that language has a substring that can be repeated (pumped) however many times and still be in the language.

More formally

All strings in the language can be repeated (pumped) if they are at least as long as a certain length (pumping length p, usually number of states in DFA)

Exact:

If A is regular language, then there is a number $p$ (the pumping length) where if $s$ is any string $A$ that is at least length $p$ then $s$ may be divided into 3 pieces, $s = xyz$, satisfying the following conditions:

1. for each $i \geq 0, xy^iz \in A$
2. $|y| > 0$
3. $|xy| \leq p$

Intuitively: we cannot pump empty string and the pumping part must be within first p symbols.

## Example

Let us have a language $A = \{w | w \text{ ends with } 11 \}$ 

```tikz
\usetikzlibrary{automata,arrows}
\newcommand{\drawGraph}[2][>=stealth',shorten >=1pt,auto,node distance=1.5cm, scale=2, transform shape]{
\begin{tikzpicture}[#1]
#2
\end{tikzpicture}
}
\newcommand{\stateInitial}[1]{\node[initial,state] (#1) {#1};}
\newcommand{\state}[3][right]{\node[state] (#3) [#1 of=#2] {#3};}
\newcommand{\stateAccepting}[3][right]{\node[state,accepting] (#3) [#1 of=#2] {#3};}
\newcommand{\arrowFromTo}[4][above]{\draw[->] (#2) to node [#1, align=center] {#4} (#3);}
\newcommand{\arrowLoop}[3][below]{\draw[->] (#2) edge [loop #1] node [align=center] {#3} (#2);}
\newcommand{\arrowBelow}[4][above]{\draw[->] (#2) .. controls +(270:10mm) and +(270:10mm) .. node [#1, align=center] {#4} (#3);}
\newcommand{\arrowAbove}[4][above]{\draw[->] (#2) .. controls +(90:10mm) and +(90:10mm) .. node [#1, align=center] {#4} (#3);}

\begin{document}
\drawGraph{
	\stateInitial{0}
	\state{0}{1}
	\stateAccepting{1}{2}
	\arrowLoop{0}{0}
	\arrowLoop{2}{1}
	\arrowFromTo{0}{1}{1}
	\arrowAbove{1}{0}{0}
	\arrowBelow[below]{2}{0}{0}
	\arrowFromTo{1}{2}{1}	
}
\end{document}
```

$p = 3$

Example strings: $011$, $1011$, $01111$ 

P.L states that we can find such substrings such that we can pump it however many times we like and language is still in the language.

Example:

$011$ -> 000000011

$1011$ -> 101010101011

$01111$ -> 000000001111

## Proving language is nonregular

Every regular language can be represented by DFA or NFA or regex. Every language that is regular will follow pumping lemma.

Non regular languages cannot be represented by graphs or regex and do not follow P.L.

### Proof my contradiction

Let us define a language $B = \{ 0^n1^n | n \geq 0 \}$

Since we prove by contradiction we will say: assume that $B$ is regular, then it has to follow the P.L. if it does not then it is not regular. 

Start by finding p. Because it is general case we choose $B = \{ 0^p1^p | p \geq 0 \}$. Any string is at least length p and cannot be pumped.

Prove that it cannot be pumped.

There are 3 cases:

1. we choose string length p that is all 0's
2. we choose string length p that is all 1's
3. we choose string length p that is combination of the two.

We can eliminate the 2. and 3. case as string that can be pumped needs to be in the first p symbols. however even if that was not the case:

if we choose 1. then it will not be valid as if we pump the 0's then string will not be balanced and string created is outside the language.

if we choose 2. then it will not be valid as if we pump the 1's then string will not be balanced and string created is outside the language.

if we choose 3. then it will not be valid as if we pump the 01 substring then string contain `0101..` section that violates the string rule (string created is outside the language).