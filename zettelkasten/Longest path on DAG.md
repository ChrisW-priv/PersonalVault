Simmilarly as in [[Single Source Shortest Path on DAG (SSSP)]] this problem can be solven in $O(V+E)$ complexity.

Trick here is to multiply all edge values by -1, then find the SSSP and then multiply the edge values by -1 again.