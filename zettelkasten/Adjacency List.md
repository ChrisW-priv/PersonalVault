[Graph representation](Graph%20representation.md)

An adjacency list is a way to represent a graph as a map from nodes to lists of edges.

|Pros|Cons|
|:-:|:-:|
|Space efficient for representing sparse graphs|Less space efficient for denser graphs.|
|Iterating over all edges is efficient|Edge weight lookup is $O(E)$|
||Slightly more complex graph representation|
