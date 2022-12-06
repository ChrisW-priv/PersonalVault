# Minimum Spaning Tree (MST)
## Definition
On an [[Undirected Graph]] and [[Weighted Graph]], a Minimum Spanning [[Tree]] is a subset of the edges in the graph wchich connects all vertecies together (without creating any cycles) while minimising the total cost.

## Code
### Prim's Algorithm
Good for dense graphs. Usually will work in $O(E\cdot log(E))$ but it can be optimised to $O(E\cdot log(V))$.
It is not easily paralalisible. Neither can do minimum spanning forest on disconected graph.

### Krushal's & Boruvka's algorithm
Supposadely better but now it's under #TODO 

## Intuition
