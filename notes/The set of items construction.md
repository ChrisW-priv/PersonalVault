---
title: The set of items construction
description: ""
date: 2025-05-26
tags:
  - ECOTE
categories:
  - zettelkasten
draft: false
---

[Closure(I)](Closure(I).md)
[GOTO function](GOTO%20function.md)

$$
\begin{align}
&\textbf{Procedure } \text{ITEMS}(G'):\\
&\quad C := \{ \text{CLOSURE}(\{ S' \rightarrow \cdot S \}) \} \\
&\quad \textbf{Repeat:} \\
&\quad\quad \textbf{For each } I \in C \text{ and each grammar symbol } X:\\
&\quad\quad\quad \textbf{If } \text{GOTO}(I, X) \neq \emptyset \text{ and } \text{GOTO}(I, X) \notin C:\\
&\quad\quad\quad\quad C := C \cup \{ \text{GOTO}(I, X) \} \\
&\quad \textbf{Until no more items can be added to } C
\end{align}
$$

Example: 

$$
\begin{align}
S &\rightarrow A \mid S+A \\
A &\rightarrow B \mid A*B \\
B &\rightarrow (S) \mid a
\end{align}
$$

- $I_0$  = Result of Closure({S'->S})

$$
\begin{align}
S' &\rightarrow \cdot S \\
S &\rightarrow \cdot A \\
S &\rightarrow \cdot S + A \\
A &\rightarrow \cdot B \\
A &\rightarrow \cdot A * B \\
B &\rightarrow \cdot a \\
B &\rightarrow \cdot (S)
\end{align}
$$

- **$I_1 = \text{goto}(I_0, S)$**

$$
\begin{align}
S' &\rightarrow S \cdot \\
S &\rightarrow S \cdot + A
\end{align}
$$

- **$I_2 = \text{goto}(I_0, A)$**

$$
\begin{align}
S &\rightarrow A \cdot \\
A &\rightarrow A \cdot * B
\end{align}
$$

- **$I_3 = \text{goto}(I_0, B)$**

$$
\begin{align}
A &\rightarrow B \cdot
\end{align}
$$

- **$I_4 = \text{goto}(I_0, "(")$**

$$
\begin{align}
B &\rightarrow ( \cdot S ) \\
S &\rightarrow \cdot A \\
S &\rightarrow \cdot S + A \\
A &\rightarrow \cdot B \\
A &\rightarrow \cdot A * B \\
B &\rightarrow \cdot a \\
B &\rightarrow \cdot (S)
\end{align}
$$

- **$I_5 = \text{goto}(I_0, a)$**

$$
\begin{align}
B &\rightarrow a \cdot
\end{align}
$$

- **$I_6 = \text{goto}(I_1, +)$**

$$
\begin{align}
S &\rightarrow S + \cdot A \\
A &\rightarrow \cdot B \\
A &\rightarrow \cdot A * B \\
B &\rightarrow \cdot a \\
B &\rightarrow \cdot (S)
\end{align}
$$

- **$I_7 = \text{goto}(I_2, *)$**

$$
\begin{align}
A &\rightarrow A * \cdot B \\
B &\rightarrow \cdot a \\
B &\rightarrow \cdot (S)
\end{align}
$$

- **$I_8 = \text{goto}(I_4, S)$**

$$
\begin{align}
B &\rightarrow ( S \cdot ) \\
S &\rightarrow S \cdot + A
\end{align}
$$

- **$I_9 = \text{goto}(I_6, A)$**

$$
\begin{align}
S &\rightarrow S + A \cdot \\
A &\rightarrow A \cdot * B
\end{align}
$$

- **$I_{10} = \text{goto}(I_7, B)$**

$$
\begin{align}
A &\rightarrow A * B \cdot
\end{align}
$$

- **$I_{11} = \text{goto}(I_8, ")" )$**

$$
\begin{align}
B &\rightarrow ( S ) \cdot
\end{align}
$$
