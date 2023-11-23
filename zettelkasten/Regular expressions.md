## Definition
Regular expressions are algebraic way to describe language. They describe regular languages. If $E$ is a regex, then $L(E)$ is the language it defines.

### Basis 1
Let $a$ be any symbol. Then $a$ is a regex and $L(a) = \{a\}$

### Basis 2
$\epsilon$ is a regex and $L(\epsilon) = \{\epsilon\}$

### Basis 3
$\emptyset$ is a regex and $L(\emptyset) = \emptyset$

### Induction 1
if $E_1 \wedge E_2$ are regex then ($E_1 | E_2$) is regex and $L(E_1 | E_2) = L(E_1) \cup L(E_2)$

### Induction 2
if $E_1 \wedge E_2$ are regex then ($E_1E_2$) is regex and $L(E_1E_2) = L(E_1)L(E_2)$

### Induction 3
if $E$ is regex then ($E^*$) is regex and $L(E^*) = (L(E))^*$

## Re to $\epsilon$-NFA
### Basis
for $a$ transition
```tikz
\usetikzlibrary{automata,arrows}
\newcommand{\drawGraph}[2][>=stealth',shorten >=1pt,auto,node distance=1.5cm, scale=2, transform shape]{
\begin{tikzpicture}[#1]
#2
\end{tikzpicture}
}
\newcommand{\stateInitial}[1]{\node[initial,state] (#1) {#1};}
\newcommand{\state}[3][right]{\node[state] (#3) [#1 of=#2] {#3};}
\newcommand{\stateAccepting}[3][right]{\node[state,accepting] (#2) [#1 of=#3] {#2};}
\newcommand{\arrowFromTo}[4][above]{\draw[->] (#2) to node [#1, align=center] {#4} (#3);}
\newcommand{\arrowLoop}[3][below]{\draw[->] (#2) edge [loop #1] node [align=center] {#3} (#2);}


\begin{document}
\drawGraph{
	\stateInitial{0}
	\state{0}{1}
	\arrowFromTo{0}{1}{a}
}
\end{document}
```

for $\epsilon$ transition
```tikz
\usetikzlibrary{automata,arrows}
\newcommand{\drawGraph}[2][>=stealth',shorten >=1pt,auto,node distance=1.5cm, scale=2, transform shape]{
\begin{tikzpicture}[#1]
#2
\end{tikzpicture}
}
\newcommand{\stateInitial}[1]{\node[initial,state] (#1) {#1};}
\newcommand{\state}[3][right]{\node[state] (#3) [#1 of=#2] {#3};}
\newcommand{\stateAccepting}[3][right]{\node[state,accepting] (#2) [#1 of=#3] {#2};}
\newcommand{\arrowFromTo}[4][above]{\draw[->] (#2) to node [#1, align=center] {#4} (#3);}
\newcommand{\arrowLoop}[3][below]{\draw[->] (#2) edge [loop #1] node [align=center] {#3} (#2);}


\begin{document}
\drawGraph{
	\stateInitial{0}
	\state{0}{1}
	\arrowFromTo{0}{1}{$\epsilon$}
}
\end{document}
```

for $\emptyset$ transition
```tikz
\usetikzlibrary{automata,arrows}
\newcommand{\drawGraph}[2][>=stealth',shorten >=1pt,auto,node distance=1.5cm, scale=2, transform shape]{
\begin{tikzpicture}[#1]
#2
\end{tikzpicture}
}
\newcommand{\stateInitial}[1]{\node[initial,state] (#1) {#1};}
\newcommand{\state}[3][right]{\node[state] (#3) [#1 of=#2] {#3};}
\newcommand{\stateAccepting}[3][right]{\node[state,accepting] (#2) [#1 of=#3] {#2};}
\newcommand{\arrowFromTo}[4][above]{\draw[->] (#2) to node [#1, align=center] {#4} (#3);}
\newcommand{\arrowLoop}[3][below]{\draw[->] (#2) edge [loop #1] node [align=center] {#3} (#2);}


\begin{document}
\drawGraph{
	\stateInitial{0}
	\state{0}{1}
}
\end{document}
```

### Induction
$E_1|E_2$ (union)
```tikz
\usetikzlibrary{automata,arrows}
\newcommand{\drawGraph}[2][>=stealth',shorten >=1pt,auto,node distance=1.5cm, scale=2, transform shape]{
\begin{tikzpicture}[#1]
#2
\end{tikzpicture}
}
\newcommand{\stateInitial}[1]{\node[initial,state] (#1) {#1};}
\newcommand{\state}[3][right]{\node[state] (#3) [#1 of=#2] {#3};}
\newcommand{\stateAccepting}[3][right]{\node[state,accepting] (#2) [#1 of=#3] {#2};}
\newcommand{\arrowFromTo}[4][above]{\draw[->] (#2) to node [#1, align=center] {#4} (#3);}
\newcommand{\arrowLoop}[3][below]{\draw[->] (#2) edge [loop #1] node [align=center] {#3} (#2);}

\begin{document}
\drawGraph{
\stateInitial{0}
\state[above right]{0}{1}
\state[below right]{0}{2}
\arrowFromTo{0}{1}{$\epsilon$}
\arrowFromTo{0}{2}{$\epsilon$}
\arrowFromTo{1}{3}{$\epsilon$}
\arrowFromTo{2}{3}{$\epsilon$}
}

\end{document}
```
