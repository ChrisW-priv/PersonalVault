# Minimum Spanning Tree (MST)
## Definition
On an [[Undirected Graph]] and [[Weighted Graph]], a Minimum Spanning [[Tree]] is a subset of the edges in the graph which connects all vertices together (without creating any cycles) while minimizing the total cost.

## Code
### Prim's Algorithm
Good for dense graphs. Usually will work in $O(E\cdot log(E))$ but it can be optimized to $O(E\cdot log(V))$.
It is not easily parallelizable. Neither can do minimum spanning forest on disconnected graph.

### Krushal's & Boruvka's algorithm
Supposedly better but now it's under #TODO 

## Intuition
