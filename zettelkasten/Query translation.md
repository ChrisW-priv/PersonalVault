# Query translation
Simply put, sometimes the queries to LLM may be incomplete, miss context or
detail. One way of improving the [Prompt engineering](Prompt%20engineering) is
to use LLM to interpret the question and rewrite it in such a way that will be
more detailed and with context. One common way is to generate more queries that
will enhance the hitrate of relevant documents in our database.

Once the questions are translated, the problem can be split into a couple of related problems. Now each of the sub-problems can be solved separately or we could build solution of the most specific problem by combining the result of any sub-problem that was a part of the original question.

This is strongly linked to general [Prompt engineering](Prompt%20engineering),
where by asking the same question but in a different manner, the LLM performance
dramatically improves.