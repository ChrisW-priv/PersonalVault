Regular expressions are algebraic way to describe language. They describe regular languages.

If $E$ is a regex, then $L(E)$ is the language it defines.

```tikz
\begin{document}
\begin{tikzpicture}
\node[initial,state] (start) {0};
\node[state] (s0) [above right of=start] {1};
\node[state] (s1) [right of=s0] {2};
\node[state] (s2) [right of=s1] {3};
\node[state, accepting] (s3) [below right of=s2] {7};
\draw[->] (s0) to node [above, align=center] {1} (s1);
\draw[->] (s1) to node [above, align=center] {0} (s2);
\draw[->] (s2) to node [above, align=center] {$\epsilon$} (s3);
\draw[->] (s2) .. controls +(90:10mm) and +(90:10mm) .. node [above, align=center] {$\epsilon$} (s1);

\node[state] (s10) [below right of=start] {4};
\node[state] (s11) [right of=s10] {5};
\node[state] (s12) [right of=s11] {6};
\draw[->] (s10) to node [above, align=center] {1} (s11);
\draw[->] (s11) to node [above, align=center] {0} (s12);
\draw[->] (s12) to node [below, align=center] {$\epsilon$} (s3);
\draw[->] (s12) .. controls +(90:10mm) and +(90:10mm) .. node [above, align=center] {$\epsilon$} (s11);

\draw[->] (start) to node [above, align=center] {$\epsilon$} (s0);
\draw[->] (start) to node [above, align=center] {$\epsilon$} (s10);

\end{tikzpicture}
\end{document}
```

