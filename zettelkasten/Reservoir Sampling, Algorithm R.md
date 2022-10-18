### Problem
Given a steam of size $N$ which is too large to fit into memory, randomly select $K$ elements such that each element has an equal probability of being chosen.

### Code
```pseudo code
ReservoirSample(stream, k)
	R = stream[1...k]
	
	for i = k+1, k+2, ..., n:
		# randomInitiger creates uniform output from inclusive range <min, max>
		j = randomInitiger(1,i)
		if j <= k: 
			R[j] = S[j]
```

```python
def reservoir_sampling(stream, k):
	result = stream[:k] # first k elements
	for i, v in enumerate(stream):
		rand_index = randint(0,i)

		if random_index < k:
			result[random_index] = value
	return result
```

```c
int random_bounded(int max); // returns random int from range <0, max) with equal distribution

// function uses cutoff as in original question stream can be endless, however our while loop needs the end parameter
int* reservoir_sampling(int* stream, int k, int cut_off)
{
	int* result = (int*) malloc(k*sizeof(int));
	int i=0, rand_index;
	while (i<k) result[i] = stream[i++];

	while (i < cut_off) {
		rand_index = random_bounded(i);
		if (rand_index < k) 
			result[rand_index] = stream[i++];
	}
	return result;
}
```

### Mathematical Proof
We want to proof that $\forall i,j \in {1,2,3,...,N}$ probability of selecting both is equal. In math language: 
 $\forall i,j \in {1,2,3,...,N}$ 
 $P(element _i) = P(element _j)$ 
Where $P(element _i)$means element with index i is in the solution.

In other words: proove that if you stop algorith in any moment probability of element being in the result is equal 

We will proove this by induction.
$$ P(element _i) = P(element _i) * P(\neg replaced)$$
$$ P(element _i) =  \frac{k}{i} * (1 - \frac{k}{i+i} * \frac{i}{k}) = \frac{k}{i} * \frac{i}{i+1} = \frac {k}{i+1} $$
$$ P(element _{i+1} ) = \frac{k}{i+1}$$

As $i$ gets bigger chance of being chosen goes down as well as risk of being replaced out from the list. 
