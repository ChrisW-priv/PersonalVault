---
title: Bit Hacks
description: No description provided.
date: 2025-02-14
tags: []
categories:
  - zettelkasten
---

A note of video by Creel ![this](https://www.youtube.com/watch?v=ZRNO-ewsNcQ)

## Setting the bit

having a mask, `or` it with target.

here we want to set 6-th bit (to 1):

`x = x | (1<<6)`

## Clear the bit

having a mask, invert it and `and` it with target.

here we want to clear the 6-th bit (set to 0).

`x = x & ~(1<<6)`

## Toggle the bit

having a mask, `xor` it with target.

here we want to toggle the 6-th bit.

`x = x ^ (1<<6)`

## Convert trailing 0's to 1

example: turn `01101000` into `01101111`.

having a number, subtract one from it and `or` it with target.

here we want to set 6-th bit (to 1):

`x = x | (x-1)`

### Extract the least significant bit

example: turn `01101000` into `00001000`

having a number, `and` it with it's negative value. More generally: and number with it's complement + 1

`x = x & (-x)` or `x = x & ((~x) + 1)`

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

```
for (c=0;x!=0;c++)
	x = x & (x-1)
```

The `c` is the result.

## Count bit islands

count number of ones separated by zeros.

`(x&1) + popcnt((x^(x>>1)))/2`

This may require an explenation:

first we count how many "state changes there are". So we do `x^(x>>1)`. After population count we get 2 the number we need, so divide by 2. Lastly, make sure that first island is counted.

## Bit scan forwards

what is the lowest set bit. ie. return position in decimal.

```c
int BSF(unsigned int x){
	if (x==0) return -1;
	x = x & (-x)
	int c = 0;
	if ((x&0xffff0000) != 0) count += 16;
	if ((x&0xff00ff00) != 0) count += 8;
	if ((x&0xf0f0f0f0) != 0) count += 4;
	if ((x&0xcccccccc) != 0) count += 2;
	if ((x&0xaaaaaaaa) != 0) count += 1;
	return count;
}
```

## Next Lexicographic Permutation

for any number of bits set, generate next integer that has the same number of bits set.

```
t = x | (x-1)
x = (t + 1) | ( ( ~t & -(~t) ) -1 ) >> BSF(x)+1) )
```
