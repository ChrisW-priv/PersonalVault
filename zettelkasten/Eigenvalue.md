> [!Definition]
Factor by which [Eigenvector](Eigenvector.md) are scaled during [Linear transformation](Linear%20transformation.md).

> [!Warning]
Not every linear transformation has eigenvalue!

## Calculation
First it may be beneficial to rewrite equation defining eigenvector.
This way, after some transformations we obtain:
$$(A-\lambda I)\vec{v} = \vec{0}$$
To solve this we could say that $\vec{v}=0$ but that does not get us closer to finding true solution. 
Rather, we will focus on $A-\lambda I$ part. In practice it's just subtracting $\lambda$ from diagonal axis.
Now, we can exploit that [Eigenvector](Eigenvector.md) is on a null space (kernel) of the new matrix. This way if we have a transformation that "squishes" space to smaller dimension. This of course only happens when we have determinant equal to 0.
Equation to make it more visual:
$$det(A-\lambda I) = 0$$
Now, if we don't remember what determinant is we may be tempted to just try all possible lambdas and see what happens. 
We can also just expand [Determinant of a matrix](Determinant%20of%20a%20matrix.md) equation and solve for $\lambda$. 

### Trick for calculating eigenvalues for 2x2 matrix
> [!Motivation]
> This method make it much faster and more direct to get eigenvalues of this small matrix

Let $M$ be our 2x2 matrix:
$$M = \begin{bmatrix} a & b \\ c & d \end{bmatrix}$$
3 facts we need to know:
1) trace of matrix (sum od diagonal components) is equal to sum of eigenvalues
	 - $a+d=\lambda_1+\lambda_2$
2) determinant of matrix is equal to product of eigenvalues
	- $ad-bc = \lambda_1 \cdot \lambda_2$
3) now let us define $m$ as mean of $a+d$. Then our final solution will be
	- $\lambda_1,\lambda_{2}= m \pm \sqrt{m^2-p}$
 