# Cross product
## Definition
[Function in Mathematics](Function%20in%20Mathematics.md) taking two [vectors](Vector.md) as input and returning a real number. Order of vectors matters (impacts the sign of the result).

## Notation
For given vectors $\vec{u}, \vec{v}$ dot product between then will be noted as $$\vec{u} \times \vec{v}$$ 
## Intuition
For given vectors $\vec{u}, \vec{v}$ cross product can be interpreted as:
- For 2d: area of pararelopiped defined by those vectors
- For 3d: a vector that is perpendicular to the vectors and of magnitude equal to the area of those vectors

If we visualise it we can see that the cross product for 3d is a vector that defines a volume of a shape defined by 2 vectors and dot product between this vector and any other 3d vector results in a volume for shape defined by 3 vectors.
[video explaining this fenomena more clearly and with animations](https://www.youtube.com/watch?v=eu6i7WJeinw&list=PLZHQObOWTQDPD3MizzM2xVFitgF8hE_ab&index=10)

## Computation
> [!Note] 
> Only possible if vectors are of dimensions 2 and 3, so only possible for R2 and R3 (and for R7 somehow but this I don't understand)

### For 2d:
For two 2d vectors $\vec{v}, \vec{w}$ we can build a matrix and compute it's determinant.
$$\vec{v} = \begin{bmatrix} a \\ b\end{bmatrix}, 
\vec{w} = \begin{bmatrix} c \\ d\end{bmatrix}$$
create a matrix $M = \begin{bmatrix} a & c \\ b &d \end{bmatrix}$, and compute determinant: $det(M) = ad-bc$ 

### For 3d:
For two 2d vectors $\vec{v}, \vec{w}$ we can build a matrix and compute it's determinant.
$$\vec{v} = 
\begin{bmatrix} a \\ b \\ c\end{bmatrix}, 
\vec{w} = 
\begin{bmatrix} d \\ e \\ f\end{bmatrix}$$
create a matrix 
$$M = \begin{bmatrix} 
\hat{i} & a & d \\ 
\hat{j} & b & e \\
\hat{k} & c & f \end{bmatrix}$$and compute determinant: $det(M) = \hat{i}(bf-ce) - \hat{j}(af-cd) + \hat{k}(ae-bd)$, creating a vector equal to $\begin{bmatrix} bf-ce \\ cd-af \\  ae-bd \end{bmatrix}$
