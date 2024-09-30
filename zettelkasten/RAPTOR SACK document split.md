# RAPTOR SACK document split 
Split And ChunK generator based on RAPTOR idea for RAG.

[RAPTOR indexing](RAPTOR%20indexing.md)
[RAG](RAG.md)

## Problem

We have some knowledge that is stored in documents and we want to index this
data into a searchable blob of knowledge. 
Let there be 2 outputs:

- pure .md file that has some level of formatting of the data as pure text 
- server instance that one can query over the http protocol 

Make a program that will turn the files provided into chunks, embed them and
allow for easy retrieve by the user on question. 

It would also be nice to be able to get the tree of the summaries ie. the
general self description of the state.
It would also be good to be able to be able to iterate through the KB directly. 

## Overview of Solution 

1. Retrieve all text from the documents.
	1. In case there are images included it may be beneficial to use multi-modality to describe what is in the picture and copy the image with link for easy later access.
2. Split the files into chunks and then build summaries of mostly related chunks and embed the summaries. 
3. Repeat the process until you have only 1 summary or the number of levels has reached threshold.

## Parameters:

- Max tokens that we can embed (max chunk and summary size).
- Max tokens that we can use for the document summary.
- Max iteration stages of the summary creation. default is 2
- Max chunk size - default is 1/3 of LLM context window. But can be smaller.
- Max summary size - default is the min between max embed token and 1/3 of LLM context, but can be set to smaller.

### Explanation of the Limitations:

Summary size cannot be bigger than 1/3 size of the LLM context window
	We need to combine 2 and generate next one so worst case we shall have 3 summaries in the context window.

Chunk size actually cannot be bigger than 1/2 of (LLM context window - summary size).
	We need to be able to combine at least 2 chunks and make summary of both. Summary is a max 1/3 of LLM so: 2/3 - 1/3 = 1/3 LLM context window.

Max iteration must be > 0. if not given then just run until one summary is left.

## Considerations 

We may or may not store the files provided. 

- in case we run the program over some knowledge base - the knowledge base is static and will not go anywhere, all we need is links to be able to access the files directly.
- in case where the user "just uploads the file" then the original file is hard to access - thus even when we make the chunks and the summaries the file may be lost.
- in case where there is more than one knowledge base - either knowledge base will stay there forever but the link is not trivial to do because there will be numerous basis for each.

In the case of pure user land - we have to create our own knowledge base where we store all files shared by external users.
But in general, the idea that there are external links and all that may quickly get out of control.
On the other hand, we need to store the user provided content only in the case of the flaky storage. 

What we can do is to add option "store file copy" with "false" by default that if true will copy the file to designated directory. Else just store the URL to either the file on the disk or the web accessible document. In case the file is not provided, just not store the ref to the original. This however will make it impossible to recalculate for new params in case of model migration.

Let's start by defining this as a web server and only then, once I have the
working box that is self contained try to optimise it for purely local setup.
By optimise I mean that by being able to iterate over FS directly one and store the result in some in-memory representation I could massively speed-up the indexing.

As a design choice I will not allow mixing chunks from different sources. This is because if we want to delete one source, the RAPTOR schema would only allow the deletion of the leaf nodes but the knowledge would still leave in the summaries. 
This means that if the document is scheduled for deletion after removal, entire KB would need an update. That is entire KB would have to be recalculated which is a massive cost compared considering the normal expectation of being able to remove knowledge (either because it is out of date, deemed irrelevant or other reason).

As a final summary there should be a list of all collections of files uploaded and what can be found in each. Matter if it should be defined inside implementation of collection metadata or via some other means is a subject of later discussion.

## Solution

### File insert schema
```json
{
	"url": null|str,
	"filetype": str,
	"file": bytearray,
	"store_copy": false|true,
	"metadata": dictionary
}
```

defaults: 
```json
{
	"url": null,
	"filetype": ".txt",
	"file": [],
	"store_copy": false,
	"metadata": {}
}
```
Edge cases: 

- in case where both url and the filetype is present, only the url part will be
taken into consideration, the filetype will be ignored.
- in case when the store_copy is true the url will be set to the internal url
assigned by internal store. url provided will be ignored in that case, only the
internal one will be used from that point. Url will be returned to user in response body as in:
```json
{
	"url": str
}
```

### File delete 
```json
{
	"url": str
}
```
Url param is the original url provided by user or the url defined internally. Delete will purge all data related to the file.

### File update
In version 1 of the server there shall be no update function. If there is need for update then user shall delete old and upload new in 2 separate steps.

### Internal representation

Due to time constraint during time of write I leave it as #TODO but in general:

- we need file store for the files that need copy as well as resulting splits and chunks of the files. Source files and the internal repr should be separated as much as possible to avoid loss of data or unnecessary compute.
- vector store that will allow the storage of embeddings in a separated form 
- actual server that will accept the input and do stuff that is expected.
