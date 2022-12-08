# Counting the number of in and out edges in a graph
## Definition
To know the degree of each edge can be really useful when trying to find [[Eulerian Path]] of even [[Eulerian cycle]]. This is very easily done in linear time for [[Undirected Graph]] however can be quite hard to be done efficiently for [[Directed Graph]]. Code below is a suggestion on how to do it quickly.

## Code
```pseudo
function countInOutEdges(graph, N):
	in_deg = [0,0,...,0] # size N
	out_deg = [0,0,...,0] # size N

	for (i=0;i<N;i++):
		neighbours = graph[i]
		out_deg[i] = len(neighbours)
		for neighbour in neighbours:
			in_deg[neighbour]++	
	return in_deg, out_deg
```

## Intuition
In this solution no work is done unnecessarily so it's best solution so far.