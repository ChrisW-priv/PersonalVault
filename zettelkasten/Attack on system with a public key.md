# Attack on system with a public key
## Intuition
In a [Asymmetric encryption](Asymmetric%20encryption.md) attackers may want to deduce the [Decryption Key](Decryption%20Key) based on the public [Encryption Key](Encryption%20Key). However to do a brute force search is often unfeasible as the keys are often too big to do a comprehensive search. Instead what we do is we attack the underlying principles of how the key was produced in the first place. 
For example in RSA algorithm we try to do prime number decomposition and however can do it fast enough can break many of the RSA standards.
