# Circular buffer
> [!Definition]
> Method used to reduce memory move operation used for repetitive, cyclic patterns. 

## Code
Simplest C code I can think of on the spot:
```c++
#define PTR_TYPE int*

struct CyclicBuffer {
	PTR_TYPE array;
	int offset;
	int capacity;
}

// rest of the code
```
now I have no time so mark it as #TODO  but basically, when we need 'next' element we:
1. check if offset is equal or grater to capacity
2. if it is, reset to 0, else continue to step 3
3. save data from under `array[offset]` to `result` 
4. increment offset
5. return `result` 

Note, we need a lot more of "utility functions" like the one to allocate space for array or re-allocate if we want to resize it or check if it reached the end.