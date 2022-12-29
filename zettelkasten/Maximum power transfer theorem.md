Instantaneous power delivered to a one-port:
$$p(t) = i(t)u(t)$$
If this one-port is an element of [[Alternating current (AC)]] circuit then.
$$i(t) = I_mcos(\omega t+\phi_i)$$
$$u(t) = U_mcos(\omega t+\phi_u)$$

$$p(t) = I_mU_m cos(ωt+φi) cos(ωt+φu) = \frac12 I_mU_m cos(φi − φu) + \frac12 I_mU_m cos(2ωt + φi + φu) $$
> [!Notice]
> Pulsation of the alternating term is twice as big as the pulsation of signals i and u.

Mean power, which, in the context of AC circuits, is also called active power, is the mean value P of the instantaneous power.
$$P=\frac{1}{T} \int _{t=t_{0}}^{t_{o}+T} p(t) \, dt, T=\frac{2\pi}{\omega}$$
Hence then active power supplied to a one-port equals
$$P=\frac{1}{2}I_{m}u_{m}\cos(\phi_{i} - \phi_{u})$$
the mean value of the alternating component is zero. Mean power can ba expressed in terms of phasors $U$ and $I$ as $$P=\frac{1}{2} Re(U, \bar{I})$$
Maximum Power Transfer theorem. In the alternating current circuit the mean power transferred to the load does not exceed the available power $P_{avail}$ of the generator
$$P_{avail} = \frac{|E_{T}|^2 }{8 Re(Z_{T})}$$
More precisely, for the theorem to hold, we need to assume Re(ZT ) > 0, which in real circuits is always true. 
The mean power transferred to the load can not exceed $P_{avail}$ given by the formula even if we allow the load to be constructed with arbitrary devices (e.g. sources).

Moreover, the power transferred to the load equals $P_{avail}$ if and only if the impedance $Z_0$ of the load is conjugated to the internal impedance $Z_T$ of the generator, i.e.
$$Z_{0} = \bar{Z_{T}}$$
