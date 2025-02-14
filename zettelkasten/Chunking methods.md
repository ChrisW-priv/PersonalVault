---
title: "Chunking methods"
date: 2025-02-14
description: ""
tags: 
  - "zettlekasten"
categories: []
---

[LLM](zettelkasten/LLM.md)

# Chunking methods

## Chunk Size

The size of the chunks can have a significant impact on the quality of the RAG
system. While large sized chunks provide better context, they also carry a lot
of noise. Smaller chunks, on the other hand, have precise information but they
might miss important information. 

Example: 
Consider a legal document that’s 10,000 words long. If we chunk it into
1,000-word segments, each chunk might contain multiple legal clauses, making it
hard to retrieve specific information. Conversely, chunking it into 200-word
segments allows for more precise retrieval of individual clauses, but may lose
the context provided by surrounding clauses. Experimenting with chunk sizes can
help find the optimal balance for accurate retrieval.

## Simple Chunking methods

### Fixed size chunking

**Character-count-Based Chunking**: Chunks are created based on a fixed number of characters

**Token-count-Based Chunking**: Chunks are created based on a fixed number of tokens.

Character or Token count based chunking methods are by far the simplest methods that one could employ to chunk the documents. They work by splitting text by set limit of characters count. Their advantage is great simplicity, however, it is really common for the chunk to end abruptly and the context or full answer to be lost.
Example:
document = "Learning programming is fun!"
chunks = ['Learn', 'ing p', 'rogra', 'mming', ' is f', 'un!']
Here, the character count is set to 5 to illustrate the point of loosing information between chunks.

### Recursive chunking

**Heuristic Recursive Chunking**: Chunks are defined by recursively splitting the text by some set delimiters. 

**Filetype-Based Recursive Chunking**: Chunks are defined by recursively splitting the text by some delimiters that are known to mean something in the context of the document. 

Recursive based chunking is an improvement on fixed count methods. Intuitively, we work on text, so why not split the documents on chapters, paragraphs, linebreaks, sentences and words?

If we are given some max size of the chunk, we keep dividing the document until
the max size requirement is met.
By default, common list of delimiters is set to: `["\n\n", "\n", " ", ""]`
This attempts to capture in order: paragraphs, line-breaks, words and letters.

With the file specific approach we adapt the default list of delimiters to work
better on the concrete example. 
For instance, for HTML we may want to break on `<h1>, <h2>, ...` and only then
on paragraph text tags and only if that is insufficient break up the individual
paragraphs.

While the Recursive file chunking is superior to the fixed size chunking, it is
still not perfect. Sentences close to each other may or may not be related, and
paragraphs may cover multiple ideas. This naive approach while already quite
effective, is heavily based on a hope that the semantic of the document is 
reflected in it's structure. It will not work perfectly in situations where there are 
sentences that should be treated together or the paragraphs that should be broken down into smaller chunks.

Additionally, there is a non 0 level of performance loss due to the fact that
there is a need to analyze actual content of the file. 

## Advanced Chunking methods

In this section we will explore advanced chunking methods that attempt to break
down documents based on the actual meaning of the document content.

### Context-Enriched Chunking

This method adds the summary of the larger document to each chunk to enrich the
context of the smaller chunk. This gives more context available to the LLM
without adding too much noise. It also improves the retrieval accuracy and
maintains semantic coherence across chunks.

While this is not exactly **chunking** method, meaning it does not involve breaking
down the larger document into smaller one, it does improve the knowledge 
retrieval.

### Semantic Chunking

This idea proposed by Greg Kamradt who questions two aspects of the fixed size chunking methods.

- Why should we have a pre-defined fixed size of chunks?
- Why don’t chunking methods take into consideration the actual meaning of content?

This does break out from the simple but naive approaches. Normally, we would
have some fixed limit to chunk size as well as the fixed number of retrieved
chunks. But in the context of information retrieval it makes sense to group all 
close ideas together and in the retrieval step just return N most relevant blocks.
In case we hit a limit to the context window size, we could iteratively exclude the
least significant results.

Simplest approach is to split entire document into sentences and then embed 
them to finally do a cosine similarity check and split the document in places
where the difference between sentence meaning is greatest.

Big limitation of this technique is that it relies on good naive spliting in the
first stage. However, more complex chunking methods combined with
Context-Enriched Chunking could result in greater performance. 

### Small-to-Big & Sliding Window Techniques

[Small to big chunking](https://archive.is/o/zE3Og/https://towardsdatascience.com/advanced-rag-01-small-to-big-retrieval-172181b396d4)
is a hierarchical chunking method where the text is first broken down into very
small units (e.g., sentences, paragraphs), and the small chunks are merged into
larger ones until the chunk size is achieved. Sliding window chunking uses
overlap between chunks to maintain context across chunk boundaries. The process
can be understood in three steps —

1. Divide the longer text into compact, meaningful units like sentences or paragraphs.
2. Merge the smaller units into larger chunks until a specific size is achieved. Once the size is achieved, this chunk is treated as an independent segment of text.
3. When a new chunk is being created include a part of the previous chunk at the start of the new chunk. This overlap is necessary to maintain contextual continuity.

