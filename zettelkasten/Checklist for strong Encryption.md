[[Encryption]]
# Checklist for strong Encryption
- [ ] The [[Ciphertext]] should not be intercepted. 
- [ ] Content of the [[Ciphertext]] should not be deducible
- [ ] 


## Intuition
### The [[Ciphertext]] should not be intercepted. 
This is often not satisfied, and even on a secure web where we trust each machine there should be some way to disable users from access above their privileges

### Content of the [[Ciphertext]] should not be deducible
Very often with weak encryption we can see that original message can be deduced without knowing the decryption key or even the decryption algorithm altogether. 
On the other hand even with primitive encryption we often can get away with sending short messages if the decryption key stays unknown. 
