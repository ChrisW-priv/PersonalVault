# Low-link Values in a graph
## Definition
A low-link values of a node is the lowest node id reachable from that node when doing [[Depth First Search (DFS)]] (including itself).

Using low-link Values in the graph can be used to find cycles in the [[Graph]].

Important: if our lowlink values are used to detect [[Strongly Connected Component (SCC)]] Then the result of the operation is dependent on the randomness of the starting position of DFS. Therefore we sometimes have to incorporate a set of values that we are exploring currently. This way we allways get the same result each time.