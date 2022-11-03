# Strongly Connected Component (SCC)
## Definition
Strongly Connected Components (SCC) can be thought of as self-contained cycles within a [[Directed Graph]] where every vertex in a given cycle can reach every other vertex in the same cycle.

## Algorithm for finding SCCs
```pseudo
UNVISITED = -1
n = number of nodes in the graph
g = graph we work on

id = 0 # Give each node it's id
sccCount = 0 # Used to count number of SCCs found

ids = [0,0,...,0] # len = n
low = [0,0,...,0] # len = n

onStack = false
stack = an empty stack DS

function find Sccs():
	for (i=0;i<n;++i): ids[i] = UNVISITED
	for (i=0;i<n;++i):
		if (ids[i] == UNVISITED):
			dfs(i)
	return low

# modified DFS here:
function dfs(at):
	stack.push(at)
	onStack[at] = true
	ids[at] = low[at] = id++

	for(to: g[at]):
		if (ids[to] == UNVISITED): dfs(to)
		if (onStack[to]): low[at] = min(low[at],low[to])
	if (ids[at] == low[at]):
		for (node = stack.pop();;node=stack.pop())
			onStack[node] = false
			low[node] = ids[at]
			if(node==at):break
		sccCount++
```