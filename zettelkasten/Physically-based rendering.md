---
title: "Physically-based rendering"
date: 2025-02-14
description: ""
tags: 
  - "zettlekasten"
categories: []
---

Physically-based rendering (PBR) is a rendering technique that aims to simulate the physical interactions of light and materials in a scene as accurately as possible. This is achieved by using realistic models of light transport and material properties, based on the laws of physics, to calculate how light should behave when it hits different surfaces in the scene.

PBR simulates the behavior of light in the real world, including how it reflects off different surfaces, how it scatters through the air, and how it is absorbed and emitted by materials. This allows PBR to create more realistic and believable images than traditional rendering techniques, which often use simplifications and approximations to make the rendering process more efficient.

PBR is commonly used in the entertainment industry, where it is used to create high-quality images and animations for movies, games, and other visual media. It is also used in other fields, such as architecture and product design, where accurate and realistic lighting and materials are important for visualizing designs and concepts.

To use PBR in a rendering engine, you need to have a detailed model of the materials and lighting in the scene, as well as a way to calculate how light should behave when it hits different surfaces. This typically involves using complex algorithms and data structures, such as BRDFs (bidirectional reflectance distribution functions) and BTFs (bidirectional texture functions), to represent the behavior of light and materials. The exact implementation of PBR will vary depending on the specific rendering engine and the requirements of the scene.