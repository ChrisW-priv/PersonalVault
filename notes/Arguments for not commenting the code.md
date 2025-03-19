---
title: "Arguments for not commenting the code"
date: 2025-02-14
description: "This note discusses the rationale against using comments in code and emphasizes code clarity over commentary."
tags: [] 
categories: 
  - "zettelkasten"
---

Part of [Code quality](Code%20quality)

**Q: Why should code not rely on comments for explanation?**  
A: If code needs a comment, it is a sign that the code should be refactored instead. Comments often become outdated, and maintaining both code and comments can lead to confusion.

**Q: What is the reliability of code versus comments?**  
A: Comments can mislead readers, whereas code remains a truthful representation of functionality. Therefore, code should speak for itself whenever possible.

**Q: What tools are available to verify code functionality?**  
A: To ensure code works correctly, developers have compilers, linters, and tests at their disposal. There is no tool equivalent for verifying the correctness of comments.

**Q: How do types contribute to code clarity?**  
A: Types are significantly better at enforcing proper state than comments, as they provide a clear specification on what kind of data is being handled.

See [Naming conventions in code](Naming%20conventions%20in%20code.md) for examples of how types enhance clarity.

**Q: How is code documentation different from comments?**  
A: Documentation serves a different purpose—guiding users through how to use the code written. It provides context and sets expectations for the code's functionality.

**Exceptions to the rule:**
- Non-obvious performance optimizations.
- References to mathematical and algorithmic notes.