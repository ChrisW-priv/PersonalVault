---
categories: []
date: 2025-02-14
description: No description provided.
tags:
- zettlekasten
title: Checklist for strong Encryption
---

[Encryption](Encryption.md)

- [ ] The [Ciphertext](Ciphertext.md) should not be intercepted. 
- [ ] Content of the [Ciphertext](Ciphertext.md) should not be deducible
- [ ] The [Encryption System](Encryption%20System) should stay unknown to attackers
- [ ] The [Decryption Key](Decryption%20Key) has to remain unknown to the attackers

## Intuition

### The [Ciphertext](Ciphertext.md) should not be intercepted.

This is often not satisfied, and even on a secure web where we trust each machine there should be some way to disable users from access above their privileges

### Content of the [Ciphertext](Ciphertext.md) should not be deducible

Very often with weak encryption we can see that original message can be deduced without knowing the decryption key or even the decryption algorithm altogether. 

On the other hand even with primitive encryption we often can get away with sending short messages if the decryption key stays unknown. This is because attacker has to know when he cracked the encryption and in short enough texts there may be more than one logical answer to the ciphertext representation.

### The [Encryption System](Encryption%20System) should stay unknown to attackers

This is important to keep the communication standards closed. That being said the encryption should not be based solely on this rule. Systems that are truly secure base their strength on the [Encryption System](Encryption%20System) itself.

### The [Decryption Key](Decryption%20Key) has to remain unknown to the attackers

If the Key is deduced in whatever way then the plaintext can be obtained directly and the System is cracked.