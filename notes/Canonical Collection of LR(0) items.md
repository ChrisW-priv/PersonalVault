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

## Example

1. $A \rightarrow \cdot XYZ$  
   We are expecting to see a string derivable from $XYZ$ next on the input.

2. $A \rightarrow X \cdot YZ$  
   We have just seen a string derivable from $X$ and we expect to see a string derivable from $YZ$.
- We group items into sets. The items can be viewed as states of NFA recognising viable prefixes.
- One collection of sets of items – **canonical collection LR(0)** – provides a basis for constructing simple LR parsers (**SLR**).
