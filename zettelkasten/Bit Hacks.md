A note of video by Creel ![this](https://www.youtube.com/watch?v=ZRNO-ewsNcQ)

## Setting the bit
having a mask, `or` it with target.
here we want to set 6-th bit (to 1):
`x = (1<<6) | x`
## Clear the bit
having a mask, invert it and `and` it with target.
here we want to clear the 6-th bit (set to 0).
`x = ~(1<<6) & x`
## Toggle the bit
having a mask, `xor` it with target.
here we want to toggle the 6-th bit.
`x = (1<<6) ^ x`
## Convert trailing 0's to 1
example: turn `01101000` into `01101111`.
having a number, subtract one from it and `or` it with target.
here we want to set 6-th bit (to 1):
`x = (x-1) | x`
### Extract the least significant bit
example: turn `01101000` into `00001000`
having a number, `and` it with it's negative value. More generally: and number with it's complement + 1
`x = x & ((~x) + 1)`
## Masked copy
Copy `B` into `A` where `M = 1`. where `M = 0` keep `A` as is.
`A = (B & M) | (A & ~M)`
## Swapping bits
having a variable `x` and two indexes: `A` and `B`.
to swap state of both indexes:
```
P = (x>>A) ^ (x>>B) & 1
x ^= (P<<A)
x ^= (P<<B)
```
## Population Count
count how many bits are set to 1.