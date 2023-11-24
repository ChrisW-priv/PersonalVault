## What is closure
Closure property is a statement that a certain operation on languages when applied to languages in a class (e.g. RE languages), produces a result that is also in that class

For regular languages we can use any representation to prove a closure property

## Union
If $L$ and $M$ are regular languages, so is $L \cup M$ 
$R|S$ is a regex whose language is $L \cup M$ 
## Intersection
If $L$ and $M$ are regular languages, so is $L \cap M$ 

Construct $C$ as a product of automaton $A$ and $B$ that are DFA's of languages $L$ and $M$, respectively

Make the final states of C be pairs consisting final states of both $A$ and $B$
DFA $A$:
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
	\stateInitial{A}
	\state{A}{B}
	\arrowFromTo{A}{B}{1}
	\arrowAbove{B}{A}{0,1}
	\arrowLoop{A}{0}
}
\end{document}
```

DFA $B$:
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
	\stateInitial{C}
	\state{C}{D}
	\arrowFromTo{C}{D}{0}
	\arrowAbove{D}{C}{1}
	\arrowLoop{D}{0}
	\arrowLoop{C}{1}
}
\end{document}
```
DFA $C$
```tikz
\usetikzlibrary{automata,arrows}
\newcommand{\drawGraph}[2][>=stealth',shorten >=1pt,auto,node distance=1.5cm, scale=2, transform shape]{
\begin{tikzpicture}[#1]
#2
\end{tikzpicture}
}
\newcommand{\stateInitial}[1]{\node[initial,state] (#1) {#1};}
\newcommand{\stateInitialWithCaption}[2]{\node[initial,state] (#1) {#2};}
\newcommand{\state}[3][right]{\node[state] (#3) [#1 of=#2] {#3};}
\newcommand{\stateWithCaption}[4][right]{\node[state] (#3) [#1 of=#2] {#4};}
\newcommand{\stateAccepting}[3][right]{\node[state,accepting] (#3) [#1 of=#2] {#3};}
\newcommand{\stateAcceptingWithCaption}[4][right]{\node[state,accepting] (#3) [#1 of=#2] {#4};}
\newcommand{\arrowFromTo}[4][above]{\draw[->] (#2) to node [#1, align=center] {#4} (#3);}
\newcommand{\arrowLoop}[3][below]{\draw[->] (#2) edge [loop #1] node [align=center] {#3} (#2);}
\newcommand{\arrowBelow}[4][above]{\draw[->] (#2) .. controls +(0:10mm) and +(270:10mm) .. node [#1, align=center] {#4} (#3);}
\newcommand{\arrowAbove}[4][above]{\draw[->] (#2) .. controls +(90:10mm) and +(90:10mm) .. node [#1, align=center] {#4} (#3);}
\newcommand{\arrowLeft}[4][above]{\draw[->] (#2) .. controls +(180:10mm) and +(180:10mm) .. node [#1, align=center] {#4} (#3);}
\begin{document}
\drawGraph[>=stealth',shorten >=1pt,auto,node distance=3cm, scale=2, transform shape]{
	\stateInitialWithCaption{0}{$[A,C]$}
	\stateWithCaption{0}{1}{$[A,D]$}
	\stateWithCaption[below]{1}{2}{$[B,D]$}
	\stateAcceptingWithCaption[below]{0}{3}{$[B,C]$}
	\arrowFromTo{0}{1}{0}
	\arrowFromTo{0}{3}{1}
	\arrowFromTo{1}{3}{1}
	\arrowLeft{3}{0}{1}
	\arrowBelow{3}{1}{0}
	\draw[->] (2) .. controls +(180:10mm) and +(270:10mm) .. node [below, align=center] {1} (0);
	\arrowFromTo{2}{1}{0}
	\arrowLoop[above]{1}{0}
}
\end{document}
```

## Difference
If $L$ and $M$ are regular languages, so is $L - M$  = strings in $L$ but not in $M$.

Construct $C$ as a product of automaton $A$ and $B$ that are DFA's of languages $L$ and $M$, respectively

Make the final states of C be the pairs where A-state is final but B-state is not.
$A$ and $B$ same as in Intersection rule
```tikz
\usetikzlibrary{automata,arrows}
\newcommand{\drawGraph}[2][>=stealth',shorten >=1pt,auto,node distance=1.5cm, scale=2, transform shape]{
\begin{tikzpicture}[#1]
#2
\end{tikzpicture}
}
\newcommand{\stateInitial}[1]{\node[initial,state] (#1) {#1};}
\newcommand{\stateInitialWithCaption}[2]{\node[initial,state] (#1) {#2};}
\newcommand{\state}[3][right]{\node[state] (#3) [#1 of=#2] {#3};}
\newcommand{\stateWithCaption}[4][right]{\node[state] (#3) [#1 of=#2] {#4};}
\newcommand{\stateAccepting}[3][right]{\node[state,accepting] (#3) [#1 of=#2] {#3};}
\newcommand{\stateAcceptingWithCaption}[4][right]{\node[state,accepting] (#3) [#1 of=#2] {#4};}
\newcommand{\arrowFromTo}[4][above]{\draw[->] (#2) to node [#1, align=center] {#4} (#3);}
\newcommand{\arrowLoop}[3][below]{\draw[->] (#2) edge [loop #1] node [align=center] {#3} (#2);}
\newcommand{\arrowBelow}[4][above]{\draw[->] (#2) .. controls +(0:10mm) and +(270:10mm) .. node [#1, align=center] {#4} (#3);}
\newcommand{\arrowAbove}[4][above]{\draw[->] (#2) .. controls +(90:10mm) and +(90:10mm) .. node [#1, align=center] {#4} (#3);}
\newcommand{\arrowLeft}[4][above]{\draw[->] (#2) .. controls +(180:10mm) and +(180:10mm) .. node [#1, align=center] {#4} (#3);}
\begin{document}
\drawGraph[>=stealth',shorten >=1pt,auto,node distance=3cm, scale=2, transform shape]{
	\stateInitialWithCaption{0}{$[A,C]$}
	\stateWithCaption{0}{1}{$[A,D]$}
	\stateWithCaption[below]{0}{3}{$[B,C]$}
	\stateAcceptingWithCaption[below]{1}{2}{$[B,D]$}
	\arrowFromTo{0}{1}{0}
	\arrowFromTo{0}{3}{1}
	\arrowFromTo{1}{3}{1}
	\arrowLeft{3}{0}{1}
	\arrowBelow{3}{1}{0}
	\draw[->] (2) .. controls +(180:10mm) and +(270:10mm) .. node [below, align=center] {1} (0);
	\arrowFromTo{2}{1}{0}
	\arrowLoop[above]{1}{0}
}
\end{document}
```

## Complementation
The complement of a language $L$ (with respect to an alphabet $\Sigma$ such that $\Sigma^*$ contains $L$) is $\Sigma^* – L$

Since $\Sigma^*$ is surely regular, the complement of a regular language is always regular.

## Concatenation
If $RS$ are regex whose language is $LM$

## Kleene Closure
If $R^*$ are regex whose language is $L^*$

## Reversal
Given language L, L R is the set of strings whose reversal is in L.
Example: L = {0, 01, 100}; L R = {0, 10, 001}.

Basis: If $E$ is a symbol $a, \epsilon, \emptyset$, then $E^R = E$.

## Homomorphism

## Inverse Homomorphism
