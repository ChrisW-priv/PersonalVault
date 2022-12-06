# Binary Search
## Definition
Search done on a [[Sorted Array]]. It searches for the element in $O(log(n))$ complexity. Very efficient because each comparison cuts down half of the options that we would normally need to compare with.

> [!Note] 
> What we need is an index of an element in range or boolean info if element is in the range we look for. 

## Code

### C++ 
In c++ we have a `std::binary_search` but it returns only boolean if it was found or not. That can sometimes be useful but if we need an index of the value then we need to use [std::lower_bound](https://en.cppreference.com/w/cpp/algorithm/lower_bound) which returns iterator to first element that does not satisfy `element < value` (so equal or greater).

To get element one bigger that the element we look for we should use [std::upper_bound](https://en.cppreference.com/w/cpp/algorithm/upper_bound).

### Python
To do binary search in python we can use `bisect` module:

```Python
from bisect import bisect_left, bisect_right

l = [1,2,3,4,4,4,4,5,6,7,8]
first_four = bisect_left(l,4)
last_four = bisect_four(l,4)
```

