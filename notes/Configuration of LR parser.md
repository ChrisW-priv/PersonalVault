---
title: Configuration of LR parser
description: ""
date: 2025-05-26
tags:
  - ECOTE
categories:
  - zettelkasten
draft: false
---

## Parsing Table

- Parsing action function **ACTION**
- Goto function **GOTO**

### Driving Routine:

- Determines $s_m$ (stack top symbol) and $a_i$ (current input symbol)
- Consults $ACTION[s_m, a_i]$
- $ACTION[s_m, a_i]$ can have values:
  - shift $s$
  - reduce $A \rightarrow \beta$
  - accept
  - error

## Configuration of an LR parser:

A configuration:

$$
(s_0\ X_1\ s_1\ X_2\ s_2\ \ldots\ X_m\ s_m,\ a_i\ a_{i+1}\ \ldots\ a_n\ \$)
$$

### Shift:

If $ACTION[s_m, a_i] = \text{shift } s$, the parser:
- Pushes $s$ onto the stack and enters the configuration:

  $$












(s_0\ X_1\ s_1\ X_2\ s_2\ \ldots\ X_m\ s_m\ a_i\ s,\ a_{i+1}\ \ldots\ a_n\ \$)

$$
- $a_{i+1}$ becomes the new current input symbol.

### Reduce:
If $ACTION[s_m, a_i] = \text{reduce } A \rightarrow \beta$, the parser:
- Pops $2r$ symbols off the stack (for $r = |\beta|$)
- Exposes state $s_{m-r}$
- Pushes $A$ and then state $s = GOTO[s_{m-r}, A]$
- Configuration becomes:
  
$$

(s_0\ X_1\ s_1\ \ldots\ s_{m-r}\ A\ s,\ a_i\ a_{i+1}\ \ldots\ a_n\ \$)

$$
- The current input symbol is not changed.

### Accept and Error:

1. If $ACTION[s_m, a_i] = \text{accept}$, parsing is completed.
2. If $ACTION[s_m, a_i] = \text{error}$, parser calls error recovery routine.

### Initial parser configuration:
$$

(s_0,\ a_1\ a_2\ \ldots\ a_n\ \$)

$$
### Code for actions:

- $s_i$ – shift and go to state $i$
- $r_j$ – reduce by production numbered $j$
- `acc` – accept
- `blank` – error

## Example
$$

\begin{align}
S &\rightarrow S+A \mid A \\
A &\rightarrow B \mid A*B \\
B &\rightarrow (S) \mid a
\end{align}

$$

Action table:
![](attachments/Pasted%20image%2020250526124224.png)

GOTO table:
![](attachments/Pasted%20image%2020250526124338.png)

Parser Movements

| Step | Stack    | Input      |
| ---- | -------- | ---------- |
| 1    | 0        | a* a + a $ |
| 2    | 0a5      | *a + a $   |
| 3    | 0B3      | *a + a $   |
| 4    | 0A2      | *a + a $   |
| 5    | 0A2*7    | a + a $    |
| 6    | 0A2*7a5  | + a $      |
| 7    | 0A2*7B10 | + a $      |
| 8    | 0A2      | + a $      |
| 9    | 0S1      | + a $      |
| 10   | 0S1+6    | a $        |
| 11   | 0S1+6a5  | $          |
| 12   | 0S1+6B3  | $          |
| 13   | 0S1+6A9  | $          |
| 14   | 0S1      | $          |
