![[Resistor]]

![[Voltage Source]]

![[Current Source]]

![[Kirchhoff's Current Law (KCL)]]

![[Kirchhoff's Voltage Law (KVL)]]

![[Capacitor]]

![[Inductor]]

[[Device port]]

[[Transformers and DC-DC converters]]

[[DC analysis]]
[[Thevenin's and Norton's equivalents equivalence]]

[[Equivalent devices]]

[[Series connections equivalents]]

[[Parallel connections equivalents]]

# Thevenin's equivalent
![[Pasted image 20221030191445.png]]

# Norton's equivalent
![[Pasted image 20221030191513.png]]

# 3 terminal device transformations
![[Pasted image 20221030191710.png]]
Example:
![[Pasted image 20221030191734.png]]
Becomes:
![[Pasted image 20221030191748.png]]

# Table of linear DC one-port equivalence

![[Pasted image 20221030191929.png]]
![[Pasted image 20221030192044.png]]

# Current divider formula
Note: we only consider parrarel connection because current flowing through series elements is ALLWAYS the same (in ideal case).

## For a pair resistors 
$R_1,R_2$ and currents $I_1,I_2$ flowing though them then 
$I_1 = I_{in} \frac{R_2}{R_1+R_2}$ 
$I_2 = I_{in} \frac{R_1}{R_1+R_2}$ 

### Intution
We take the value from "the other resistor" because when resistance of that resistor is gonna get bigger->current though it is gonna get lower so current though "our" resistor is gonna get proportionally higher.

## For more then two resistors
It's better to use conductance instead of resistance ($G=\frac1R$) and follow the formula:

$I_1 = I_{in} \frac{G_1}{G_1+G_2+G_3}$ 

Note: we HAVE TO change it into conductance, there is no easier/better way to do this!



# Voltage divider formula
Note: we only consider series connection because voltage flowing through a parrarel elements is ALLWAYS the same (in ideal case).

Note: knowing the voltage and total resistance we can deduce the current and then calculate the voltage across the resistors in a two step fasion. Below is given the alternative to this method.

## For a pair resistors 
$R_1,R_2$ and currents $I_1,I_2$ flowing though them then 
$V_1 = V_{in} \frac{R_1}{R_1+R_2}$, $V_2 = V_{in} \frac{R_2}{R_1+R_2}$.

### Intution
We take the value from "the other resistor" because when resistance of that resistor is gonna get bigger->current though it is gonna get lower so current though "our" resistor is gonna get proportionally higher.

## For more then two resistors
It's better to use conductance instead of resistance ($G=\frac1R$) and follow the formula:

$I_1 = I_{in} \frac{G_1}{G_1+G_2+G_3}$ 

Note: we HAVE TO change it into conductance, there is no easier/better way to do this!

# Power
![[Pasted image 20221127220449.png]]

# Energy
![[Pasted image 20221127221325.png]]
![[Pasted image 20221127221305.png]]
![[Pasted image 20221127221925.png]]
![[Pasted image 20221127221840.png]]
![[Pasted image 20221127221910.png]]
![[Pasted image 20221127224133.png]]
