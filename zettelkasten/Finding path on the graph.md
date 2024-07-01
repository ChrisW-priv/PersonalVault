We often have algorithms that look for the shortest/longest paths on the [Graph](Graph.md), but often the implementations return just "length" not the path to end node.
In those implementations we often store "dist" arrays that old optimal paths from start node.
To be able to tell how to get to end node we need to also store "prev" or "from" array also of length n.

To complete array: in the same time as we update shortest path to the node we also update "prev" array and set it's value to the node we found better path from (current node)

Then having completed path we call the function that starts at index of end node and follows the best path stored in the "prev" array and creates new array with values found. Then it just reverses the new array (because we'd have end->start path not start->end) 
