---
title: Canonical Collection of LR(0) items
description: ""
date: 2025-05-26
tags:
  - ECOTE
categories:
  - zettelkasten
draft: false
---

[GOTO function](GOTO%20function.md)

- Construction of a DFA from the grammar, then turning it into parsing table.
- DFA recognises **viable prefixes** – prefixes of the right-sentential forms that do not contain any symbols to the right of the handle.

## LR(0) item

- An item is a production of G with a dot at some position of the right side.
- Production $A \rightarrow XYZ$ generates 4 items:
  1. $A \rightarrow \cdot XYZ$
  2. $A \rightarrow X \cdot YZ$
  3. $A \rightarrow XY \cdot Z$
  4. $A \rightarrow XYZ \cdot$

- Items can be represented as pairs of integers (production number, position of the dot).
- An item indicates how much of a production we have seen at a given point in the parsing process.

### Example

1. $A \rightarrow \cdot XYZ$  
   We are expecting to see a string derivable from $XYZ$ next on the input.

2. $A \rightarrow X \cdot YZ$  
   We have just seen a string derivable from $X$ and we expect to see a string derivable from $YZ$.
- We group items into sets. The items can be viewed as states of NFA recognising viable prefixes.
- One collection of sets of items – **canonical collection LR(0)** – provides a basis for constructing simple LR parsers (**SLR**).

### Example 2

$$
\begin{align}
S  &\rightarrow aSa \mid b \\
\end{align}
$$
First1(S) = a, b
Follow1(S) = a, eps

Start with $I_0 = Cl(\{S' \rightarrow .S\})$

S' -> .S     (1)
S -> .aSa  (2)
S -> .b      (3)

I_1 = goto (I_0, S)
S' -> S.

I_2 = goto (I_0, a)
S -> a.Sa  (4)
S -> .aSa  (2)
S -> .b     (3)

I_3 = goto (I_0, b)
S -> b.

I_4 = goto (I_2, S)
S -> aS.a   (5)

I_5 = goto (I_4, a)
S -> aSa.


|     | a   | b   | $   | S   |
| --- | --- | --- | --- | --- |
| 0   | s2  | s3  |     | 1   |
| 1   |     |     | acc |     |
| 2   | s2  | s3  |     | 4   |
| 3   | r2  |     | r2  |     |
| 4   | s5  |     |     |     |
| 5   | r1  |     | r1  |     |
