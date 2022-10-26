# Double Buffer method
## Definition
In computer science it's a method using 2 buffers of the same size to incorporate easier/more robust read/write methods. In principal, one buffer is used for read and the other for write. After needed computation buffers are swapped and process is repeated.

Commonly use in graphics rendering and state-based simulations.

## Common problems
### Rotating buffers
#### When this happens?
In a case that we write to "next" buffer **only** if condition is met we can get to a point where condition was true on last iteration but is never true after. Then we gat continously swiching 2 state cell.

#### Solution:
There are couple of solutions:
1. We allways call "match buffers" method at the end of iteration.
To ensure that all data of "next" and "current" is syncronised we can use "match buffers" method. This however is stupid - we throw all efficiency we gained out of the window and add more work to the runtime. resort to this only when desperate!

2. Allways write the current state to "next" array. 
This makes sense because in sims we often work with "based on state check if state changes" logic. Then we write to "next" if we indeed need to change the state of the cell.
Therefore we can rewrite this such that is no chage of state is detected we still write current state to "next". This does not impact performance much (we even can get rid of branch prediction part)

## Code
Code part is under #TODO  but we already have some code in local file system on laptop. It still needs work cuz it's dynamic where it could be more static but the basics are set.

What we have:

```c++

#ifndef DOUBLE_BUFFER_DOUBLE_BUFFER_H  
#define DOUBLE_BUFFER_DOUBLE_BUFFER_H  

#include <memory>  
  
template<class T, size_t N>  
class DoubleBuffer{  
    std::unique_ptr<T[]> current{new T[N]};  
    std::unique_ptr<T[]> next{new T[N]};  
    typedef T* iterator;  
    typedef const T* const_iterator;  
  
public:  
    DoubleBuffer(){  
        size_t i=0;  
        while (i<N) current[i++] = T{};  
        match_buffers();  
    }  
  
    DoubleBuffer(DoubleBuffer const &other){  
        size_t i=0;  
        while (i<N){  
            current[i] = other.current[i];  
            ++i;  
        }  
        i=0;  
        while (i<N){  
            next[i] = other.next[i];  
            ++i;  
        }  
    }  
  
    template<class Iter>  
    DoubleBuffer(Iter begin, Iter end){  
        size_t i=0;  
        while (begin != end) {  
            current[i] = *begin;  
            ++begin; ++i;  
        }  
        match_buffers();  
    }  
  
    void swap_buffers(){  
        next.swap(current);  
    }  
  
    void match_buffers(){  
        size_t i=0;  
        while (i<N){  
            next[i] = current[i];  
            ++i;  
        }  
    }  
  
    T& operator[](size_t index){  
        return current[index];  
    }  
  
    // iterators for range base loops  
    iterator begin() { return &current[0]; }  
    const_iterator begin() const { return &current[0]; }  
    iterator end() { return &current[N]; }  
    const_iterator end() const { return &current[N]; }  
};  
  
#endif //DOUBLE_BUFFER_DOUBLE_BUFFER_H
```
