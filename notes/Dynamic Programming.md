---
categories: []
date: 2025-02-14
description: No description provided.
tags:
- zettlekasten
title: Dynamic Programming
---

This note is inspired by video by SimonDev![here](https://www.youtube.com/watch?v=6z4ePR7YYa8)

Main idea in his video is: Dynamic programming is a set of patterns that are more "common sense" rather than some complicated or brilliant ideas.

In general, solving problems dynamically is to split large problems and those into smaller problems, solving those sub-problems and remembering results to avoid repetition.

Key thing to get right is "optimal substructure". The idea is that if you solve all sub-problems optimally, you solve the main problem.

Another thing is having "overlapping sub-problems". Problems you solve are the same problems done in the same way. They also have to be deterministic. Otherwise you will not be able to reuse the result of previous computation.

## Main tools

[Memoization](Memoization.md)

[Tabulation](Tabulation.md)

[Recursion](Recursion.md)

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

we solve it by checking each result of using one coin.

```js
var MEMO = {}

function coin_change(coins, total){
	const key = "" + total;
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

### Knapsack

knapsack(items, capacity) = max value $\leq$ capacity "n".

Where items is a list of 2-valued items: weight and value.

we solve it by creating a branches "include i-th item" and "don't include i-th item"

```js
var MEMO = {}

function knapsack_rec(items, capacity, i){
	const key = capacity + "." + i;
	if (key in MEMO){
		return MEMO[key];
	}

	if (capacity == 0) return 0;
	if (total < 0) return -10_000; // some small number
	if (i == items.length) return 0;
	
	const result = Math.max(
		knapsack_rec(items, capacity - items[i][0], i+1) + items[i][1]; // 
		knapsack_rec(items, capacity, i+1),
	);
	MEMO[key] = result;
	return result;
}
```

### Staircase Problem

Stair(n) = # ways to climb stairs with "n" steps. can take 1 or 2 steps at a time. we create a tree with "steps left after 1 step" and "steps left after 2 steps".

```js
var MEMO = {}

function staircase(n_stairs){
	const key = "" + n_stairs;
	if (key in MEMO){
		return MEMO[key];
	}

	if (n_stair == 0) return 0;
	if (n_stair == 1) return 1; 
	if (n_stair == 2) return 2; // 11, 2
	
	const result = staircase(n_stairs-1) + staircase(n_stairs-2);
	MEMO[key] = result;
	return result;
}