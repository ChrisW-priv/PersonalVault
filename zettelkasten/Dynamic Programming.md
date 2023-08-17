This note is inspired by video by SimonDev![here](https://www.youtube.com/watch?v=6z4ePR7YYa8)

Main idea in his video is: Dynamic programming is a set of patterns that are more "common sense" rather than some complicated or brilliant ideas.

In general, solving problems dynamically is to split large problems and those into smaller problems, solving those sub-problems and remembering results to avoid repetition.

Key thing to get right is "optimal substructure". The idea is that if you solve all sub-problems optimally, you solve the main problem.

Another thing is having "overlapping sub-problems". Problems you solve are the same problems done in the same way. They also have to be deterministic. Otherwise you will not be able to reuse the result of previous computation.

## Main tools
[[Memoization]]
[[Tabulation]]
[[Recursion]]

## Intuition
Good intuition provided by Simon is to think of the problem as one having sub-problems and which combination is a solution to main-problem. Somewhere in that tree of recursive function calls you have a memoization table to avoid redoing the job

## Examples
### Fibonacci number:
fib(n) = fib(n-1) + fib(n-2)
```js
var MEMO = {}

function fib(i){
	const key = "" + i;
	if (key in MEMO){
		return MEMO[key];
	}

	if (i == 0 || i == 1) return i;

	const result = fib(i - i) + fib(i - 2);
	MEMO[key] = result;
	return result;
}
```

### Coin change
coin(coins, n) = min # of coins in `coins` needed to make 'n'
```js
var MEMO = {}

function fib(coins, total){
	const key = "" + i;
	if (key in MEMO){
		return MEMO[key];
	}

	if (total == 0) return 0;
	if (total < 0) return 10_000; // some large number

	results = [];
	for (let i = 0; i < coins.length; ++i){
	    const coin = coins[i];
		results.push(coin_change(coins, total - coin));
	}
	const result = 1 + Math.min(...results);
	MEMO[key] = result;
	return result;
}

```