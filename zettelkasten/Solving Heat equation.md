Problem related to [[Examples of PDEs]]
Constrains that $T(x,t)$ need to satisfy:
1. The PDE equation $$\frac{\partial T}{\partial t}(x,t) = \alpha\cdot\frac{\partial^2T}{\partial x^2}(x,t)$$
2. Boundary condition
3. Initial condition

To solve it we use Fourier's work and his observations:
1. Finding solutions for sine waves is nice and rather simple
2. Linearity - if we have solutions for any number of sinewaves then we have solution for their sum
3. ANY function can be represented with sine functions (except some weird exceptions that definitely won't come up 😉)

We start by explaining WHY sine waves create nice solutions. Let's start simple: Let's say that we have a function $T(x,0) = sin(x)$ where $x$ is position of point on the rod.
Right hand side of heat equation asks what is the second derivative of our function. We can see that for $sin(x)$ function it's $-sin(x)$, so each point it is equal but opposite to original function. So for $t=0$ following applies: $$\frac{\partial T}{\partial t}(x,t) = \alpha\cdot\frac{\partial^2T}{\partial x^2}(x,t) = -\alpha\cdot T (x,0)$$
So after some small $\Delta t$ everything scales down a little. and if we ignored boundary condition we could simply scale down the entire function. In general:
$$T(x,n\Delta t) = c^n\cdot sin(x)$$
So in fact it's gonna be some constant times the function itself. That screams, begs to be written in exponential form. Note: rate of function change is proportional to the value of function at that step. We therefore rewrite the function as $T(x,t) = sin(x)\cdot e^{-\alpha t}$. 

HOWEVER: all this is just a fairy-tale land where boundary conditions don't need to make sense!
That is because at he boundary, point would "move" toward it's neighbours and even out the graph!
What we observe then is that those points will be equal to their neighbours immediately after start ($lim_{\Delta t \rightarrow 0^+}$), so at boundaries, derivative of their function must be equal to 0! Note: here we see more generally that in places where $mod(derivative)$ is big heat flow will also be big and where it's close to zero, changes of temperature are also small. 

Now, we just explained what does it mean that function has to satisfy boundary condition. To say it again - it's derivative for points at boundaries has to be zero for all $t>0$. If $L$ is equal to the length of the rod we consider: $$\frac{\partial T}{\partial t}(0,t) = \frac{\partial T}{\partial t}(L,t) = 0$$
What we san do here is we can use a $cos(x)$ function as it "begins" with value 1 and it'll make it's peak flat at $x=0$. this solves it for "left" boundary but not for "right" where $x=L$ we will have to scale is with some constant $\omega$ making it a $cos(\omega\cdot x)$. this will affect it's second derivative. Minimum frequency that satisfies our setup will be at x satisfying $T = cos((\pi/L\cdot x))$ where $\pi/L = \omega$. Then to find all other frequencies you need to multiply the value by some  integers, then you have a whole set of functions that satisfy the conditions we mentioned. Those are :$$cos( N\cdot(\pi/L)\cdot x), N\in{0, 1,2,3,4,...}$$
Then if we include all we learned by now, we get this formula: $$cos(n(\pi/L)x)\cdot e^{-\alpha t(n\pi/L)^2}$$
Note: yes this is difficult but it's a genuinely hard problem so that shouldn't surprise us.