[[Encryption]]
# Checklist for strong Encryption
- [ ] The [[Ciphertext]] should not be intercepted. 
- [ ] Content of the [[Ciphertext]] should not be deducible
- [ ] The [[Encryption System]] should stay unknown to attackers
- [ ] The [[Decryption Key]] has to remain unknown to the attackers

## Intuition
### The [[Ciphertext]] should not be intercepted. 
This is often not satisfied, and even on a secure web where we trust each machine there should be some way to disable users from access above their privileges

### Content of the [[Ciphertext]] should not be deducible
Very often with weak encryption we can see that original message can be deduced without knowing the decryption key or even the decryption algorithm altogether. 
On the other hand even with primitive encryption we often can get away with sending short messages if the decryption key stays unknown. 

### The [[Encryption System]] should stay unknown to attackers
This is important to keep the communication standards closed. That being said the encryption should not be based solely on this rule. Systems that are truly secure base their strength on the [[Encryption System]] itself.

### The [[Decryption Key]] has to remain unknown to the attackers
If the Key is deduced in whatever way then the plaintext can be obtained directly and the System is cracked.
