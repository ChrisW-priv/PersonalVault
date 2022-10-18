Sometimes a graph is split into multiple components. It's useful to be able to identify and count these components.

To split graph into connected components it's useful to mark each node with an id of the component that it's in. 

## Solution description
To do that you can use [[Depth First Search (DFS)]] to identify components.
1. make sure all nodes are labelled $[0,n)$ where n is the number of nodes.
2. Start DFS at node 0. 
3. While exploring connected nodes mark them with id 0
4. When function stops, all nodes of the component are visited
5. Search for the lowest id that hasn't been labelled and start DFS from that node this time with id 1
6. continue until all nodes are marked

## Code
```pseudo
# Gloal or class scope variables
n = number of nodes in the graph
graph = adjancy list representing graph
count = 0 # counts how many connected components there are
components = empty integer array # size n
visited = [false, ..., false] # size n

function dfs(at):
	if visited[at]: return
	visited[at] = true
	components[at] = true

	neighbours = graph[at]
	for next in neighbours:
		dfs(next)

function findComponents():
	for i=0,1,2,...,n-1:
		if not visited[i]:
			count++
			dfs(i)
	return count, components

# Start DFS at node zero
number_of_conected_components, list_of_ids = findComponents()
```