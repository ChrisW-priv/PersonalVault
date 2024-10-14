# ECRYPT
Cryptography

## Course rules:

3 tests each 25 pts. 
	He said that he will propose some dates
1 project 25 pts + 5 i dunno for what tho...
90 pts. is a shortpath 
else: exam for 100 pts.

## Lectures

Symbols/Definitions:
$V$ - Alphabet 
	set of all symbols or "coded objects". Symbols can have variable length (like in UTF-8 standard)

$\cdot$ - symbol for concatenation of symbols

word - string of concatenated symbols
	Ex:
	$\alpha = \alpha_1\cdot\alpha_2\cdot\alpha_3$ 

$|\alpha|$ -  Length of string
$\epsilon$ is a special symbol that is defined as empty string
$|\epsilon|=0$ 
$V^+$ all signs other that $\epsilon$ 
$V^+ \cup \epsilon = V^*$ 

$(V^+, \circ)$ is a semigroup
$(V^*, \circ)$ is a [monoid](monoid.md), it is:
1. [associative](zettelkasten/Associative%20binary%20property.md)
2. $\epsilon$ is a unit

Def (code)
$V_1$ - set of coded objects
$k: V_1 \rightarrow V^+$ - k is an injection
$V^n$ is a Cartesian product of all symbols in alphabet $V$ of length $n$

$<n,m> =^d {n, n+1, n+2, \dots, m}$ - all **discrete** numbers from $n$ to $m$ inclusive.

$Q$ - rational numbers
$W$ - radix -> #todo

CODES:
$(M, C, K, E, D)$

$M$ - set of plain text messages
$M \subseteq V^+$; 

$C$ - set of coded messages
$C \subseteq V^+$; 

$K$ - arbitrary set
$E: K \otimes M \rightarrow C$
$D: K \otimes C \rightarrow M$

$\forall_{k_1 \in K} \exists_{k_2 \in K} \forall_{m \in M} D(k_2, E(k_1, m)) = m$  
just some formal definition that for all encryption keys there exists decryption
key, forming a pair that can be used to encrypt/decrypt a plain text message

if $k_1 = k_2$ (or can be inferred easily) 
then: we are dealing with private key system
else: decryption key cannot be inferred so it is a public key system

Some codes mentioned: DES, AES, Mars, Serpent

Block cypher
$M = V^n$
$C = V^n$
(fixed word lengths)

RSA - mentioned heavily - make note #TODO 

$Z_n =^d <0, n-1>$ - just like python range(n) function

$m^e(mod\ n) = c$ - just like $c = \text{pow}(m,e,n)$ in python
$c^d(mod\ n) = m$ - just like $m = \text{pow}(c,d,n)$ in python

Substitution cipher:
$m = m_1 \cdot m_2 \cdot m_3 \cdot \dots \cdot m_n$
$c = f(m_1) \cdot f(m_2) \cdot f(m_3) \cdot \dots \cdot f(m_n)$
$f: A \rightarrow A$ [(bijective)](zettelkasten/Bijective%20function.md)
We could have a $(f_1, f_2, f_3, \dots)$ then it is a poly-alphabetical cipher

$(Z_p, \oplus_p, \otimes_p)$ is a field

$C = A \times M$ 
$C$ is a vector and a coded msg.
$A$ is a matrix key
$M$ is a vector and a plain text msg.

$M = A^{-1} \times C$
if A is a permutation matrix then we denote it by $P$ instead.

we can also add some fixed vector $d$ to make
$C = A \times M + d$ 
$M = A^{-1} \times (C - d)$

Affine cipher (make sure by watching some tutorials but I think it is the one above)

Vernams cipher (classical cipher) (used during cold war)
"ideal cipher"

for each symbol in message we [XOR](zettelkasten/XOR%20gate.md) it with a corresponding key symbol
$c_i = k_i \otimes m_i$ 
$m_i = k_i \otimes c_i$ 

One notation that he included:
$(m_i \otimes k_i) \otimes k_i = m_i \otimes (k_i \otimes k_i) = m_i \otimes (0) = m_i$
It is really obvious if you think about it but he put it on the board so maybe we will have to know this by heart on the tutorial/test?

Congrences