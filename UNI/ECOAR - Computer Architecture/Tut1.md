Different kinds of encoding were introduced. Also why standards were used.

"If u need to lookup ascii code table then something is wrong. If you are good with what you are doing then you don't need that table" 

# Control codes

first 32 codes 0-31
- CR: carriege return - 13
- LF - line feed - 10
- Also: HT, FF, BSP, BEL

Space - 32 
digits: codes 48-57 (0x30-0x39)
Letters in alphabetic order
- upper case 65..90 (0x41..0x5a)
- lower case 97..122 (0x61..0x7a)
- Distance over lower and upper case of a letter is 32 (0x20)

# UTF-8 
utf-8 representation is self-syncronysing. Looking at each octet send you can determine if it is a middle of the code or if it is a start of one.

# Text strings
- either a table of text then at the end a special character is put (NUL)
- or a binary number of string length and then some text

# Other data representations
## Sound 
- Voltage analog of acoustic pressure sampled with some frequency depending on quality we want
- Sample values stored as integer numbers

## Raster Image:
- Representated as rectangular arrays of square picture elements (pixels)
- single color is assigned to every pixel 
- Color is represented using three primaries - values of basic lights (RGB)
- Values of primaries stored as uint numbers
- can only represent like 80% of colors, we can't represent violet. Instead we print purple.
- 8 bit representation is not enough, today we commonly use 10bit values


# Word in CS
Word - a unit of data we can operate on
Processor word is commonly smaller than memory word.

# Integers
## Important features for the representation
Arithmetic operations:
- need to be as fast as possible. 
- with U2 we can use normal hardware. only overflow detection is different.

Representation of zero. 
- We commonly need to check if value is 0. If there is more than one than we have to do more work.

Symmetry of range

Representation of sign
- how easy it is to check if number is positive or not

Change of sign
- in U2 bit negation and increacement by one

## Natural binary code
$$v_n = \sum_{i=0}^{n-1} b_i\cdot2^i$$

## BCD (binary coded decimal)
removes decimal->binary translation overhead

## Two's complement (U2)
$$v_{2c} = -b_{n-1}\cdot2^{n-1} \cdot\sum_{i=0}^{n-2} b_i\cdot2^i$$

## Sign magnitude
$$v_{S-M}=-1^{b_{n-1}}\cdot\sum_{i=0}^{n-2} b_i\cdot2^i$$

## Biased
$$v_B=-BIAS\cdot\sum_{i=0}^{n-1} b_i\cdot2^i$$


# Fractions
## Fixed point notation
Obtained by shifting bit weights in integer notation.
Equivalent to multiplication of integer value by $2^{-f}$ where $f$ is no. bits in fractional part
Used for U2 and unsingned numbers


# big and little endian
Assume word: "ABCD"
## Little Endian
least significant byte at the lowest address more significant bytes follow

|Adr|byte|
|-|-|
|0|D|
|1|C|
|2|B|
|3|A|


## Big Endian 
most significant byte at the lowest address
|Adr|byte|
|-|-|
|0|A|
|1|B|
|2|C|
|3|D|

## Features:
Big Endian is human-like, little Endian is more useful to computer.

### Little endian features:
- Byte numbering corresponds to bit weights
- Type casting preserves the pointer

### Big endian
- good for big data cuz we need to be able to compare strings (!)
- when type casting we have to adjust the pointer

