---
title: "Monad"
date: 2025-02-14
description: ""
tags: 
  - "zettlekasten"
categories: []
---

> [!Definition]
> 

```quote
A monad is just a monoid in the category of endofunctors, what's the problem?
- James Iry
```
Following note is based on video by 'Studying with Alex' [here](https://www.youtube.com/watch?v=C2w45qRc3aU)
Current state of the note is heavily based on practical application of the pattern rather than mathematical basis in [Category theory](Category%20theory)
## General properties
Any Monad system has to have following structures implemented:
- Wrapper Type 
	- This is a type that we base our system on
	- In Example it was `NumberWithLogs`
	- commonly referred to as `object`
- Wrap Function 
	- allows transition into our Monad system
	- In Example it was `wrapWithLogs`
	- it is commonly referred to as `return, pure, unit`
- Run Function
	- runs transformations on monadic values
	- In Example it was `runWithLogs`
	- commonly referred to as `bind, flatMap, >>=`

## Example
He starts by providing example in TypeScript. Here I will rewrite to python as it is more familiar.

```python
def square(x: int) -> int:
	return x*x

def addOne(x: int) -> int:
	return x + 1
```
And then use it like so:
```python
addOne(square(2)) # 5
```
Then he wants to add logging to the code. Here it is worth noting we already know [Inspect pattern](Inspect%20pattern.md) to test nested function calls but here we want to give sound example to use Monad structure. Anyway, we want end example to produce something like this:
```python
addOne(square(2)) -> {
	result: 5,
	logs: [
		"Squared 2 to get 4.",
		"Added 1 to 4 to get 5.",
	]
}
```
He proceeds to built an interface `NumberWithLogs`. Here it will be simple class.
```python
from dataclasses import dataclass

@dataclass
class NumberWithLogs:
	result: int
	logs: list[str]
```
And rewrites the functions to
```python
def square(x: int) -> NumberWithLogs:
	result = x * x
	logs = [ f'Squared {x} to get {result}.' ]
	return NumberWithLogs(result, logs)

def addOne(x: NumberWithLogs) -> NumberWithLogs:
	result = x.result + 1
	log = [ f'Added 1 to {x.result} to get {result}' ]
	return NumberWithLogs(result, x.logs + log)
```
Currently there are couple of issues:
- `square(square(x))` will not work because first one only accepts ints, but returns `NumberWithLogs`
- `addOne(x)` will not work because it requires `NumberWithLogs` but receives int
To solve them we need to create a function to create `NumberWithLogs` 
```python
def wrapWithLogs(x: int) -> NumberWithLogs:
	return NumberWithLogs(x, [])
```
And also adapt square to be proper for new system
```python
def square(x: NumberWithLogs) -> NumberWithLogs:
	result = x*x
	log = [ f'Squared {x} to get {result}.' ]
	return NumberWithLogs(result, x.logs + log)
```
Now to execute `square(square(x))` or `addOne(x)` we need to start with `wrapWithLogs(x)` and preceded as usual.
```python
square(square(wrapWithLogs(x)))
addOne(wrapWithLogs(x))
```
Now to rewrite square some more to make it easier to see how we can refactor this even more.
```python
def square(x: NumberWithLogs) -> NumberWithLogs:
	result = x*x
	log = [ f'Squared {x} to get {result}.' ]
	new_number_with_logs = NumberWithLogs(result, log)
	return NumberWithLogs(
		new_number_with_logs.result,
		x.logs + new_number_with_logs.logs
	)
	
def addOne(x: NumberWithLogs) -> NumberWithLogs:
	result = x + 1
	log = [ f'Added 1 to {x.result} to get {result}' ]
	new_number_with_logs = NumberWithLogs(result, log)
	return NumberWithLogs(
		new_number_with_logs.result,
		x.logs + new_number_with_logs.logs
	)
```
Lets create a function `runWithLogs(x, fn)`.
```python
from typing import Callable

def runWithLogs(
				x: NumberWithLogs,
				transform: Callable[[NumberWithLogs], NumberWithLogs]
				) -> NumberWithLogs
	new_number_with_logs = transform(x.result)
	return NumberWithLogs(
		new_number_with_logs.result,
		x.logs + new_number_with_logs.logs
	)
```
This allows us to write simple function implementations for `square` and `addOne` again!
```python
def square(x: int) -> NumberWithLogs:
	return NumberWithLogs(
		x * x,
		[ f'Squared {x} to get {result}.' ]
	)
	
def addOne(x: int) -> NumberWithLogs:
	return NumberWithLogs(
		x + 1,
		[ f'Added 1 to {x.result} to get {result}' ]
	)
```
Final code:
```python
from dataclasses import dataclass
from typing import Callable


@dataclass
class NumberWithLogs:
	result: int
	logs: list[str]

def square(x: int) -> NumberWithLogs:
	return NumberWithLogs(
		x * x,
		[ f'Squared {x} to get {result}.' ]
	)
	
def addOne(x: int) -> NumberWithLogs:
	return NumberWithLogs(
		x + 1,
		[ f'Added 1 to {x.result} to get {result}' ]
	)

def wrapWithLogs(x: int) -> NumberWithLogs:
	return NumberWithLogs(x, [])

def runWithLogs(
				x: NumberWithLogs,
				transform: Callable[[NumberWithLogs], NumberWithLogs]
				) -> NumberWithLogs
	new_number_with_logs = transform(x.result)
	return NumberWithLogs(
		new_number_with_logs.result,
		x.logs + new_number_with_logs.logs
	)
```
This is our final Monad! Now to exercise any command with it we can use it like so:
```python
a = wrapWithLogs(5)
b = runWithLogs(a, addOne)
c = runWithLogs(b, square)
d = runWithLogs(c, anyFunction)
```
the order of those functions will change the result of course but this is true for any functions. More importantly, we have the option to do so and it will never break our code.

## Examples of useful and common Monads
### Option monad
Option monad is often referred to as `Maybe monad`

Basically:
```
number         is just a number
Option<number> is a number OR nothing
Option<User>   is a User OR nothing
```
Option satisfies the requirements of monad because it has:
- Wrapper Type: 
	- `Option<T>`
- Wrapper Function:
	- `function some<T>(x:T): Option<T>`
- Run Function:
```js 
function run<T>(
				input: Option<T>, 
				transform: (_:T) => Option<T>
				) : Option<T> {
	if (input == none) {
		return none
	}
	return transform(input.value)
}
```
Code not using the monad:
```js
function getPetNickname(): string | undefined {
	const user: User | undefined = getCurrentUser()
	if (user === undefined){
		return undefined
	}
	const userPet: Pet | undefined = getPet(user)
	if (userPet === undefined) {
		return undefined
	}
	const userPetNickname: string | undefined = getNickname(userPet)
	return userPetNickname
}
```
Code using the monad:
```js
function getPetNickname(): Option<string> {
	const user: Option<User> = getCurrentUser()
	const userPet: Option<Pet> = run(user, getPet)
	const userPetNickname: Option<string> = run(userPet, getNickname)
	return userPetNickname
}
```

### Future / Promise monad 
This monad is really useful for Abstracting away the possibility for values to only become available later.

### List monad 
When viewed from monadic perspective lists can be abstractions of branching computation. Example of Doctor Strange picking a coin after choosing doors:
```js
const doors = ['red', 'green', 'blue'];
const doorAndCoinPossibilities = run(
	doors, 
	door => [
			door + heads,
			door + tails
	]
)
// or more simply
const doorAndCoinPossibilities = doors.flatMap(
	door => [
			door + heads,
			door + tails
	]
)
```
