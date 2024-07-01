[SSSP](SSSP) problem can be solved efficiently on a DAG in $O(V+E)$ time. This is due to the fact that the nodes can be ordered in a [Topological ordering](Topological%20ordering.md) via [Topological Sort](Topological%20Sort.md) and processed sequencially. 

In this case we don't have to worry about negative edge weights as we do in other, more general algorithms.

## Algorithm
1. Create topological order of nodes.
2. Initiate an array with best score for each node. Set all values to infinity. 
3. Set the distance to starting node to 0.
4. From that node explore all reachable nodes and update the value to new best score.
5. Then, move to next node in topological order that you know the starting value (not infinity) and continue the search.

## Code

```pseudo
# Gloal or class scope variables
n = number of nodes in the graph
graph = adjancy list representing graph

function SSSP(start, graph, n):
	topsort = topsort(graph, n)
	dist = [null, ..., null]
	for (i=0;i<n;++i){
		nodeid = topsort[i]
		if dist[nodeid] != null
		adjacentEdges = graph.get(nodeid)
		for edge in adjacentEdges:
			newDist = dist[nodeid] + edge.weight
			if dist[edge.to] == null
				dist[edge.to] = newDist
			else:
				dist[edge.to] = min(dist[edge.to], newDist)		
	}

```