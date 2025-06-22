---
title: LLM Presentation (EXAM)
description: ""
date: 2025-06-21
tags: []
categories:
  - zettelkasten
draft: true
---

### **Slide 1 – Title Slide**

> “Good morning.
> My name is Krzysztof Watras, and today I’ll be presenting my diploma project on *Developing an LLM-Powered Personal Assistant*.

---

### **Slide 2 – Agenda**

> Here’s what I’ll cover:

1. First of all why do we even need to develop a personal assistant,
2. and what are the requirements that we identified at an early stage?
3. Then, what were the challenges I faced during the development?
4. And finally, an overview of the results.

---

### **Slide 3 – Why develop a personal assistant?**

> “The reason for developing a personal assistant is: 
> in day to day life, there are a lot of tasks that need to be done.
> Some of them are really not complicated, but take time.
> By developing an assistant, we wanted to allow user to focus on strategic tasks, 
> and thus, scale their personal impact
> After all, a digital assistant can perform actions on our behalf, 
> faster and at consistent quality and format.
> It could also boost our learning abilities by creating lectures 
> and micro-quizzes for new topics,
> making notes on what we have learned, as well as generate flashcards 
> for long-term memory retention, thus using science to learn not only faster but smarter

---

### **Slide 4 – Requirements for Our Implementation**

> At the early stage we identified the features we wanted, those are:

* First of all, understanding the user’s intent.
* Then, it has to *act on the user’s behalf*, whether by retrieving data, reasoning over problems or performing tasks on user's behalf.
* The assistant should *communicate results clearly*—via text or interface.
* It should also be platform independent.
* Finally, because this is meant as a personal assistant, we needed a solid authentication and access control schemes.

---

### **Slide 5 – Our App Feature Set**

> Based on those requirements, we developed the system that is able to:

* Answer questions and execute functions
* Process files asynchronously, in en event driven fashion
* Stream responses in real-time using Server-Side Events.
* Role-based access control over users and user groups as well as features and feature groups (including files).
* On a more technical side: we cared about developer productivity
    * Developed fast and thus cheap CI pipelines
    * Used modern virtual environment management
    * Had 80%+ test coverage such that,
        * We do not over-burden ourselves with testing, making sure that everything works, 
        * but also validating that system redesign does not break intended behavior.

---

### **Slide 6 – Key Challenges During Development**

> This project was not without its challenges.

* First was designing and deploying the system reliably to the cloud. While the implementation was familiar, the nature of cloud forced me to adapt to different pattern of problem solving.
* Secondly, Ensuring LLM responses are trustworthy and free from hallucinations was difficult as LLM is a fundamentally a probabilistic model.
* Also, Debugging issues in a deployed asynchronous environment was especially tough.
* Lastly, I had to conduct a lot of *experimentation on system performance* to make sure everything runs smoothly.

---

### **Slide 7 – Deployed Architecture**

> Here’s a high-level view of the deployed architecture:

* The user interacts via web or mobile front-end.
* Requests go to a Django app running on Cloud Run.
* The app coordinates with Cloud SQL and Cloud Storage, and sends queries to the OpenAI API.
* Background tasks like file processing are handled via Cloud Jobs.
  As you can see this architecture is really scalable, allows for real-time performance, and integration with knowledge bases that are dynamic.

---

### **Slide 8 – Chat Interface**

> Here you can see the example chat interface I developed for the company I work at,
> This system is used by that company for the past 5 months and successfully answers user questions.

---

### **Slide 9 – Conclusions**

> To sum up:
> We built and successfully deployed an LLM-powered assistant with core functionalities.
> While the application already uses modern tools and features, there’s still room for improvement,
> especially in the *AI reasoning pipeline* and in adding more tools available to the user.

---

### **Slide 10 – Demo**

> “Now I’ll show you a live demo of the assistant in action.
> We’ll walk through a few typical use cases to see how it performs in real time.”
