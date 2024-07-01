# Map Pattern
> [!Definition]
> Also known as projection. Pattern of computation that applies a function to every element of given [Array](Array) to create new array. Often implemented to execute functions in [Parallel](Parallel) to make computation faster. Commonly used with other [Function programming](Function%20programming) patterns

Standard signature for map definition is `map(fn, arr)`.

## Example in python:
```python
arr = list(range(10))
def double(x): return x*2
doubled = map(double, arr)
print(list(doubled)) # [0,2,4,...,18]
```
Notice that in python we need to convert it to list as by default `map` returns iterator.
