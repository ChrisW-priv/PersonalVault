
[link](https://www.removepaywall.com/search?url=https://medium.com/aiguys/prompt-engineering-is-dead-dspy-is-new-paradigm-for-prompting-c80ba3fc4896)

[Prompt engineering](zettelkasten/Prompt%20engineering.md)
[LLM](zettelkasten/LLM.md)

# DSPy

DSPy is **an open-source tool created by Stanford University that "compiles declarative language model calls into self-improving pipelines."** Instead of spending time crafting perfect prompts, DSPy lets you program the AI models directly. This makes AI apps more reliable and easier to scale.

DSPy is an interesting framework aiming to provide a PyTorch like feel in a Language Model application developement.

Link to repo with some nice README.md [here](https://github.com/stanfordnlp/dspy/tree/main?tab=readme-ov-file)

Some main parts of the DSPy:
- Signature
	- I understand it as just a description of what needs to be done.
	- A signature consists of three simple elements:
	    - A minimal description of the sub-task the LM is supposed to solve.
	    - A description of one or more input fields (e.g., input question) that we will give to the LM.
	    - A description of one or more output fields (e.g., the question's answer) that we will expect from the LM.

Example:
```python
class GenerateAnswer(dspy.Signature):
    """Answer questions with short factoid answers."""

    context = dspy.InputField(desc="may contain relevant facts")
    question = dspy.InputField()
    answer = dspy.OutputField(desc="often between 1 and 5 words")
```

- Predictor
	- uses a signature to call LM with some rules. Example:
		- `dspy.Predict` - provides direct Question and Answer
		- `dspy.ChainOfThought` - provides an additional thought or rational before answering Question
	- actually... this inherits from module... 

Example:
```python
generate_answer_with_chain_of_thought = dspy.ChainOfThought(GenerateAnswer)

# Call the predictor on the same input.
pred = generate_answer_with_chain_of_thought(question="what is a good reciepie for late lunch? I want something quick")

# Print the input, the chain of thought, and the prediction.
print(f"Question: {dev_example.question}")
print(f"Thought: {pred.rationale.split('.', 1)[1].strip()}")
print(f"Predicted Answer: {pred.answer}")
```

- Modules
	- stand alone "chains" that actually perform all the work