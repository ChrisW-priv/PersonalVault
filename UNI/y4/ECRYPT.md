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
$Z$ - ints
$a = b (mod\ n), n \in N, n \geq 2$ 
$a = q_1 n + r_1$
$b = q_2 n + r_1$
if $r_1$ and $r_2$ ??? then $a \wedge b$ are Congrent

Theorem on div uniqness
if $a \in Z \wedge |b| > 0$, 
then there is unique $q \in Z$ and $r \in N, r \in Z_n$
that $a = qb + r$
$q$ is a partial quotient

Fact: Congrence is an [Equivalence Relation](zettelkasten/Equivalence%20Relation.md)

if $a,b,c,d \in Z; a \equiv b (mod\ n); c \equiv d(mod\ n); n \in N;n \geq 2$
then $a c \equiv b d (mod\ n)$

Groups
$(G, \circ)$ - monolith set
1. monoid 
2. $\forall_{a \in G} \exists_{a^{-1} \in G} a^{-1}a = aa^{-1} = 1$ - all elements have their inverse 
3. [Associativity](zettelkasten/Associative%20binary%20property.md)
4. $\forall_{a \in G} \exists_{e \in G} ae = ea = a$ - exists identity

if $|G|$ is finate -> group is finite

[Communicative binary property](zettelkasten/Communicative%20binary%20property.md) was mentioned here

Ring $Z_n; n \in N; n \geq 2$
$(Z_n, \oplus_n)$ - addition mod n

def ring
1. it is an Abelian set $(P, \oplus)$; $|P| > 0$; $\oplus$ - some 2 arg operator
2. operations are [communicative](zettelkasten/Communicative%20binary%20property.md)
3. operations are [distributive](zettelkasten/Distributive%20binary%20property.md)
4. there exists identity

def field
1. $(F, \oplus, \otimes)$; $|F| \geq 2$
2. operations are [communicative](zettelkasten/Communicative%20binary%20property.md)
3. elements have inverse
Examples: $(R, \otimes, \oplus), (C, \otimes, \oplus), (Z_p, \otimes, \oplus)$

Euler function
$\varphi: N \rightarrow N$
$\varphi(1) =^{dt} 1$
$\varphi(n) = \# \{k \in Z_n: GCD(k, n) = 1\}$
$N = {1,2,\dots}$
$N_0 = {0,1,2,\dots}$

relative prime = coprime
$\varphi(p^k) = (p-1)p^{k-1}$

Theorem
if $a,b \in N \wedge GCD(a, b) = 1$
then $\varphi(ab) = \varphi(a) \varphi(b)$

$n = p_1^{k_1} \times p_2^{k_2} \times \dots \times p_r^{k_r}$
Factorization of $n \in N$
$\varphi(n) = (p_1-1)p_1^{k_1-1} \times (p_2-1)p_2^{k_2-1} \times \dots \times (p_r-1)p_r^{k_r-1}$

Euler theorem 
if $n \in N, n \geq 2, GCD(a, n) = 1, a \in N$
then $a^{\varphi(n)} = 1 (mod\ n)$

Proof 
$(G, \circ)$; $G$ is finite, then $\forall_{a \in G} a^{|G|} = 1$

Fact 
$(Z_n^*, \otimes_n)$ is Abeliam group
$Z_n^*$ - multiplicative group

Fermat's theorem were intoduced + diff hellman + Hilberts jail
