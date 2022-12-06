# Optimization

## Steps to optimize your code

1. Determine if your code needs optimization
The most important step in optimizing your code is to know if you need to. Remember: code optimization often makes it harder to read or develop your code. Also: Know what you are optimizing for!

2. Make sure that optimization is worth the trouble!
When you determined that optimizations is needed make sure it is worth it! Sometimes the effort is so big you might just as well suffer a bit and wait just a bit longer

3. Before you start: do code profiling!!! 
It's perhaps the most important part of this whole article. You cannot optimize what you don't understand! Without proper profiling you will just guess what is faster and what should be done better.

4. Do extensive tests for your code!
When you optimize code it's very important you don't break it in the process! Fast code is useless if it doesn't do what it should!
If you already were using Test Driven Development (TDD) to develop code then it's easy. If not then tests should be implemented long-term anyway so it's good practice to start now.

Only when we went through those points can we proceed to actually optimize!
1. Is the work you are currently doing actually needed/ the right way to solve problem
`There is nothing so useless as doing efficiently that which should not be done at all. - Peter Drucker`
It may be tempting to make your current solution more efficient, integrate workflow into larger context or make production more specialised. However, what if you are solving wrong problem?
What often halps is drawing entire hotpath of your code with all it's paths and branches. Often it's immediately obvious what is not needed or what is to be refactored. By remember that sometimes you may need to start all over again. Maybe there is solution so different that in order to be "better" you need to start over and do work in complete different way? 🤔

2. Some problems are structural but sometimes it's algorithms and datastructures that are to blame.
You may find that your general solution is correct but base components are doing work in an inefficient manner. Follow Data Driven Development techniques to optimize it and look for algorithms that work better ie. reduce time/space complexity and data structures allow for efficient read/write/updates.

3. Data flow of your program is perhaps the most crucial part of the performance focused design.
In today's world you will often find that utilizing better cashe is the way to go. Because we have much memory instead of doing same work twice we can just remember what we did previously. Also, try to limit the size of the structures you are iterating trough as it'll allow for more cashe hits and overall faster programs.

4. Is your problem easily solved by adding more compute power/memory?
Often problem is easily solved by just throwing more compute power into the problem. Specially when you deal with "black box" subprograms or aplications (like games), then you simply cannot make it work faster besides giving it faster CPU or more RAM. Maybe try to overclock the processors or allow them to enter longer boost phases.
Side note: this point also highlights that best algorithms are the ones that can laverage more power rather that be able to do without them.
TLDR: some problems are already on the bleading edge of what can be done with given hardware. It's often way faster (and so cheaper) to just replace current hardware with faster one.

5. When you are desperate - limit number of other processes running on the same machine.

When it's impossible/expensive to have more compute power you can limit work you do on the same hardware. Other programs will polute your cashe and cause kernel switches which will kill our performence. 
