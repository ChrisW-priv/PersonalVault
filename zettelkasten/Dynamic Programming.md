This note is inspired by video by SimonDev![here](https://www.youtube.com/watch?v=6z4ePR7YYa8)

Main idea in his video is: Dynamic programming is a set of patterns that are more "common sense" rather than some complicated or brilliant ideas.

In general, solving problems dynamically is to split large problems and those into smaller problems, solving those sub-problems and remembering results to avoid repetition.

Key thing to get right is "optimal substructure". The idea is that if you solve all sub-problems optimally, you solve the main problem.

Another thing is having "overlapping sub-problems". Problems you solve are the same problems done in the same way. They also have to be deterministic. Otherwise you will not be able to reuse the result of previous computation. Also known as [[Memoization]]

## Main tools
[[Memoization]]
[[Tabulation]]