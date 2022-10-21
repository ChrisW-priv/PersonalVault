For given structure:

```c++
template<typename Key, typename Info>
class Sequence{
	struct Node{
		Key key;
		Info info;
		Node* next;
	}

	Node* head;
}
```

We want to list all needed methods:
- Public:
	- construct/destruct/copy operators
	- print()
	- insert_node(key, info)
	- remove_node(key)
	- get_node(key) -> info
	- node_in_list(key) -> true/false
	- get_length() //returns length of the Sequence
	- get_n_occurence(key) -> int //returns number of occurences of key
	- functions for union and intersection (operator+ and operator*)
	- function for checking if one Sequence equal to the other (operator== i operator!=)
	- function for element wise subtraction (operator- )
	- possible to list the elements (operator<< )

- Proposed by teacher:
	- insert(key, info, prev_key, occ=1) 
		- inserts the elements after the key called prev_key, optional occ parameter allows programmer to insert this only after certain number of prev_key occurences

	- wszystkie paramerty MUSZĄ być referencjami a funckje powinny zwracać bool value jeżeli ma sens (np. czy udało się dodać/usunąć element)
	- funkcje pushFront and pushBack jako funkcje dodatanie z przudu i tyłu. Muszą być dwa wskaźniki dla head i tail
	- funkcje popFront i popBack usuwają element bez zwracania wartości 
	- dodane funkcje peekFront/Back zwracają wartości key i info modyfikując argumenty foo(Key& resKey, Info& resInfo)
	- bool getInfo(Info& resInfo, key, occ=1) zamiast get_node(key) i też modyfikuje podane argumenty
	- Move operator, 
