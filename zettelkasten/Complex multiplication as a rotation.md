## Complex numbers in rotations
[[Complex numbers]] can be seen as a rotation tools. For eg. $i$ rotates 2d plane $90\degree$ counter clock-wise. it does so because real number $5 \cdot i=5i$ and that follows for any number on real axis. As general idea: any complex number we multiply by can be seen as a Matrix that rotates and/or squishes complex plane. Because complex number is a place where vector defining real part lands we can convert it entire computation to [[Matrix multiplication]] and for every complex number $z = a+bi$ define matrix $M=\begin{bmatrix}a & -b \\ b & a\end{bmatrix}$. 
> [!Note] 
> For complex number $i$ we can construct matrix $M=\begin{bmatrix}0 & -1 \\ 1 & 0\end{bmatrix}$. We can simplyfy this by simply moving vector components. For complex number represented by vector $v = (a,b), v\cdot i = (-b,a)$ 

### Computational optimisation
We will heavily base our efficiency in facts:
- multiplication is distributive
- complex numbers can be seen as vectors

For any two numbers $z_1=(a+bi), z_2=(c+di)$ we will write multiplication as $z_1 \cdot z_2 = (a,b)\cdot(c,d) = a(c,d) + b\cdot i(c,d)$ Then $a(c,d)$ becomes $(ac,ad) + b\cdot i(c,d)$ latter becomes $b(-d,c) =  (-bd,bc)$ and so vector addition of those $(ac-bd,ad+bc)$. 

> [!Note]
> This is basically just verbose way of why complex product always equals  $(ac-bd,ad+bc)$ no real optimisation is present!

