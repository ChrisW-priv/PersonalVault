---
title: "Truth Tables"
date: 2025-02-14
description: ""
tags: 
  - "zettlekasten"
categories: []
---

Truth tables allow us to see results of aplying different inputs to specified logic gates

## Examples of most common:

### NOT ( $\lnot$ )
| P | Result |
| :-: | :-: |
|1|0|
|0|1| 
Also in math: r = 1-p

### AND ( $\land$ )
| P | Q | Result |
| :-: | :-: | :-: |
|0|0|0|
|0|1|0|
|1|0|0|
|1|1|1|
Also in math: r = pq

### OR ( $\lor$ )
| P | Q | Result |
| :-: | :-: | :-: |
|0|0|0|
|0|1|1|
|1|0|1|
|1|1|1|
Also in math: r = p+q-pq

### IF ( $\Rightarrow$ )
| P | Q | Result |
| :-: | :-: | :-: |
|0|0|1|
|0|1|1|
|1|0|0|
|1|1|1|
Can be represented as:  $\lnot$p $\lor$ q
Also in math: 1-p + pq

### IFF ( $\Leftrightarrow$ )
| P | Q | Result |
| :-: | :-: | :-: |
|0|0|1|
|0|1|0|
|1|0|0|
|1|1|1|
Can be represented as: (p $\Rightarrow$ q) $\land$ q

### XOR ( ^ )
| P | Q | Result |
| :-: | :-: | :-: |
|0|0|0|
|0|1|1|
|1|0|1|
|1|1|0|
Can be represented as: $\lnot$ (p $\Leftrightarrow$ q)

### NAND ( Shafer Stroke  | )
| P | Q | Result |
| :-: | :-: | :-: |
|0|0|1|
|0|1|1|
|1|0|1|
|1|1|0|
Can be represented as:  $\lnot$ (p $\land$ q)

### NOR
| P | Q | Result |
| :-: | :-: | :-: |
|0|0|1|
|0|1|0|
|1|0|0|
|1|1|0|
Can be represented as:  $\lnot$ (p $\lor$ q)
