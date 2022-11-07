# Resistor
![[Pasted image 20221026205640.png]]
Arrow phrases matter! The usual $u = Ri$ is meaningless because when one of the arrows has the opposite direction, the formula is $u = -Ri$.

# Voltage Source
![[Pasted image 20221026205842.png]]
And here $u=e$
Here $e[V]$ is called electromotive force.

# Current Source
![[Pasted image 20221026210231.png]]
And here $i=j$.
Here $j[A]$ is the generated current

# Kirchhoff's Current Law (KCL)
Given node like this:
![[Pasted image 20221026210358.png]]
We have to note that: $i_1, i_2, i_3,...,i_n=0$.

# Kirchhoff's Voltage Law (KVL)

Electric potentials (with respect to any point) of the circuit's nodes are well defined.
The node with respect to which we measure electric potentials is called ground or earth.
![[Pasted image 20221026210728.png]]

![[Pasted image 20221027203930.png]]
![[Pasted image 20221027204009.png]]

# Capacitor
![[Pasted image 20221027204225.png]]

# Inductor
![[Pasted image 20221027204249.png]]

# Device port 
A port of a device is a pair of device terminals such that any current flowing in through one terminal of a port must flow out through the oter terminal of the port.

Every 2-terimnal device is automatically a one-port!

# Transformers and DC-DC converters
![[Pasted image 20221028102222.png]]

# DC analysis
A DC solution to a circuit is a solution consisting entirely of constant signals (all voltages and currents)

For DC all complicated ODEs normally ruling the circuits reduce to algebraic equations.

![[Pasted image 20221028102718.png]]

At our desposal we allways have Kirchhoff's laws (KCL, KVL) and device equations!

## Nodal method
1. Label all the nodes with variables $e_1,e_2,...,e_n$ denoting electric potentials
![[Pasted image 20221028103037.png]]
2. Labels all the currents $i_1,i_2,...,i_n$ flowing into all the elements. For each n-terminal element we introduce $n-1$ new variables in tis way.
The current flowing out of the last terminal of an n-terminal element equals the sum of the currents flowing into all the other terminals.
![[Pasted image 20221028103400.png]]
3. Write down the KVL equations (for each node)
![[Pasted image 20221028103621.png]]

4. Write down element equations expressed in terms of the electric potentials $e_1,e_2,...,e_n$ and currents $i_1,i_2,...,i_n$.
![[Pasted image 20221028103829.png]]

5. Solve the equations
![[Pasted image 20221028104024.png]]
![[Pasted image 20221028103950.png]]

## Superposition rule
A solution to linear circuit with N independent sources is a sum of solutions to N circuits that result from the original circuit by reduction to zero all but one independent source (each time we let just a single independent source to act alone).

In this way one may find only the whole solutions but also the individual voltages and currents.

1. Reduction to zero
![[Pasted image 20221028104554.png]]

![[Pasted image 20221028104649.png]]

## Current Divider Formula (CDF)
![[Pasted image 20221028104844.png]]

![[Pasted image 20221028104925.png]]

## Voltage Divider Formula
![[Pasted image 20221028105009.png]]

# Equivalent devices
In some cases devices can act like other devices, therefor we can simplify the schematic to what we need. Ussually we will reduce elements to either a wire or open circuit (cuz they are the easiest).

In DC case:
![[Pasted image 20221028105652.png]]

# Series of connections

![[Pasted image 20221028105911.png]]
![[Pasted image 20221028105922.png]]
![[Pasted image 20221028105936.png]]
![[Pasted image 20221028105955.png]]
![[Pasted image 20221028110020.png]]

# Parallel connections of one-ports
![[Pasted image 20221028110121.png]]
![[Pasted image 20221028110135.png]]
![[Pasted image 20221028110150.png]]
![[Pasted image 20221028110203.png]]
![[Pasted image 20221028110220.png]]
![[Pasted image 20221028110236.png]]

# Thevenin's equivalent
![[Pasted image 20221030191445.png]]

# Norton's equivalent
![[Pasted image 20221030191513.png]]

# Thevenin's and Norton's equivalents equivalence
![[Pasted image 20221030191615.png]]
![[Pasted image 20221030192107.png]]
![[Pasted image 20221030192126.png]]
![[Pasted image 20221030192150.png]]
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

