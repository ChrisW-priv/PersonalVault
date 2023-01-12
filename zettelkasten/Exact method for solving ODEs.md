# Solving ODE
**Step 1:** Turn equation into a form: $f(x,y) := P(x,y) dx + Q(x,y) dy = 0$

**Step 2:** Calculate $P_y, Q_x$
**Step 3:** calculate $Q_x-P_y$.
if equal to 0: follow to step 4, else follow the [[Integrating factor for exact method]]

Remember: $f_x = P, f_y = Q$, so to get a function $f$ we need to
**Step 4:**  integrate $P$ over $x$ or $Q$ over $y$. 
$$f(x,y) = \int{P dx} = \int{Q dy}$$

**Step 5:** Use one of $f_x = P, f_y = Q$ properies.
Just differentiate the $f$ over $dy$ (or $dx$ if we integrated $Q$)
Result of that is the result for entire function

# Examples
Examples are provided in [[edde04.pdf]]