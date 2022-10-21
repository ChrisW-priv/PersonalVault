# Linear differential equations
In notation part we get 2 ways to solve the equations

## Notation
Given function:
$y'x + p(x)y = q(x)$

$p,q$ - facntions (usually continous)

1) variation of parameters (constants) method
Step 1:
We solve corresponding homogenous equation
$y' + p(x)y = 0$
We get family of solutions $y_0$ of homogenous equation (dependent on const. $C$)

Step 2:
We look for solutions of original equation in family
$y = C(x)y_0$, where $C$ is an unknown function

2) Integrating factor
$y' + p(x)y = q(x)$
We look for function $h$ such that 
$h(x)y' + p(x)h'(x)y=(y\cdot h(x))'$
Therefore $h'() = p(x)h'(x)$ 
$\frac{dh}{dx} = p(x)h(x)$
$\int \frac{dh}{h} = \int p'(x)dx$
$ln |h| = \int p'(x)dx$
$h = Ce^{\int p'(x)dx}, C(x)$ 

$h$ is called an integration factor

## Examples
Examples with no solutions attached are in [[edde03.pdf]] in part 2
