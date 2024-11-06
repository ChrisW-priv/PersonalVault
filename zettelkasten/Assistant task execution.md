[[AI assistant]]

# Assistant task execution

## Introduction

Language model by itself cannot perform any tasks. It, however, can determine
what tool can be used to perform the task. Here, tool is just a programming
function implemented in some programming language. Thus, if the LM provides us
with an output instructing which function to use and how, then we can invoke the
function specified with provided arguments. 

What is really necessary is the ability for the LM to generate a structured output, 
that is known by the caller beforehand and can be easily interpreted.

This ability to generate a structured output that can later be used to call
functions is commonly referred to as **Function calling**. Here, it makes sense to 
repeat the once we prompt the LM for function call, **it does not call the
function, WE call a function** that was provided to us along side the arguments.

**ANY** function calling functionality should be done with extreme care. While some 
functions may not necessarily do harm to the LM powered app host computer, 
there is a significant risk that LM may instruct us to execute code that is malicious.
Some common mitigation strategies include limiting the tool definitions to
verified, safe code procedures or creating a virtualised, sand-boxed environment 
for some code to run.

## Steps to achieve function calling capability

0. Use LM with explicit function calling capability
1. Make a list of available functions:
	1. function name
	2. description
	3. arguments
		1. position
		2. name
		3. description
		4. type
		5. additional information (like default value)
2. Prompt LM with task to execute + list defined in step 1.
3. Parse the structured output
4. Execute code

## Defining the tools programmatically

Idea: why define the functions to a JSON manually if we could have 
a special file where the function wrappers are put and there is some 
decorator that will mark those functions as "include in the JSON".
This way we skip the infamous problem of defining yet another language
that will be used to define the function list (as soon as any level of
complexity is met, we want to do the thing programmatically, why not use the
programming langue we are already using)

Also: we need to extend the tool definitions during runtime (ideally)
