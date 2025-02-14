---
title: "Building knowledge base from Documents"
date: 2025-02-14
description: ""
tags: 
  - "zettlekasten"
categories: []
---

[RAG](zettelkasten/RAG.md)

# Building knowledge base from Documents

Text Indexing for Language Extraction
Text indexing based on RAPTOR idea for RAG.
Great link to paper I should take examples from [here](https://arxiv.org/html/2401.18059v1)

## Problem

We have some knowledge stored in documents. Those documents may have different
structure and file extensions. This includes markup file extensions like PDF,
HTML, Markdown or Microsoft Office associated files, but also pictures or video
which come in a wide variety of file formats. 

We want to convert all of them into a structure that allows to easily find content that
is relevant to answering the question about some part. This question can be done
in natural language.

## Overview of Solution 

There are 4 distinct parts to solving the problem.

1. Extracting information from files
2. Indexing the data to allow easy and fast search
3. Storing the indexing results for later use
4. Returning relevant results on natural language query

## Extracting useful content from files

### Scope

Because there is a wide range of files that we need to cover, I will cover only
on most common ones. Those include: plain text, HTML, Word-documents, PowerPoint
presentations and PDFs. 

Because full content extraction is outside of the scope of the project and can
be improved later, I will not use any advanced methods like OCRs or other unless
provided by a freely available software. I will also not cover support for
images as adding support for them later should not be a challenge and they add
unnecessary complexity due to many considerations that need to be done.

Finally, I will not store metadata in any sort of organised way. Because many
parsing libraries already provide some metadata support, I will not discard that
work. However, I do not plan to use them in my solution, thus they are left to
allow future use.

### Considerations

There are couple caveats that should be resolved before I begin.

#### Nested directories

While most of the knowledge that is available will be in a flat directory of
files, sometimes we will get a nested directory of content. This could be due to
multiple reasons.

It is very common for a documentation in an HTML format to
be designed as a self contained folder structure that allows the user to interact
with the documents as if it was a web app.

Sometimes it will be due to attempts by the user to separate knowledge by some
metric to allow easier retrieval by category. For instance a student may want to 
separate materials by subject or a year that he or she was partaking in the
course. 

Example:
```bash
knowledge
├── foo.pdf
├── bar.docx
├── baz.pptx
├── README.md
├── index.html
├── main.py
└── django_documentation
|   ├── index.html
|   ├── _images
|   |   └── ...
|   ├── _static
|   |   └── ...
|   ├── chapters
|   |   └── ...
|   └── ...
└── ELAC
|   ├── lecture_slides
|   |   ├── lec1.pptx
|   |   ├── lec2.pdf
|   |   └── ...
|   ├── lecture_notes
|   |   ├── note1.md
|   |   ├── note2.md
|   |   └── ...
|   ├── zettelkasten
|   |   ├── DFA.md
|   |   ├── NFA.md
|   |   ├── Pumping Lemma.md
|   |   └── ...
└── ...
```

In this example, files like "foo.pdf" or "bar.docx" are some loose knowledge
materials that are most likely self contained and answer all questions that
reader needs to know answer to.
In the case of django-framework documentation, the index.html will likely point
to the chapters folder for rest of the knowledge.
In the case of the ELAC folder, it represents a directory of resources student 
collects for Languages and Automata Course available in Warsaw University of 
Technology. It is comprised of lecture notes as well as some notes that have the 
ideas separated, much like in a Wikipedia or similar.

There is a need to clearly define the bounds of the "singe resource".
This is because, in the end, there needs to be a way to Create, Read, Update and
Delete knowledge.

It makes sense that each and every folder or file should be treated the same,
i.e. "foo.pdf", "bar.docx" and others files will be independently removable or
update-able, but the folders that contain nested files will be treated as one
knowledge resource and will be combined into one. This is not without 
trade-offs however. Adding and removing notes to the lecture notes will no
longer be as easy. One would have to add the note via some external program
and rerun the indexing for the entire folder. While repetitive, it is not a big 
problem as in a highly dynamic environments, we may want to separate the 
databases anyway.

## Knowledge indexing

The volume of textual data being generated is immense, leading to a significant
challenge in efficiently indexing and retrieving relevant documents in response
to user queries. To address this challenge, a variety of algorithms and
techniques have been developed, ranging from traditional statistical approaches
to more advanced methods like semantic embeddings. This chapter explores the
core mechanisms behind indexing text files, with a focus on two prominent
retrieval methods: the BM25 algorithm and modern embedding-based approaches. We
will compare these methods and explore their historical contexts, strengths, and
limitations.

### Introduction to Text Indexing

Text indexing is the process of organizing large collections of unstructured
text data to facilitate efficient retrieval of relevant documents in response to
a query. The main goal is to reduce the amount of time and computational
resources needed to find documents that match a user's search terms.
Historically, indexing began with relatively simple techniques but has evolved
into more sophisticated approaches as data volumes and retrieval requirements
have grown.

In early search systems, term-based indexing (e.g., inverted indices) dominated,
where each term (word) in a document was associated with a list of documents
containing that word. Over time, the need for more accurate and nuanced ranking
of documents led to the development of retrieval models such as BM25 and later,
embedding-based approaches. 

### The BM25 Algorithm

#### History of BM25

BM25 (Best Matching 25) is one of the most well-known algorithms used in
information retrieval systems and was developed as part of the Okapi BM25
family, first introduced in the early 1990s. The Okapi system, developed by
Stephen Robertson and his colleagues at the City University of London, emerged
as an advancement over the Vector Space Model (VSM), which assumed that all
terms in a document were equally important for retrieval. BM25 belongs to the
family of probabilistic information retrieval models, particularly rooted in the
Binary Independence Model (BIM) of probabilistic relevance.

BM25 became a standard for search engines because it offered a practical way to
rank documents by their relevance to a given query, while addressing certain
limitations of earlier models such as TF-IDF (Term Frequency-Inverse Document
Frequency). BM25 is still widely used today in traditional search engines and as
a benchmark for newer retrieval techniques.

#### How BM25 Works

BM25 is based on the principles of TF-IDF, but it introduces important
modifications to make the retrieval process more effective and nuanced. BM25
scores documents based on their relevance to a query using the following
equation:

$$
\text{BM25}(D, Q) = \sum_{q \in Q} \text{IDF}(q) \cdot \frac{f(q, D) \cdot (k_1 + 1)}{f(q, D) + k_1 \cdot \left(1 - b + b \cdot \frac{|D|}{\text{avgdl}}\right)}
$$

Where:

- $D$ is the document.
- $Q$ is the query.
- $f(q,D)$ is the frequency of term qq in document DD. 
- $∣D∣$ is the length of the document (number of words).
- $avgdl$ is the average document length in the corpus.
- $k_1$​ and $b$ are free parameters that control term saturation and length
normalization, respectively.

#### Key Features of BM25

TF Saturation: Unlike TF-IDF, where term frequency (TF) grows linearly with the
number of term occurrences, BM25 uses a non-linear term frequency that
"saturates" after a certain point, meaning that repeated occurrences of the same
term contribute less to the relevance score after a threshold. This prevents
overly long documents from being unfairly ranked higher just because they repeat
query terms more frequently.

Length Normalization: BM25 introduces length normalization using the parameter
bb, which adjusts the relevance score by accounting for the length of documents.
Longer documents naturally tend to include more terms, so BM25 corrects for this
by penalizing longer documents more or less depending on the value of bb.

IDF: Inverse Document Frequency (IDF) plays a crucial role in BM25 by giving
less weight to common terms (that appear in many documents) and more weight to
rare terms that better differentiate documents.

#### Advantages of BM25

Simplicity and Efficiency: BM25 is computationally simple and can be easily
implemented on large-scale search systems.

Tunability: The parameters $k_1$​ and $b$ can be fine-tuned for different
datasets or applications, allowing for flexibility in specific retrieval
environments.

Effectiveness for General Retrieval Tasks: BM25 provides strong performance
across a wide range of text retrieval scenarios, making it a go-to algorithm for
traditional search engines.

#### Limitations of BM25

Lack of Semantic Understanding: BM25 relies purely on term frequencies and
cannot understand the semantic meaning of the words. It treats synonyms or
contextually similar words as completely unrelated, leading to suboptimal
retrieval for queries requiring understanding of semantics.

Ranking by Relevance Only: BM25 ranks documents solely based on term matching,
with no ability to account for relationships between words (e.g., phrases,
n-grams) or understand the actual context in which terms are used.

### Embedding-Based Retrieval Approaches

#### History of Embedding-Based Retrieval

In recent years, advances in deep learning and natural language processing (NLP)
have introduced a paradigm shift in text retrieval through the use of semantic
embeddings. Word embeddings, pioneered by models like Word2Vec (2013), GloVe
(2014), and later contextual embeddings like BERT (2018), enable computers to
understand the meaning of words in context, rather than relying purely on
surface-level word frequencies.

Embeddings map words, phrases, or even entire documents into high-dimensional
vector spaces, where the distance between vectors reflects the semantic
similarity between the terms. This allows retrieval models to account for
synonymy, polysemy (words with multiple meanings), and other linguistic nuances
that traditional models like BM25 cannot capture.

#### How Embedding-Based Retrieval Works

In embedding-based retrieval, documents and queries are represented as dense
vectors in a continuous vector space. Retrieval becomes a task of finding the
most similar vectors (documents) to a given query vector. This is often done
using cosine similarity or other distance metrics.

For example, with a transformer-based model like BERT, both the query and the
documents are encoded into contextualized embeddings. The search engine then
computes the similarity between the query vector and the document vectors,
ranking documents by their proximity in the vector space.

#### Key Features of Embedding-Based Approaches

Semantic Understanding: Embedding models understand the meaning of words in
context, allowing them to retrieve documents even if the exact query terms are
not present but semantically similar terms are. For example, a query containing
"car" can retrieve documents about "automobiles".

Handling Polysemy: Models like BERT dynamically generate different embeddings
for the same word based on its context, effectively handling cases where words
have multiple meanings (e.g., "bank" as a financial institution vs. a
riverbank).

Generalization: Embeddings can generalize beyond the training data and perform
well even in situations where new or rare words are introduced.

#### Advantages of Embedding-Based Retrieval

Semantic Relevance: Embedding-based approaches retrieve documents that are
semantically relevant, even if they don't contain the exact query terms. This
leads to more meaningful results, especially for complex or ambiguous queries.

Contextual Awareness: Contextual embeddings like BERT allow for a deeper
understanding of the text, meaning the system can distinguish between different
meanings of the same word or phrase.

#### Limitations of Embedding-Based Retrieval

Computational Complexity: Embedding-based approaches require significant
computational resources, both during the training phase (for building the
embeddings) and at retrieval time (for calculating similarities between
high-dimensional vectors).

Latency: Given the complexity of embedding-based retrieval, the time it takes to
compute similarities between query and document vectors can be longer than
traditional term-based methods like BM25, particularly for very large datasets.

Interpretability: Unlike BM25, where the scoring mechanism is transparent and
easy to understand, embedding-based retrieval often acts as a "black box,"
making it harder to interpret how and why certain documents are ranked highly.

#### Optimizing Embedding-Based Search

In an embedding-based retrieval system, both the query and documents are transformed into dense vector representations in a high-dimensional space. The goal is to retrieve documents that are "close" to the query in this vector space, typically measured using distance or similarity metrics like cosine similarity or Euclidean distance. However, this process can be computationally expensive, especially when the dataset is large. To optimize search performance, several techniques have been developed to speed up vector retrieval while maintaining accuracy.

##### Query optimization

Because single use user query may miss out on relevant information, available
only through multiple prompt, alternative phrasing or different perspectives on
the same topic.

Generating some more queries from the original makes sense because searching the
database with rewritten query may return a document that would normally be
missed.

##### Multivector Stores

###### What Are Multivector Stores?

A multivector store is an advanced technique that enhances the efficiency of embedding-based retrieval systems by splitting documents into multiple vectors, rather than representing the entire document with a single vector. This approach leverages the fact that documents often contain diverse topics or multiple semantic themes, which may not be captured well by a single vector.

Instead of embedding an entire document into one vector, a multivector store breaks the document into smaller semantic chunks (e.g., paragraphs, sentences, or even smaller n-grams) and represents each chunk with its own vector. These vectors are then stored in the search index. At query time, the system searches across all vectors representing a document and retrieves the most relevant vector chunks rather than relying on a single document-level vector.

###### Why Multivector Stores Work

- **Finer Granularity**: By splitting documents into smaller chunks and storing multiple vectors, multivector stores allow for more granular retrieval. This means that even if only a small section of a document is relevant to the query, it can still be found and retrieved, which improves recall.
    
- **Increased Coverage**: Documents often contain multiple topics, and a single vector might not represent all of them adequately. By using multiple vectors, the system can capture the diversity of topics within a document, leading to better matching with varied queries.
    

###### Challenges and Considerations

While multivector stores improve recall and relevance, they come with trade-offs in terms of storage and computational cost. Storing multiple vectors for each document increases the size of the search index, and retrieving relevant vectors from a larger index can require more processing power. To mitigate these costs, efficient indexing structures and approximate nearest neighbor (ANN) techniques are often used.

##### Hypothetical Question Method

###### What Is the Hypothetical Question Method?

The **hypothetical question method** is an advanced optimization technique that
enhances query understanding by generating synthetic queries or hypothetical
questions based on the content of the documents. The idea is to preemptively
consider what types of queries users might ask and generate corresponding
embedding vectors in advance.

For example, given a document about climate change, the system could generate
hypothetical queries such as "What are the effects of global warming?" or "How
does climate change affect sea levels?" These synthetic queries are then
embedded and stored alongside the document in the index. At query time, instead
of relying solely on matching the user's query with the document's vector, the
system also matches the query with these hypothetical question vectors, which
increases the chances of retrieving relevant documents even if the user's query
does not directly align with the document's original content.

###### Why the Hypothetical Question Method Works

- **Improves Generalization**: Real-world user queries are often highly varied and may not perfectly align with the language used in the documents. By generating synthetic queries, the system can better match the user's intent even if the exact wording is different from the document content.

- **Enhances Semantic Understanding**: Pre-generated hypothetical questions help the system understand different ways a concept might be queried. This increases the likelihood that documents relevant to the query will be retrieved, improving both recall and precision.

###### Challenges and Considerations

The hypothetical question method is computationally expensive because it
requires generating, embedding, and storing many synthetic queries for each
document. This increases both the indexing time and the storage requirements.
Additionally, generating high-quality hypothetical queries requires
sophisticated natural language processing (NLP) techniques, which may not always
generate the most useful or relevant questions.

##### RAPTOR Indexing

**RAPTOR (Recursive Abstractive Processing for Tree-Organized Retrieval)** is an
advanced approach to optimizing search and retrieval in large-scale,
embedding-based systems. The key idea behind RAPTOR is to structure the
documents hierarchically, enabling efficient recursive matching and retrieval by
organizing the data into tree-like structures. This recursive and hierarchical
organization makes RAPTOR particularly well-suited for data sets that we want
to describe aside from retrieve information from. Questions like "what kind of information can I find in this document" or "what is this document about" is very 
easy with this schema because there already exists a tree of summaries done 
during indexing.

###### Overview of RAPTOR Indexing

The primary goal of RAPTOR is to enable faster and more accurate search in
embedding-based systems by structuring the document into a tree-like structure.
RAPTOR combines the power of hierarchical indexing with abstractive processing,
where each node in the tree represents an abstraction or summary of the nodes
(documents or query fragments) beneath it. This allows the system to perform
recursive searches that progressively zoom in on the most relevant parts of the
index.

###### Key Components of RAPTOR

- Recursive Processing: Queries are processed recursively, starting from the
leaf-level abstractions and moving up the tree structure, refining the search at
each level. Each level in the hierarchy represents more abstract version of the
document space.

- Tree-Organized Index: RAPTOR organizes documents and their embeddings in a
tree-like structure, where nodes closer to the root represent broader, more
generalized topics or abstractions, while deeper nodes represent more specific
content. This allows for efficient narrowing of the search space by eliminating
irrelevant branches early on.

- Abstractive Summarization: RAPTOR leverages abstractive summarization
techniques to generate compact and meaningful representations of documents at
each node in the tree. 

### Hybrid Approaches

In practice, many modern search engines combine BM25 with embedding-based
retrieval to get the best of both worlds. A common hybrid approach involves
using BM25 to quickly retrieve a set of candidate documents, and then re-ranking
those documents using embeddings for semantic relevance. This approach balances
the computational efficiency of BM25 with the semantic richness of embeddings,
delivering both speed and accuracy.

### Conclusion

Indexing text files for efficient retrieval has evolved from basic term-based
approaches to sophisticated algorithms that can understand the semantics of
text. BM25 remains a staple in many traditional search systems due to its
simplicity, tunability, and speed, but its limitations in handling synonymy and
context have led to the rise of embedding-based methods. Embeddings offer a
powerful way to capture the meaning of words and phrases, but they come at the
cost of computational overhead and interpretability. By blending both
approaches, modern systems can leverage the strengths of each to provide fast,
accurate, and semantically aware retrieval results.

For now, I will try my best to implement the more pure embedding search. 
This is done primarily as a measure that tries to limit the complexity, but also
because the database will be mostly static and costly initial indexing is a small
part to overall performance. Matter of fact, since the intended use is mostly static, 
it makes sense to do as much as possible to maximize query performance. 

The end goal of the state of the art indexing would be described by the following:

0. **Chunk the Document**: Begin by splitting the document into smaller, meaningful chunks. Each chunk should be surrounded by its surrounding context for better understanding.
0. **Generate Hypothetical Questions**: Use a Large Language Model (LLM) to generate hypothetical questions for each chunk. These questions should be designed as if the chunk is providing answers to them.
0. **Embed and Store Questions**: Convert the generated hypothetical questions into embeddings. Store these embeddings as pointers to their corresponding chunks for efficient retrieval.
0. **Group Related Chunks**: Group the most semantically similar chunks based on a threshold similarity measure (rather than a fixed number of closest chunks). This ensures that only closely related chunks are grouped together.
0. **Summarize Grouped Chunks**: Create a summary of each group of related chunks, capturing the main points and themes from the group.
0. **Generate Hypothetical Questions for Summaries**: For each summary generated in the previous step, generate additional hypothetical questions using the LLM. These new questions will be used for further grouping and retrieval.
0. **Recursive Grouping and Summarization**: Continue grouping the summaries based on their similarity, and generate new summaries and hypothetical questions. This process is repeated recursively.
0. **Set Recursion Limits**: The recursion continues until either a maximum recursion level is reached or the entire document has been summarized into one final summary.

## Storing the index result

After indexing, we need to store the result in some form.
Our requirements include:

1. Ability to restore the result after program termination
2. Ability to query the result in a way that result in fast lookup
3. Option to scale to large number of files without too big performance hit
4. Cost of operation shall not be too high.

Last point, referring to the price is quite subjective and for now we should not
focus on it too much. Idea is to always have an option to pivot to a cheaper
solution.

There are couple of options that satisfy most of the criteria

### Storing result in memory

In some cases there is no need to store the results in a persistent form.
Persistent storage will always add complexity as well as cost.
Additionally, having all data in memory results in a significantly faster responses.
For small scale application, rerunning the index may be easier and/or cheaper
than any other solution.
On program shutdown we will loose data, but in today's age of highly reliable
systems it is both rare as well as likely not a big problem.
Of course, this solution puts a natural limit to the achievable scale. With a high number of files as well as all metadata and indexing it is difficult to grow past some initial steps.
Finally, this configuration may not perform optimally either as a desktop application or as a cloud-hosted service. This is because in desktop environment, different computers have different size of RAM memory which means that for some the program will run well even in medium scale, but for some, the program will not be able to achieve that. In the cloud-hosted environment on the other hand, where all parameters are fully controlled, we have to pay more for bigger and bigger machines. What is more it is difficult to transfer running programs from small machine to bigger one so it would be common to either face storage limit or be forced to pay extra even tho we will not use the space. 

All in all, the severe lack of built in fault tolerance combined with no support
for auto-scaling resulting in unoptimal resource utilization makes this solution
unsuitable for most serious, large scale and complex applications.
However, it is a good solution for testing and research environments or for a
small, low priority projects or projects that do not require complex parsing and
indexing pipelines to load the knowledge into knowledge base.
Applications where response time is crucial will also benefit from this solution.

2. We could save the result to a database according to some schema that makes it easy to query etc. Then we could store ALL data in one db provider which is nice. Also, CRUD operations are VERY reliable.
3. We could save all chunks and summaries to some file storage and only store the embeddings in a dedicated vector storage. Then, we have an easily inspect-able database that can be stored in a cheap way as well as have massively fast lookup to the embedding vectors.

### Storing result in a database

Storing all results inside a database by far, the most intuitive solution. 
Problems of storing data in a proper way have been studied and continuously
improved upon resulting in managed solutions that fit our criteria perfectly. 
All operations are done with fault tolerance and performance in mind. 
Resources are utilized fully, but are not wasted. With advances in vertical scaling
we can theoretically fit practically infinite amount of knowledge into our
knowledge base. Furthermore, there are many resources and tools available to us
that can assist in the development and the release stages of the project.
We have capability to define a rigid definition that keeps our data in a valid
state at all times, but also have an option to make a loose structure that allows 
for quick iteration.
Last but not least, all data management can be done in one system, making it 
easy and convenient.

### Storing result in a hybrid file/vector-db store

Because, data we are storing is primarily text, with optional metadata and and
index allowing us to find information quickly, we can use perhaps simplest option
available and store data directly in a filesystem of the host. 
Since our index is just an embedding, we can also use a special database
paradime called vector database, where all internal representations are optimised
for storing and doing numerical calculations on a vector.

We could save a file to some filename and then store this filename in a vector
db in embedding-filename pair. Later, during lookup, we could calculate the
difference to the embedding of the question and get all filenames associated
with the vectors that are the closest to the embedding. After that, we can open
and read files with those filepaths and return them to the user.

This approach has some clear upsides. Since most of our data is in a raw file
format, we can not only use cheapest form of storage but also leverage tiered
caching and I/O level optimizations (for example returning the files directly
from disk reducing strain on the CPU). What is more, we can are leveraging the
efficiency of the optimized vector data base meaning that we can achieve better
query times.

However, this is not as convenient as the option of using a database. We have to
manage the state more. Also, we are prone to more errors resulting from a drift in
file system state and the links of the database that are pointing to the files. 
Additional fields like metadata are also not easy to query as we either need to link 
the data by filename or use special formatting to make the data available in one 
place. Last but not least, this solution is difficult to inspect due to lack of pre-build
tools. While most difficult parts of the program are already developed and available
(File system and vector-store) I still would need to write my own tools to do most 
basic tasks.

Unfortunately, for now, the drawbacks outweigh the advantages of this solution.
Since during the planning phase I created couple of possible 
#### Proposition for a file with metadata
One implementation of storing metadata directly inside a file would be to use
the YAML-formatted metadata standard. This means that the metadata will be at
the top of the file and will be a key-value pair. To get the file content one
has to find the start and end `---` blocks and then skip one empty line.

Matter of fact, the entire thing can be a rather simple regex:
```perl
/(?:---\s*\n(.*?)---\s*\n)?(.*)/s
```

Explanation:

- `(?: ... )`: This is a non-capturing group that wraps the optional metadata section.
- `---\s*\n`: Matches the --- followed by any optional spaces and a newline (\n), which indicates the start of the metadata.
- `(.*?)`: Capturing group 1. This matches the metadata section lazily (.*?), ensuring that it captures everything between the two --- lines.
- `---\s*\n`: Matches the second --- with optional spaces and a newline, marking the end of the metadata section.
- `?`: Makes the whole metadata block optional.
- `(.*)`: Capturing group 2. This matches the rest of the file content after the metadata section (or from the start if metadata is absent). The s flag ensures that this captures across multiple lines.


Some metadata at the top and "foo bar baz" as the content of the file
```notepad
# ./file_index/chunked/foo.txt
---
Title: foo.txt
Author: Krzysztof Watras
Comment: |
     This is a multiline comment.

     I do not know if this is exactly what I want but is certainly easiest to
     implement and is a solid default.
---

foo bar baz
```

#### Proposed file storage tree 

Because we want to store as much of the data in plain files this could be enough:
```bash
file_index
├── source
│   ├── foo.pdf
│   ├── bar.docx
│   ├── baz.pptx
│   ├── README.md
│   ├── index.html
│   ├── main.py
│   └── ...
└── chunked
    ├── foo.pdf
    |   ├── meta.json
    |   ├── chunk1.md
    |   ├── chunk2.md
    |   ├── summary1.md
    |   └── ...
    ├── bar.docx
    |   ├── meta.json
    |   ├── chunk1.md
    |   ├── chunk2.md
    |   ├── summary1.md
    |   └── ...
    ├── baz.pptx
    |   ├── meta.json
    |   ├── chunk1.md
    |   ├── chunk2.md
    |   ├── summary1.md
    |   └── ...
    └── ...
```

In here, the summary is easy to differ from the chunks by the name it self. File
wide metadata is shared in the `meta.json` file. 
This would still be easily human-readible allowing to inspect the state with
more tools.

An easier alternative is to make a flat structure like this:

```shell
file_index
├── source
│   ├── foo.pdf
│   ├── bar.docx
│   ├── baz.pptx
│   ├── README.md
│   ├── index.html
│   ├── main.py
│   └── ...
└── chunked
    ├── 1pHPfXYm.md
    ├── Yeehe8yt.md
    ├── m6tdOfpw.md
    ├── PXD49QMS.md
    ├── qP8WSahu.md
    ├── xHcHUi2R.md
    ├── 7bvIHYpF.md
    └── QgItA36j.md
```

Files are stored in a flat directory of files that are text and have random
string for a name. Here, inspectability aspect is lesser but still available after
tools for this solution are written. However, here the metadata inside the file 
stops being optional (we can no longer remove knowledge from our database
since we do not know the name of the file the chunk belongs to)

### Chosen direction

Despite the fact that storing files in a hybrid form is the most performance and
cost oriented solution, it is also most labor intensive. There are currently no 
tools that I could leverage and it would be easy for me to introduce errors or 
forget useful features when I would write my own.

Because of that,  I choose the SQL database solution as it will allow me to test
different ideas quickly and without need to worry too much about the lowest
level execution details. Of course, it is possible that in the future I need the
extra performance. In that case, it is still possible to pivot to a more direct
approach.

## Returning query relevant results

Once the text indexing is done, finding most relevant information is quite
straight forward. It can be done by following algorithm:

1. Generate N new queries from original query (context will help)
2. Embed all queries
3. Perform distance search to find closest vectors in the vector space
4. Sort result and limit to N closest vectors 
5. Return N relevant documents

(here, it is possible that there is more than one question that is close enough
pointing to the same document, in this case just ignore it such that we return N
*unique* mappings to return N most relevant documents)