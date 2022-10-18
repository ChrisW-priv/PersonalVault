The BFS is another fundamental search algorithm used to explore nodes and edges of graph. It runs with a time complexity of $O(V+E)$ and is often used as a building block in other algorithms.

The BFS algorithm is particularly useful for one thing: finding shortest path on unweighted graphs.

To build a BFS it is easiest to build a [[Queue]] to track which node to visit next.

## Code
```pseudo
n = number of nodes in the graph
graph = adjancy list representing graph
visited = [false, ..., false] # size n

# s = start node, e = end node, 0 =< s,e <n
function bfs(s, e):
	prev = solve(s)

	return reconstructPath(s,e,prev)

function solve(s):
	q = queue data structure with enqueue and dequeqe
	q.enqueue(s)
	visited = [false, ..., false] # size n
	visited[s] = true

	prev = [null, ..., null] # size n

	while not q.Empty():
		node = q.dequeue()
		neighbours = graph.get(node)

		for next in neighbours:
			if not visited[next]:
				q.enqueue(next)
				visited[next] = true
				prev[next] = node
	
	return prev

function reconstructPath(s,e,prev):
	# Reconstruct path going backwards from e
	path = []
	at = e
	while at != null:
		path.add(at)
		at = prev[at]

	# reverse path to be path from s->e not e->s
	path.reverse()

	# If s and e are connected return path else empty array
	if path[0] == s:
		return path
	return []


# Start BFS at node zero, and end at n-1
start = 0, end = n-1
bfs(start, end)
```
## Connected to
[[Graph]]

