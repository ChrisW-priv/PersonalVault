Each model will have variables like:
$$
\begin{split}
x = Ax + Bu\\
y = Cx + Du
\end{split}
$$
where 
x = real vector of size n
u = real vector of size m
y = real vector of size p
A is a matrix of real numbers with size $n\times n$
B is a matrix of real numbers with size $n\times m$
C is a matrix of real numbers with size $p\times n$ = $I$
D is a matrix of real numbers with size $p\times m$ = zeros

## Stability
if $\text{eig}(A) < 0$ then model is stable

## Example
