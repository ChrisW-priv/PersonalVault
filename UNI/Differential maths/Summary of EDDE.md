Methods to solve ODEs:
1.  [[Separation of Variables]]
2.  [[Homogenous equations]]
3.  [[Linear differential equations]]
4.  [[Bernoulli equations]]
5.  [[Exact method for solving ODEs|Exact method]] with optional [[Integrating factor for exact method|integrating factor]]

## Separation of Variables
**Step 1:** Change the equation to the form
$$F(y)dy = G(x)dx$$
**Step 2:** Integrate both sides
$$\int F(y)dy = \int G(x)dx$$
**Step 3:** Solve this new equation like any other

## Homogenous equations
**Step 1:** Let $y=vx$
**Step 2:** Differentiate both sides using product rule
$$dy=x\cdot dv + v\cdot dx$$
**Step 3:** Substitute
**Step 4:** Simplify
**Step 5:** [[Separation of Variables]]
**Step 6:** Substitute back $v = \frac{x}{y}$

## Linear differential equations
Given a function:
$$y' + P(x)y = Q(x)$$
**Step 1:** Calculate an integrating factor
$$I(x) = e^{\int P(x)dx}$$
**Step 2:** Calculate general solution
$$y = \frac1{I(x)}\left[\int Q(x)I(x)dx\right]$$

## Bernoulli equations
For a function in a form
$$y + P(x)y' = Q(x)\cdot y^n$$

**Step 1:** Find an integrating factor following this formula
$$I(x) = e^{\int (1-n)P(x)dx}$$
**Step 2:** Solve equation
$$y^{1-n} = \frac1{I(x)}\left[\int (1-n)Q(x)I(x) dx \right]$$


## Exact method
**Step 1:** Turn equation into a form: $f(x,y) := P(x,y) dx + Q(x,y) dy = 0$

**Step 2:** Calculate $P_y, Q_x$
**Step 3:** Calculate $Q_x-P_y$.
if equal to 0: follow to **Step 4**, else follow the [[Integrating factor for exact method]]

**Step 4:** Integrate P over x or Q over y. 
$$f(x,y) = \int{P dx} = \int{Q dy}$$

**Step 5:** Use one of $f_x = P, f_y = Q$ properies.
Just differentiate the $f$ over $dy$ (or $dx$ if we integrated $Q$)

## Integrating factor for exact equations
For a original function $$f(x,y) := P(x,y) dx + Q(x,y) dy = 0$$ 
we transform it into $$f(x,y) := P(x,y)\mu dx + Q(x,y)\mu dy = 0$$

### Calculating $\mu$
1. $$\frac{\mu'}{\mu} = \frac{P_y-Q_x}{Q}\text{ and dx in the integral}$$
or, if that is dependant on both x and y:
2. $$\frac{\mu'}{\mu} = \frac{Q_x-P_y}{P}\text{ and dy in the integral}$$
to get $\mu$ just integrate both side using $dx$ or $dy$ depending how u got $\frac{\mu'}{\mu}$. 

# Table of derivatives
| Function | Derivative |
| :-: | :-: |
| scalars | 0 |
| $x^n,\ n\in \mathbb{N}-\set{0}$ | $n\cdot x^{n-1}$ |
| $ln(x)$ | $\frac{1}{x}$ |
| $e^x$ | $e^x$ |
| $e^{c\cdot x}$ | $c\cdot e^{cx}$ |
| $\mathbb{c}^{x}$ |$\mathbb{c}^{x} = ln(\mathbb{c})\cdot \mathbb{c}^{x}$ |
| sin(x) | cos(x) |
| cos(x) | -sin(x) |
| tan(x) |$\frac1{cos^2(x)}$|
|$(fg)'$|$f'g + fg'$|
|$\frac{f}{g}$|$\frac{f'g - fg'}{g^2}$|
|$arcsin(x)$|$\frac1{\sqrt{1-x^2}}$|
|$arccos(x)$|$\frac{-1}{\sqrt{1-x^2}}$|
|$arctan(x)$|$\frac1{1-x^2}$|