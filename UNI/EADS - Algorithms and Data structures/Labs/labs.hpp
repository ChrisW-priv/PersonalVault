template<typename key, typename info>
class sllist{
    struct node{
        key _key;
        info _info;
        node* _next;
    };

    node* head;
public:
    ///methods to make out container useful ...///
};


template<typename key, typename info>
class dictionary{
    sllist<key, info> store;

public:
    ///methods to make out dictionary useful ...///
};


dictionary<key, info> join(const dictionary<key,info>& first, const dictionary<key,info>& second);
