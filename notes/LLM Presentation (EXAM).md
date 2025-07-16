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
2. and what are the requirements that I identified at an early stage?
3. Then, what were the challenges I faced during the development?
4. And finally, an overview of the results.

---

### **Slide 3 – Why develop a personal assistant?**

> “The reason for developing a personal assistant is: 
> in day to day life, there are a lot of tasks that need to be done.
> Some of them are really not complicated, but take time. 
> Traditionally, this was solved by employing other human to do them.
> The benefit, is less burden of manual labor, allowing to focus on strategy.
> However, this is not only finacially unavailable to many, but also unsustainable.
> At some point there have to be people that have assistants or are assistants.
> I wanted to solve this by replicating the human using a machine, thus, making it more accessible and sustainable. 

---

### **Slide 4 – Requirements for Our Implementation**

> At the early stage I identified the features I wanted, those are:

* First of all, understanding the user’s intent.
* Then, the ability to *act on the user’s behalf*, whether by 
    * retrieving data, 
    * reasoning over problems or 
    * performing tasks on user's behalf.
* The assistant should then be able to  *communicate results clearly*
* The Application should also be platform independent. In particular, I wanted the ability to do not only web interface, but also access it from mobile phone or even smartwatch. 
* Finally, because this is meant as a personal assistant, i needed a solid authentication, access control schemes, as well as policies that would make the control more flexible.

---

### **Slide 5 – Our App Feature Set**

> Based on those requirements, i developed the system that is able to:

* Answer questions and execute functions
* Process files asynchronously, in an event driven fashion
* Stream responses in real-time using Server-Side Events.
* Role-based access control over users and user groups as well as features and feature groups (including files).
* On a more technical side: I cared about my productivity, I developed:
    * fast and thus cheap CI pipelines, that, not only checks the code correctness statically and dynamically, but also builds the app using cache from previous builds, and then deployed my app all within 3 minutes.
    * Used modern virtual environment management, and
    * Had 80%+ test coverage such that,
        * I do not over-burden myself with testing, making sure that everything works, 
        * but also validating that system redesign does not break intended behavior.

---

### **Slide 6 – Key Challenges During Development**

> Key Challenges During Development were:

* First, was designing and deploying the system reliably to the cloud. While the implementation was familiar, the nature of cloud forced me to adapt to different pattern of problem solving.
* Secondly, Ensuring LLM responses are trustworthy and free from hallucinations was difficult as LLM is a fundamentally a probabilistic model.
* Also, Debugging issues in a deployed asynchronous environment was especially tough.
* Finally, I had to conduct a lot of *experimentation on system performance* to make sure everything runs smoothly, but also optimise results, which was not trivial due to scale and cloud deployment.

I **was** able to overcome those issues and on **this** slide you can see a high level view of the final architecture 

---

### **Slide 7 – Deployed Architecture**

* The user interacts with some frontend be it web or mobile, could be a smartwatch.
* Requests from the frontend are sent to an exposed Django server hosted as Cloud Run service.
* That server has 2 primary functions. 
    * Allowing admin management of feature access, user management etc.
    * but also handle the user's requests.
- In case of uploading new files, the file itself is stored on the Cloud Storage and the task of processing that file is enqueued on the Celery Queue hosted on the PostgreSQL Database. The tasks are later handled by the Cloud Jobs spawned on demand.
- In case of the user request, the server accesses the knowledge stored in the Knowledge Database, here, also a Postgres DB, creates a prompt and sends request to the OpenAI. Finally, it streams the response to the user.
  
As you can see this architecture is really scalable, allows for real-time performance, and knowledge base is dynamic, updating in real time.

---

### **Slide 8 – Chat Interface**

> An example of a frontend interface can be seen here
> This is a chat interface I developed for the company I work at,
> This system is used by that company for the past 5 months and successfully answers questions from sales partners.
> The attached conversation, you can see the conversation starts in polish, but then example question is in English.
> Question on the difference between tariff c12a and c12b is answered based on an information from uploaded file.
> The files content are made available to the user, again, dynamically.
> We could just as easily add new files as remove access to old versions.

---

### **Slide 9 – Conclusions**

> To sum up:
> I built and successfully deployed an LLM-powered assistant with core functionalities.
> While the application already uses modern tools and features, there’s still room for improvement,
> especially in the *AI reasoning pipeline* and in adding more tools available to the user.

---

### **Slide 10 – Demo**

> “Now I’ll show you a live demo of the assistant in action.
> We’ll walk through a few typical use cases to see how it performs in real time.”
