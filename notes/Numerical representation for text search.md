---
categories:
- zettelkasten
date: 2025-02-14
description: No description provided.
tags: []
title: Numerical representation for text search
---

Normally, the lookup for the text relevant to a question would be done as in

[Document loading in RAG](Document%20loading%20in%20RAG.md). However, this way

is slow and we can easily optimise it with [indexing](Indexing.md). To do this, we parse the data inside the documents and represent the content numerical for easier lookup.

![](attachments/Pasted%20image%2020240701205614.png)

## What are different methods of numerical representation?

Basically, there is a division into deterministic "statistical" methods and "machine learned" methods

### What is an example of statistical method

The "Bag of Words" (BoW) representation is a popular approach in Natural Language Processing (NLP) for converting text data into a numerical format that can be used for searching, indexing, and classification.

**What is Bag of Words?**

In the BoW representation, each document or text snippet is represented as a bag (or set) of its unique words. This means that each word in the document is counted and added to a collection, regardless of their order or context.

For example, consider two documents:

Document 1: "The quick brown fox jumps over the lazy dog."

Document 2: "The lazy dog jumps over the quick brown fox."

In a BoW representation, both documents would be reduced to a set of unique words:

{the, quick, brown, fox, jumps, over, lazy, dog}

**How does it work?**

The BoW representation is typically created by performing the following steps:

1. **Tokenization**: Split the text into individual words or tokens.
2. **Stopword removal**: Remove common words like "the", "and", etc., that don't add much value to the meaning of the document. This step helps reduce dimensionality and noise in the data.
3. **Stemming** (or **Lemmatization**): Reduce words to their base or stem form, e.g., "running" becomes "run".
4. **Vector creation**: Create a vector for each document by counting the frequency of each word in the BoW representation.

The resulting vectors can be used as input features for various NLP tasks, such as:

1. **Text classification**: Use the BoW vectors to train a classifier to categorize documents into predefined categories.
2. **Information retrieval**: Use the BoW vectors to index and search large collections of text data.
3. **Clustering**: Group similar documents together based on their BoW vectors.

**Advantages**

1. **Simple and efficient**: The BoW representation is relatively simple to compute and requires minimal computational resources.
2. **Handling variable-length input**: The BoW representation can handle documents of varying lengths by ignoring word order and focusing on the presence or absence of words.
3. **Robust to noise**: By ignoring stopwords and stemming words, the BoW representation can be more robust to noisy or irrelevant information in the text data.

**Limitations**

1. **Loss of semantic meaning**: The BoW representation ignores word context, order, and nuances, which can lead to loss of semantic meaning.
2. **High dimensionality**: The number of unique words in a large corpus can result in high-dimensional vectors, making it challenging to analyze or cluster the data.
3. **Not suitable for long-range dependencies**: The BoW representation is not designed to capture long-range dependencies or relationships between words in a document.

### What is an example of machine learned method

**Embeddings: A Vectorized Representation for Numerical Search**

#### What are Embeddings?

* Definition: Embeddings are vector representations of words, documents, or concepts that capture their semantic meaning and context.
* Goal: To create a numerical representation that can be used for searching, indexing, and classification tasks.

#### How do Embeddings work?

* **Word2Vec**:
        + Word2Vec is an algorithm that learns high-dimensional vectors (embeddings) for words based on their co-occurrence in a corpus.
        + Two primary techniques: Continuous Bag of Words (CBOW) and Skip-Gram.
* **GloVe**:
        + GloVe is another popular algorithm for learning word embeddings, focusing on the global structure of language.
        + Uses a combination of matrix factorization and maximum likelihood estimation to learn high-quality word vectors.

#### Why use Embeddings?

* **Improved search performance**: Embeddings can capture semantic relationships between words, making it easier to retrieve relevant documents or answers.
* **Robustness to noise**: By learning vector representations that are robust to noisy or irrelevant information, embeddings can reduce the impact of out-of-vocabulary words or misspellings.
* **Scalability**: Embeddings can be used for large-scale text data and even enable efficient nearest-neighbor search in high-dimensional spaces.

#### How do we use Embeddings for Search?

* **Vector similarity**: Measure the distance between vectors to determine the relevance of a query document or answer.
* **Nearest-Neighbor Search**: Find the most similar documents or answers by searching for the closest vector representations.
* **Indexing and Retrieval**: Create an index of embeddings and use it to retrieve relevant documents or answers based on a given query.

#### Advantages of Embeddings

* **Captures semantic meaning**: Embeddings can capture nuanced semantic relationships between words, enabling more accurate search results.
* **Handles out-of-vocabulary words**: By learning vector representations for unseen words, embeddings can still perform well even when encountering unknown vocabulary.
* **Robust to noise and misspellings**: The vectorized representation is less susceptible to noise and misspellings, making it a reliable choice for text search tasks.

#### Limitations of Embeddings

* **Computationally expensive**: Training high-quality embeddings can be computationally intensive, especially for large corpora.
* **Requires large training datasets**: To learn robust and accurate vector representations, large-scale training datasets are often necessary.
* **May not generalize well**: The learned embeddings might not generalize well to unseen data or domains, requiring additional adaptation steps.

In summary, the use of embeddings as a search/lookup approach offers several advantages, including improved search performance, robustness to noise, and scalability. While there are limitations to consider, the benefits of using embeddings make them a popular choice in many 

natural language processing (NLP) applications.

## How do you do this in practice?

Currently, the preferred way is to use [Embeddings](Embeddings.md) models. There, the main limitation is the context window. Thus, you split the documents into chunks. Then you embed the meaning of each chunk and save it. Then, when the question comes, you embed the question, lookup most closely related documents, and return the documents relevant.