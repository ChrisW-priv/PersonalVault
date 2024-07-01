# Derivative
## Definition
Derivative if a [Function in Mathematics](Function%20in%20Mathematics.md). It creates a new function that checks how big of a change small "nudges" to the input change the output of original function.

## Notation
For single input function $f$ 
$$\frac{df}{dx}(x) = \lim_{dx \rightarrow 0}  \frac{f(x+dx) - f(x)}{dx}$$

## Intuition

## Table of derivatives
| Function | Derivative | Why? |
| :-: | :-: | :- |
| scalars | 0 | Scalars can be seen as a flat line on the number line, and so there is no rate of change |
| $x^n,\ n\in \mathbb{N}-\set{0}$ | $n\cdot x^{n-1}$ | This is the result of calculating the derivative directly (substitute $\rightarrow$ expand $\rightarrow$ shorten the result) |
| $ln(x)$ | $\frac{1}{x}$ | [Why derivative of ln(x) equals 1 over x](Why%20derivative%20of%20ln(x)%20equals%201%20over%20x.md) |
| $e^x$ | $e^x$ | It really is a special property it uses the fact that $\lim_{x \rightarrow 0}\frac{e^{x}-1}{x} = 1$|
| $e^{c\cdot x}$ | $c\cdot e^{cx}$ | Chain rule and previous derivative |
| $\mathbb{c}^{x}$ |$\mathbb{c}^{x} = ln(\mathbb{c})\cdot \mathbb{c}^{x}$ | [Derivative of exponential functions](Derivative%20of%20exponential%20functions.md)|
| sin(x) | cos(x) | #TODO |
| cos(x) | -sin(x) | #TODO |
| tan(x) |$\frac1{cos^2(x)}$|#TODO|
|$(fg)'$|$f'g + fg'$|Imagine a rectangle. nudges to it's side are most visible as 2 lines of specific length|
|$\frac{f}{g}$|$\frac{f'g - fg'}{g^2}$|Just ntational shorthand for a $(f\cdot \frac1g)$|
|$arcsin(x)$|$\frac1{\sqrt{1-x^2}}$| #TODO |
|$arccos(x)$|$\frac{-1}{\sqrt{1-x^2}}$| #TODO |
|$arctan(x)$|$\frac1{1-x^2}$| #TODO |


## Additional materials
[Higher order derivatives](Higher%20order%20derivatives.md) 
[Implicit differentiation](Implicit%20differentiation.md)
[Chain rule](Chain%20rule.md)
