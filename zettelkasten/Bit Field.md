# Bit Field
## Definition
A bit field is a data structure that consists of one or more adjacent bits which have been allocated for specific purposes, so that any single bit or group of bits within the structure can be set or inspected.

Commonly used to represent [[boolean]]. Very efficient for flags that define behaviour.

## Code
#TODO 
```C++
template<size_t N, size_t information_size>
class bitfield{
	size_t array_size = N*information_size/8;
	uint8_t array[array_size]{};
}
```

```
To extract data from bit field:
```pseudo

```

## Intuition
