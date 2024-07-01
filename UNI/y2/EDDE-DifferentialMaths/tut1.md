[edde01](Lectures/edde01.pdf)
Miałem problem z pytaniem w zadaniu:
"Find ODE satisfied by any function of the form: *some form of function*"

Co to onacza to tyle:
"jak masz funkcję podaną to jaka funkcja opisuje zmiany w tej funkcji"

Zawsze szukamy przede wszystkim jakiego poziomu jest to czego szukamy. w praktyce: szukamy ile mamy zmiennych i tego poziomu musimy mieć pochodną 

Przykład1: 
Find an ordinary differential equation satisfied by any function of the form $y(x) = (x + C)^2 \text{, where C}\in \text{R}$.

Rozwiązanie1:
$y(x) = (x+C)^2$
$y'(x) = 2(x+C)$
$C = \frac{y'(x)-2x}{2}$
$y(x) = (x + \frac{y'(x)-2x}{2})^2$


Zadanie 2:
Find an ordinary differential equation satisfied by any function of the form X. Write solution in Y

|X|Y|Order|
|:-:|:-:|-|
|$x^2+C$|$2x$|1|
|$x^2+Cx+D$|$2$|2|
|$Cx^2$|$2Cx$|1|
|$x^2+Cx$|$2x+C$|1|

Zadanie 4
Assuming that $x^2\cdot y''(x)-2x \cdot y(x) + 2y(x) = 0$, write the differential equation satisfied by z(x) = y(x)/x. Solve that equation for z(x), and deduce what is y(x).

Rozwiązanie:
Note that ths is a second order derivative!
$x^2\cdot y''(x)-2x \cdot y(x) + 2y(x) = 0$
$z(x) = \frac{y(x)}{x}$
Using property $(fg)' = f'g + fg'$ 
$z' = \frac{y(x)'\cdot x - y(x)}{x^2}$
$z'' = \frac{(y''\cdot x + y'-y')\cdot x^2 - (y'\cdot x - y(x))x}{x^4}$
After we expand numitator we see that it is really original function that is equal to 0 by definition of exercise multiplied by x. So $0\cdot x=0$. $z''=0, z'=C, z=Cx+D$
$z=\frac{y}{x} \rightarrow y=Cx^2+Dx$
