# SR Latch
## Definition
SR latch is a sequential cirtuit that acts not only on the input but is [[State based circuit]].
SR latch is commonly used to define [[memory blocks]]

REMEMBER: implementation with [[NOR gate]] and [[NAND gate]] have different outputs for the same input! 
## Notation
### Implementation with [[NOR gate]]
![[Pasted image 20221116195210.png|300]]

#### Truth Table
|S|R|Impact|
|:-:|:-:|:-:|
|0|0|No change|
|1|0|Set $Q=1$|
|0|1|Set $\bar{Q}=1$|
|1|1|Not allowed|


### Implementation with [[NAND gate]]
![[Pasted image 20221116204616.png|300]]

#### Truth Table
|S|R|Impact|
|:-:|:-:|:-:|
|0|0|Not allowed|
|1|0|Set $\bar{Q}=1$|
|0|1|Set $Q=1$|
|1|1|No change|


## Intuition
Just remember: it's memory block so if $S=0,R=0$, then it should be obvious that there is no change in the state.
S stands for set so if it's one then just Q is activated
R stands for reset so if it's one Q is zeroed
When both S and R are of state 1 then output is nondeterministic! Q can be either set to 0 or 1 depending on chance (but is influenced but wire length and room noise)

REMEMBER: in nor implementation $R$ is on the same side as $Q$ and $S$ on the same side as $\bar{Q}$! For Nand implementation it's opposite - S is near Q and R near $\bar{Q}$.