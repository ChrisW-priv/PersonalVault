---
title: Chain rule
date: 2025-02-14
description: A formula that expresses the derivative of a composite function `h` of two functions `f` and `g` in terms of the derivatives of `f` and `g`
tags:
  - zettlekasten
  - math
  - calculus
categories:
---

## Notation

For a [Composed function](Composed%20function.md) function $h$ defined as $h = f(g(x))$. 

$$h'(x) = f'(g(x)) \cdot g'(x)$$

## Example

### Chain Rule Example in Practice

Let's find the derivative of the function:

$$ h(x) = (3x^2 + 5x)^4 $$

We recognize that this is a composition of functions:

- **Outer function**: $f(u) = u^4$
- **Inner function**: $g(x) = 3x^2 + 5x$

Using the **chain rule**:

$$h'(x) = f'(g(x)) \cdot g'(x)$$

#### Step-by-Step Differentiation:

1. Differentiate the outer function:

$$\frac{d}{du} (u^4) = 4u^3$$

2. Differentiate the inner function:

$$ \frac{d}{dx} (3x^2 + 5x) = 6x + 5 $$

3. Multiply them together:

$$h'(x) = 4(3x^2 + 5x)^3 \cdot (6x + 5)$$

## Intuition

see 3b1b video that explains it well. 
