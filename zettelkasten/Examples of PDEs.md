---
title: "Examples of PDEs"
date: 2025-02-14
description: ""
tags: 
  - "zettlekasten"
categories: []
---

## Examples of PDEs
### Heat equation
$\frac{\partial T}{\partial t} = \alpha \nabla^2T$  
#### Simple 1d example
Let's say you have an object like a piece of metal and you know how the heat is distributed across it at any given moment (how hot each element of the plate is) how will this distribution change over time? 
lte's start simpler - with 2 rods being connected tip to tip. One in hot, maybe $90\degree C$ and the other  cold, maybe $10\degree C$. How does this system change? Let's create a function $T(x)$ where for each point in this 1d example.

In general for 1d example rate of change over time for any point describes following equation: $$\frac{\partial T}{\partial t}(x,t) = \alpha\frac{\partial^2 T}{\partial x^2}(x,t)$$
Where alpha is just some proportionality constant (eg. for metals it would be bigger than for wood).

#### Intuition on how we got this equation
**Step 1: Create even simpler function** - a descrete one (with finate number of points). For this setup we can clearly see that for each point if it's neighbours are hotter on average than that point then point itself will heat-up and vice-versa. To formalise this let's choose three points $x_1. x_2, x_3$ with corresponding temperatures $T_1, T_2, T_3$. what we want to compare is avg(T_1, T_3) with T_2. Then we note that $\frac{dT_2}{dt}=\alpha(\frac{T_1 + T_3}{2} - T_2)$ we can then rewrite this as $\frac{dT_2}{dt}=\frac{\alpha}{2}((T_3-T_2)-(T_2-T_1))$. Then we note that this is really $\Delta T_{32} - \Delta T_{21}$ so a difference of neighbouring temperatures. Then to be super compact with notation we can write it as $\Delta\Delta T$ or so called "second difference". Then when we move from finate case of $$\frac{\partial T}{\partial t}(x,t) = \frac{\alpha}{2}\Delta\Delta T$$
to continous function we move from second difference to second derivative. We then get  $$\frac{\partial T}{\partial t}(x,t) = \alpha\frac{\partial^2 T}{\partial x^2}(x,t)$$

#### What about higher dimensions?
For higher dimensions we simply extend it for other dimensions as well
$$\frac{\partial T}{\partial t}(x,y,z,t) = \alpha\left(
\frac{\partial^2 T}{\partial x^2}(x,y,z,t) + \frac{\partial^2 T}{\partial y^2}(x,y,z,t) + \frac{\partial^2 T}{\partial z^2}(xy,z,t)\right)$$

It's common enough to have it's name "Laplacian derivative" which is in fact multivariable derivative. we denote such equation as $$\frac{\partial T}{\partial t}(x,y,z,t) = \alpha\nabla^2T(x,y,z,t)$$
## Recommended lecture
Infinite Powers: How Calculus Reveals the Secrets of the Universe by Steven Strogatz