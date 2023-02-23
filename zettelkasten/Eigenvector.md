# Eigenvector
> [!Definition]
A nonzero vector that changes at most by a scalar factor when that [[linear transformation]] is applied to it. The corresponding [[Eigenvalue]], often denoted by $\lambda$ , is the factor by which the eigenvector is scaled.

> [!Warning]
Not every linear transformation has eigenvectors or enough vectors to describe original system of coordinates fully!

## Notation
Every eigenvector must satisfy the equation:
$$A\cdot \vec{v} = \lambda \cdot \vec{v}$$
Where $A$ is a matrix describing transformation, $\vec{v}$ is an eigenvector and $\lambda$ is it's eigenvalue.

## Calculation
First it may be beneficial to note that in the original equation above we are mixing [[Matrix multiplication#Multiplication with scalar|scalar multiplication]] and [[Matrix multiplication#Multiplication with a vector|matrix multiplication]]. In order to make them the same operation we can write lambda as $\lambda I$ where $I$ is [[Identity Matrix]]. 
This way, after some transformations we obtain:
$$(A-\lambda I)\vec{v} = \vec{0}$$
To solve this we could say that $\vec{v}=0$ but that does not get us closer to finding true solution. 
Rather, we will focus on $A-\lambda I$ part. In practice it's just subtracting $\lambda$ from diagonal axis.
Now, we should know that to make vector times matrix result in 0 vector we can make matrix have determinant equal to 0.
Equation to make it more visual:
$$det(A-\lambda I) = 0$$
Now, if we don't remember what determinant is we may be tempted to just try all possible lambdas and see what happens. 
We can also just expand [[Determinant of a matrix]] equation and solve for $\lambda$. 

## Interpretation of results
There are really two cases that we need to bother with: 
- real solution
- imaginary solution
In case of a imaginary solution we see that the transformation is a rotation there fore there isn't any eigenvector to be found.
In case of a real solution we can find eigenvector easily by solving new system of equations.
