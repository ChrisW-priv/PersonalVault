[[Python]]
[[Parallel computing]]

There are a couple of ways to speed python up. One of them is to use parallel computing. This also splits into multiple branches. Primarily: are you compute or IO bound? If IO bound then `asyncio` or threading might be a solution. However if you are compute bound then use code like below.

```python
from multiprocessing import Pool

def compute_function(arg):
	pass

chunksize = None
with Pool() as pool:
	args = (i for i in range(10))
	results = pool.imap_unordered(compute_function, args, chunksize=chunksize)
```

> [!Remember]
> You can also use optional `chunksize` parameter to allow worked to get more work at a time thus reducing the overhead. This can lead to memory shortage though so just try to optimise it for your specific need.

> [!Remember]
> If you do parallelization of your code you should first do tests for correct results as well as profile your code. Lookup [[Optimization workflow]] for more detail.


> [!Warning]
> As with every [[Parallel]] program you need to make the overhead of creating the instances as well as communication of data small enough such that it's actually worth it. Your program CAN run slower if you just blindly use multiprocessing.


