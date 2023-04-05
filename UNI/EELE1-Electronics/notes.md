# Constants
Planck’s constant, $h = 6.626 x 10^{-34} [Js]$
$$\tilde{h} = \frac{h}{2\pi} = 1.055 x 10^{-34} [Js]$$

Free electron mass, $m_0 = 9.11 x 10^{-31} [kg]$

Elementary charge, $q = 1.602 x 10^{-19} [C]$

Boltzmann constant, $k_b = 1.381 x 10^{-23} [J/K]$

Vacuum permittivity, $\epsilon_0 = 8.854 x 10^{-12} [F/m]$

Speed of light, $c = 3 x 10^{8} [m/s]$

1st Orbital radii of Hydrogen atom, $a_0 = 5.3 x 10^{-9} [m]$ 

Energy unit conversion, $E[eV] = \frac{E[J]}{q}$

# Pendulum
$$\Delta E = h\nu = \tilde{h}\sqrt{\frac{k}{m}}$$
$$E = \frac12 k \Delta x$$
Whare $k$ is the force applied to the system, equal to g if it's pendulum and
$\Delta x$ is the max deflection that spring can take, in pendulum, equal to elevation

# Hydrogen atom - Bohr's model
$$\frac{Zq^2}{4\pi\epsilon_0 r^2} = \frac{m_0 v^2}{r}$$
Z is a Culomb forceand centriperal force (for us allways = 1)
$$L = m v r = n\tilde{h}$$
System frequency: $\nu = \frac{E_i-E_j}{h}$
Using properties that we just learned orbital velocity:
$$v_n = \frac{q^2}{4\pi\epsilon_0\tilde{h}}\cdot\frac1n$$
After calculating the $v_1$, just use: $v_n = \frac{v_1}{n}$
We can also derive:
$$r_n = \frac{4\pi\epsilon_0\tilde{h}^2}{m_0q^2}\cdot n^2=a_0 n^2$$
Useful for H atom: $E_1 = -2.18 x 10^{-18}[J] = -13.9[eV]$

# Orbital Energies
\begin{align*}
E_{kin} &= \frac{m_0 v^2}{2} =
\frac{m_0q^4}{2(4\pi\epsilon_0)^2\tilde{h}^2}\cdot\frac{1}{n^2}\\
E_{pot} &= \int_r^\infty F(r)dr = -\frac{q^2}{4\pi\epsilon_0 r_n} =
-\frac{m_0 q^4}{(4\pi\epsilon_0)^2\tilde{h}^2}\cdot\frac{1}{n^2}\\
E_n &= E_{kin} + E_{pot} =
-\frac{m_0q^4}{2(4\pi\epsilon_0)^2\tilde{h}^2}\cdot\frac{1}{n^2} = 
-E_1\cdot\frac{1}{n^2}
\end{align*}

# Orbital Transitions
\begin{align*}
\lambda_{n\to m} &= \frac{hc}{\Delta E_{n\to m}}\\
\Delta E_{n\to m} &= E_m-E_n = E_1(\frac{1}{m^2} - \frac{1}{m^2})
\end{align*}

# de Broglie wavelength
\begin{align*}
mv_nr_n &= n\frac{h}{2\pi} \\ 
pr_n &= n\frac{h}{2\pi} \\
2\pi r_n &= n\lambda_{dB}
\end{align*}
To calculate $\lambda_{dB}$
\begin{align*}
\lambda_{dB} &= \frac{h}{p} = \frac{h}{m_0 v} = \frac{h}{\sqrt{2m_e E}}\\ 
\lambda_{dB} &= \frac{2\pi r_n}{n} = 2\pi a_0 n\\ 
\end{align*}
Remember, if $\lambda_{dB} << L$ then system can be treated as **classical**
Termal: $E_{kin} = \frac32 k_b T$
Electical:
\begin{align*}
I &= q \rho A v\\
v &= \frac{I}{q\rho A} \\
\end{align*}
Where $q$ is a constant, $\rho$ is given in the task, and $A$ is area
(crossection) so $\pi r^2$

# Reflection despite higher Energy
\begin{align*}
k &= \frac{\sqrt{2m^*(E - V)}}{\tilde{h}} \\
P &= \frac{4k_1k_3}{(k_1+k_3)^2 cos^2(k_b b) + \left(\frac{k_1k_3}{k_b} + k_b\right) sin^2(k_bb)}
\end{align*}
Getting $P_max$:
\begin{align*}
2k_bb &= n2\pi \\
P_max &= \frac{4k_1k_3}{(k_1+k_3)^2}
\end{align*}
Energy for which the tranition P is max?
$$E_n = V_b + \frac{\tilde{h}^2\pi^2 n^2}{2m^*b^2}$$

# Tunneling
\begin{align*}
k &= \frac{\sqrt{2m^*(E - V_0)}}{\tilde{h}} \\
\kappa_b &= \frac{\sqrt{2m^*(V_b - E)}}{\tilde{h}} \\
P_0 &= 16 \frac{(k\kappa_b)^2}{(k^2 + \kappa_b^2)^2} \\
P &= P_0 exp(-2\kappa_b b)
\end{align*}

# Rectangular quantum well
$$E_n = \frac{\tilde{h}^2\pi^2 n^2}{2m_eL^2}$$
to find a well length such that $N$ number of energy levels are located below $E$ 
we can use the following:
$$L> \frac{\tilde{h}\pi N}{\sqrt{2m_e E}}$$

# Heisenberg's uncertainty principle
\begin{align*}
\Delta p &= m \Delta v \\
\Delta x \cdot \Delta p & \geq h
\end{align*}

To get the required time to know the velocity of the pariclesup to some precision:
$$\Delta t \geq \frac{h}{prec\cdot m\ cdot v^2}$$

# Photoelectric effect
Stopping freq, $V_0 = \frac{hv}{e}-\frac{W_0}{e}$
