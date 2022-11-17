# JK FlipFlop
## Definition
A [[State based circuit]] build from [[SR FlipFlop]] and [[AND gate]] with 3 inputs.
## Notation
### Implementation with [[NAND gate]]
![[Pasted image 20221116205154.png|300]]

#### Truth Table
For clk = 1:
|$J K$|$S R$|$Q \bar{Q}$|result|
|:-:|:-:|:-:|:-:|
|00|11|01|No change|
|10|01|10|Set $Q=1$|
|01|10|01|Set $\bar{Q}=1$|
|11|00|Not-defined|Not allowed!|

For clk = 0: same as for clk=1, $JK$ = $00$

## Intuition
