# Reduce pattern
> [!Definition]
> A "Swiss knife" of [[Function programming]]. Executes a function for every element of an [[Array]] and returns accumulated result. Result can be of any type, but commonly is an int or a list. It can also represent a struct that in turn represents state.

Reduce function accepts a function, an array and starting value. If starting value is not provided, it assumes `arr[0]` to be a start and `arr[1:]` to be the array to execute given function.
