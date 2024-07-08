Proposition [Indexing](Indexing) is used in order to optimise 
[Retrieval of relevant documents](Retrieval%20of%20relevant%20documents.md).
Basically, we use [LLM](LLM.md) to summarise the entire document and then embed the
summary. After that we [embed](Embedding.md) the Original question and then
return entire document instead of document chunks.
