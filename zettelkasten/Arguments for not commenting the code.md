Part of [[Code quality]]

- If code needs a comment it is a sign code should be refactored instead.
- Comments lie, code does not.
- When working with code with comments you need to update both code and comments during refactor. This is a big reason for comments that are out of date and confuse the future reader.
- To verify that code works you have compiler, linting and tests. There is no such tool for comments.
- Types are much better at enforcing proper state. See [[Naming conventions in code]] for examples.

This is not to be mistaken with code documentation. Documentation is used to guide the user through how to use the code written. What is the contex of it. What are the expectations.

Exceptions:
- Non obvious performance optimisations
- References to math and algorith notes