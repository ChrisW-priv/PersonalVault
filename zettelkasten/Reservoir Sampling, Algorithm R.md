# Problem
Given a steam of size $N$ which is too large to fit into memory, randomly select $K$ elements such that each element has an equal probability of being chosen. Assume access to [Pseudo-random number generator (PRNG)](Pseudo-random%20number%20generator%20(PRNG))

# Code
```pseudo code
ReservoirSample(stream, k)
	R = stream[1...k]
	
	for i = k+1, k+2, ..., n:
		# randomInitiger creates uniform output from inclusive range <min, max>
		j = randomInitiger(1,i)
		if j <= k: 
			R[j] = S[j]
```

## Python
```python
def reservoir_sampling(stream, k):
	result = stream[:k] # first k elements
	for i, v in enumerate(stream):
		rand_index = randint(0,i)

		if random_index < k:
			result[random_index] = value
	return result
```

## C
Assume function:
```c
int random_bounded(int max); // returns random int from range <0, max) with equal distribution
```
We create function:
```c
// function uses cutoff as in original question stream can be endless, however our while loop needs the end parameter
int* reservoir_sampling(int* stream, int k, int cut_off)
{
	int* result = (int*) malloc(k*sizeof(int));
	int i=0, rand_index;
	while (i<k){
		result[i] = stream[i];
		++i;
	} 

	while (i < cut_off) {
		rand_index = random_bounded(i);
		if (rand_index < k) 
			result[rand_index] = stream[i++];
	}
	return result;
}
```

## C++
In C++ w can easily generalise this function to any type
```c++
/// uses R algorithm for reservoir sampling given a pointer to stream of data  
/// \param begin Iterator of container  
/// \param end Iterator of container  
/// \param k number of elements chosen  
/// \return pointer to first element chosen  
template<typename T, typename Iter>  
std::unique_ptr<T[]> reservoir_sampling(T* stream, size_t cutoff, size_t k, std::mt19937 generator)  
{  
    std::unique_ptr<T[]> result{ new T[k] };  
  
    size_t i=0, rand_index;  
    while (i<k){
		result[i] = stream[i];
		++i;
	} 
	while (i < cut_off) {
        rand_index = std::uniform_int_distribution<uint32_t>{1,static_cast<uint32_t>(i)}(generator) - 1; // We want it <0-i) not <1,i>
		if (rand_index < k) 
			result[rand_index] = stream[i++];
	}  
    return result;  
}
```
Or if we support the containers:
```c++
/// uses R algorithm for reservoir sampling given a pointer to stream of data  
/// \param begin Iterator of container  
/// \param end Iterator of container  
/// \param k number of elements chosen  
/// \return pointer to first element chosen  
template<typename T, typename Iter>  
std::unique_ptr<T[]> reservoir_sampling(Iter begin, Iter end, size_t k, std::mt19937 generator)  
{  
    std::unique_ptr<T[]> result{ new T[k] };  
  
    size_t i=0, rand_index;  
    Iter curr = begin;  
    while (i<k) {  
        result[i] = *curr;  
        ++i; ++curr;  
    }  
    while (curr!=end){  
        rand_index = std::uniform_int_distribution<uint32_t>{1,static_cast<uint32_t>(i)}(generator) - 1; // We want it <0-i) not <1,i>  
        if (rand_index < k) result[rand_index] = *curr;  
        ++i; ++curr;  
    }  
  
    return result;  
}
```

# Mathematical Proof
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
