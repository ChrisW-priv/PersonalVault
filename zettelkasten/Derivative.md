# Derivative
## Definition
Derivative if a [[Function in Mathematics]]. It creates a new function that checks how big of a change small "nudges" to the input change the output of original function.

## Notation
For single input function $f$ 
$$\frac{df}{dx}(x) = \lim_{dx \rightarrow 0}  \frac{f(x+dx) - f(x)}{dx}$$

## Intuition

## Table of derivatives
| Function | Derivative | Why? |
| :-: | :-: | :- |
| scalars | 0 | Scalars can be seen as a flat line on the number line, and so there is no rate of change |
| $x^n,\ n\in \mathbb{N}-\set{0}$ | $n\cdot x^{n-1}$ | This is the result of calculating the derivative directly (substitute $\rightarrow$ expand $\rightarrow$ shorten the result) |
| $ln(x)$ | $\frac{1}{x}$ | [[Why derivative of ln(x) equals 1 over x]] |
| $e^x$ | $e^x$ | It really is a special property it uses the fact that $\lim_{x \rightarrow 0}\frac{e^{x}-1}{x} = 1$|
| $e^{c\cdot x}$ | $c\cdot e^{cx}$ | Chain rule and previous derivative |
| $\mathbb{c}^{x}$ |$\mathbb{c}^{x} = ln(\mathbb{c})\cdot \mathbb{c}^{x}$ | [[Derivative of exponential functions]]|
| sin(x) | cos(x) | #TODO |
| cos(x) | -sin(x) | #TODO |
|$(fg)'$|$f'g + fg'$|Imagine a rectangle. nudges to it's side are most visible as 2 lines of specific length|
|$\frac{f}{g}$|$\frac{f'g - fg'}{g^2}$|Just ntational shorthand for a $(f\cdot \frac1g)$|

## Additional materials
[[Higher order derivatives]] 
[[Implicit differentiation]]
[[Chain rule]]
