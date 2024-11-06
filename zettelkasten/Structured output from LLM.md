# Structured output from LLM
Either with
[Assistant task execution](zettelkasten/Assistant%20task%20execution.md)
or ill-defined user input (not structured commands) we may want to restrict the
LLM into the output that can be then converted into parsable object (usually
JSON) to then either make it a pydantic model or just use directly.

Often times we may have a user-facing part of the app but we may not know what
exactly the user will type (no buttons or sth). Then, one nice use-case of the
LLM is we can understand the query the user asks us and then transform it into
an object.