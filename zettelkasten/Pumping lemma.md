The word lemma in mathematics refers to "mini theorem"

Pumping lemma states that if a language is regular then every string in that language has a substring that can be repeated (pumped) however many times and still be in the language.

Exact phrase: 
All strings in the language can be repeated (pumped) if they are at least as long as a certain length (pumping length p, usually number of states in DFA)

## Example
Let us have a language $A = \{w | w \text{ ends with } 11 \}$ 

$p = 3$
Example strings: $011$, $1011$, $01111$ 

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
