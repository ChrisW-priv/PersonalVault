---
title: "Assistant task execution"
date: 2025-02-14
description: "This note discusses the execution of tasks by AI language models, specifically focusing on function calling capabilities and tool definitions."
tags: [] 
categories:
  - "zettelkasten"
---

[[AI assistant]]

## Introduction

Language models (LMs) by themselves cannot perform tasks directly; they are capable of determining which functions can be used to perform a task. A "tool" in this context refers to a programming function implemented in a specific programming language. If the LM provides us with output detailing which function to use and how to invoke it, we can execute the specified function with the given arguments. 

The critical capability here is the ability of the LM to generate structured output, which the caller can easily interpret based on prior knowledge. This ability to generate a method of invoking functions is known as **function calling**. It is essential to emphasize that when the LM is prompted for a function call, **it does not actually execute the function; WE execute the function** using the instructions provided alongside the arguments.

**Caution**: Function calling should be approached with care. While some functions may not pose harm to the host computer running the LM, there is a significant risk that the LM could suggest executing potentially malicious code. Mitigation strategies include limiting the tool definitions to verified, safe code procedures or creating a virtualized, sandboxed environment for executing any code.

## Steps to Achieve Function Calling Capability

1. Utilize an LM with explicit function calling capability.  
2. Create a list of available functions, which includes:
   1. Function name
   2. Description of the function
   3. Arguments:
      1. Position of the argument
      2. Name of the argument
      3. Description of the argument
      4. Type of the argument
      5. Additional information (e.g., default value)
3. Prompt the LM with a task to execute alongside the list defined in step 2.
4. Parse the structured output received from the LM.
5. Execute the provided code based on the parsed output.

## Defining the Tools Programmatically

### Concept

Instead of manually defining functions in JSON, we can leverage a special file where function wrappers are defined. By applying a decorator to mark functions for inclusion in the JSON, we can avoid the complexity of creating and maintaining another language for function definitions. As complexity increases, utilizing the programming language we are already using can simplify the process of defining functions programmatically. 

Additionally, we aim to extend the tool definitions during runtime, ideally enhancing flexibility and functionality.