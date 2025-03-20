---
categories: []
date: 2025-02-14
description: No description provided.
tags:
- zettlekasten
title: Examples of ODEs
---

## Examples of ODEs

### Example1 - freefalling body

Gravitational acceleration near surface of air: $\frac{-9.8 \ m/s}{s}$.

This mean that if you have a body in freefall through space it will accrue (accumulate in regular ammounts of time) an additional downward component of 9.8$\frac{m}{s}$ every second. we call this constant g. This sistem is enough to creaete a simple differential equation albeit a relatively simple one.

Think of the position of the body as a function of time. It's derivative gives the vertical component of velocity, whose derivative in turn gives the vertical component of acceleration.

For compactness let's describe this function $y(t)$, it's derivative $\dot{y}(t)$, and second derivative a $\ddot{y}(t)$.

We know that $\ddot{y}(t)$ = -g. then to get the velocity we can integrate and get $\dot{y}(t)$ = -gt + $v_0$ where $v_0$ is initial velocity. To get the position of the body we integrate again and get $y(t) = -\frac{1}{2} gt^2 + v_0t + y_0$. $y_0$ is initial position of the body.

Note: we couldn't do this if the acceleration of the body was dependent on other body whose acceleration was determined by the posion of the first (Solar system simulation for example). 

### Example2 - pendulum

An image visualising forces acting on a body in a pendulum system (screenshot of the animation by 3blue1brown video on the topic)

![300x300](attachments/pendulum%20forces%20visualised.png) 

We will measure the distance from the center as $x=L \theta$ ($\theta$ in radians) 

Then acceleration acting on a on the body is the gravity, so the force perpendicular to the origin is equal to $-g \ sin(\theta)$ 

$a = \ddot{x} = -g \ sin(\theta)$, therefore $L \ddot{\theta} = -g \ sin(\theta) \rightarrow \ddot{\theta} = -\frac{g}{L} \ sin(\theta)$ or if we want to add air velocity for realism with some air resistance factor $\mu$ then $\ddot{\theta} = -\mu\dot{\theta} -\frac{g}{L} \ sin(\theta)$ as air resistance is proportional to the speed of pendulum so first derivative of time $\dot{\theta}$.

Because calculating the solution is hard we often skip solving it and just compute the results and derive understanding from that. 

For a pendulum example we can create a 2d plane where x axis is $\theta$ and y axis in $\dot{\theta}$. In other words x axis is how big displacement is and y axis describes the speed of the pendulum at that point. Note: this fully describes any pendulum at any given moment. If you know the initial values of $\theta$ and velocity then you will know how it will change in time. That is because each point in this plane can be represented as vector where both components are functions of time $\frac{d}{dt} \begin{bmatrix} \theta(t) \\ \dot{\theta}(t) \end{bmatrix} = \begin{bmatrix} \dot{\theta}(t) \\ \ddot{\theta}(t) \end{bmatrix}$. This new vector gives you information where the next state is going to be.

We can expand this last part into $\begin{bmatrix} \dot{\theta}(t) \\ \ddot{\theta}(t) \end{bmatrix} = \begin{bmatrix} \dot{\theta}(t) \\ -\mu\dot{\theta}(t) -\frac{g}{L} \ sin(\theta(t)) \end{bmatrix}$.

Note: what we did is we reduced a second order ODE into a system of two first order ODEs. Supposedly it's a common trick.