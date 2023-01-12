## Definition
For a function in a form
$$y + P(x)y' = Q(x)\cdot y^n$$

Step 1: Find an integrating factor following this formula
$$I(x) = e^{\int (1-n)P(x)dx}$$
Step 2: Solve equation
$$y^{1-n} = \frac1{I(x)}\left[\int (1-n)Q(x)I(x) dx \right]$$

## Changing any function into standard form
For any function 
$$F\cdot dx + G\cdot dy = 0$$
First divide everything by $dx$ to get 
$$F + Gy' = 0$$
Then divide everything by $G$
$$y' + \frac{F}{G} = 0$$
And split $\frac{F}{G}$ to get
$$y + P(x)y' = Q(x)\cdot y^n$$
