---
title: "LLM"
date: 2025-02-14
description: ""
tags: 
  - "zettlekasten"
categories: []
---

# LLMs

## Intro
This will be based on [this](https://www.youtube.com/watch?v=zjkBMFhNj_g) video. It is a monologe presentation by
Andrzej Karpathy with title "The busy person's guide to LLMs". 

### What is a Large Language Model?
In one of the presentations Andrzej Karpathy gave online, he states that the
process of training the LLM is best described as a compression of input data.

Large Language Model itself is fully contained and represented by 2 files:
parameters file and code to execute the model. While both parts are often open
for anyone to inspect or verify and the code running the model is well
understood, it is the parameters that define the behaviour of the LLM. 

The most common architekture right now is the [LLM Transformer
architecture](LLM%20Transformer%20architecture.md). It gained much popularity
after the [Attention is all you need](../attachments/Attention%20is%20all%20you%20need.pdf) paper published in 2017.

### What is an example scale we talk about?
In the contcrete example of llama2-70b model, the input data was a 10TB of text
that was then processed by 6'000 GPUs for 12 days. This resulted in a 140GB file
with parameters that describe the behaviour of the model.

We are used to interacting with the LLMs through the web interface. However,

### What does the LLM do?
Role of the LLM on a basic level is to predict the next word in a sequence. For
example, given the context of 4 words: "Cat sat on a" the neural network will
compute the result and return word that is most likely to follow, for example
"mat" resulting in "Cat sat on a mat" sequence. In this part, Andrzej again
repeated the importance of the link between prediction and compression. On a
high level, if the LLM predicts what word is followed by other word then it can
be seen a compression algorithm. This, while sounds simple is actually really
powerfull as it forces the algorithm to "learn" a lot about the world.

### How does it work?

In practice, little is known about the actual "how" it works. All types of architectures for LLM are well understood, as
well as the mathematical operations on each stage. We also understand how to make iterative adjustments to the model 
parameters in training phase. However, because the model is so large and the parameters are scattered across so many 
parts, the direct impact of each parameter is not known. We can of course directly measure the behavior, it's just that
we are not sure how all parameters collaborate to yield the result that was returned. 

Empirically, we see that the models build a certain knowledge of the world. Yet, this model is not perfect. In a viral 
example when LLM is queried "Who is Tom Cruise's mother" the model correctly returns information "Mary Lee Pfeiffer". 
However, when we ask "Who is Mary Lee Pfeiffer's son" then the model will either return anwser that is incorrect or say 
it does not know. This example indicates that model holds the information in some kind of directional way where
logically the same statements are not reachible in the same way.

This is all to underline that the models are generaly more of a "inscrutable artifacts" i.e. things that we can say work 
with certain level of probability. They are result of long process of optimisation. This make it very distinct from
other fields of engineering where each part is well understood and can be replaced with other part if the decision is
made to do so.

## Training the assistant

In the first phase, the model is trained on the large amount of text data most commonly being a result of an internet
scrape. This is a phase where the model gets to learn general model of the world. It is a result of high volume but
potentially a low quality input. At this stage we have a model that has a good level of understanding of the words and
has general knowledge on how to build sentances and paragraphs etc. This is usefull, but usually we want to query the
model to respond in a specific way. To do this, we take the base model also called foundational model and fine-tune it
to data we actually will use. The result of the fine-tuned base model is also called assistant model. This is because it
is now trained to perform Question and Anwser style responces instead of just "dreaming" the responces. During the
fine-tuning of the model, the designers may want to include additional, optional stage called comparision learning. This
stage is done as a result of the fact that it is much simpler to compare the anwsers rather than write them by hand, for
example by consulting the field experts. This stage is often refered to as RLHF or Reinforcement Learning from Human
Feedback.

## Current AI landscape

As in other fields of software there is a divide into companies that decide not to share their models and the open
source ones. Two champions of each approach at the time of writing are OpenAI and Meta companies. One way of qualitative
comparision is to create an LLM leaderboard much like in chess. There is an elo rating that determins strength of the
model compared to others. Matches between models are defined as asking the same question is asked to two models and the
better anwser is picked. While the difference is not big, it is clear that proprietary models perform better compared to
opensourced models. 

[TODO: Currently available apps and dev tools]
[TODO: Tool use availability for llm]
[TODO: Multimodality of the AI]
[TODO: system 1 and 2 thinking modes and what could be (ppl get inspired by teaching true inteligence to AI)]
[TODO: self-improvement stage (like in alpha go -> it learned to imitate humans but then surpassed them, now we only
imitate humans in LLMs. -> problem: no clear reward criteria, language is an open problem with many correct solutions)]

## Methods of improving the performance
So far, the performance of the llm can be very easily predicted by only two factors: number of model parameters and the
ammount of text the model is trained on. Thus, we expect more inteligence to arise from just scaling the solution. While
this is not free, it is relatively easy, thus, companies that can afford it will just buy bigger computer and run it for
longer to get better and better results. 

This is not to say that algorithmic improvement is not attempted, only to underline the fact that it is not currently
prioritised as there is no sign of slowdown in yield of current methods.

## Susceptibility to attack
With such a big interest in the field there comes many security concerns to the apps and computers running the AI.
[TODO: describe jailbraking and that there may be hidden prompts in the input data (prompt injection attack).]
[TODO: describe datapoisoning]

## TODO:

Aside from all todos above there are also the following:

- llava topic -> explore learn what it is etc.
- model filetypes -> make a list, compare them etc.
- model architectures -> not just transformer probably so what else
- multimodality -> how to add it to existing models, what are the limitations etc. 
