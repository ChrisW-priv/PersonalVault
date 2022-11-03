# Eulerian Path
## Definition
An Eulerian Path is a path of edges that visits all edges in a graph exactly once.

## Notation
[[Counting the numebr of in and out edges in a graph]]

### Undirected Graph
Either every vertex has even degree or exactly two vertices have odd degree.

### Directed Graph
At most one vertex has (outdegree) - (indegree) = 1
and at most one vertex has (indegree) - (outdegree) = 1 and all other vertices have equal in and out degrees.

## Code
Complexity: $O(E)$

```pseudo
g = graph we work on
N = g.size
m = number of edges in the graph

function findEulerianPath():
	in_deg, out_deg = countInOutDegrees()
	if not graphHasEulerianPath(): return null

	path_reverse = dfs(findStartNode())
	if path.size() == m+1: return path.reversed()
	return null
function graphHasEulerianPath():
	start_nodes = 0
	end_nodes = 0
	for (i=0;i<N;i++):
		if out[i] - in[i] > 1 or in[i] - out[i] > 1: return false
		else if out[i] - in[i] == 1:
			start_nodes++
		else if in[i] - out[i] == 1:
			end_nodes++
		return (end_nodes==start_nodes==0) or (end_nodes==start_nodes==1)

function findStartNode():
	start = 0
	for (i=0;i<N;i++):
		if out[i] - in[i] == 1: return i
		if out[i] > 0: start=i
	return start

# Modified DFS here:
function dfs(at):
	path = []
	while out[at] != 0:
		next_edge = g[at].get(--out[at])
		dfs(next_edge.to)
	path.append(at)
```

