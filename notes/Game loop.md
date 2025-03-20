---
categories:
- zettelkasten
date: 2025-02-14
description: No description provided.
tags: []
title: Game loop
---

[Game design](Game%20design)

> [!Definition]
> Removes the dependence of user input and processor speed. Essential part of any program that handles user input.

Note based on "Programowanie gier Wzorce" by Robert Nystrom

## Code

> [!Note]
> In following code I use infinite loops with `while (true)` logic. This is done for simplicity but realistically this is never the case as this does no allow the program termination. Use `while (!done)` and handle `done` flag accordingly.

In the beginning, the only programs that could be interactive where turn-based-like programs with simple loops:

```c++
while (true) {
	char* command = readCommand();
	handleCommand(command);
}
```

Loop like this can work really well for early games like `Colossal Cave Adventure`. This worked because game state does not progress while computer is waiting for user input commands:

```
You stand in front of a derelict building. You hear noise, what do you do?
> Enter the building
You stand inside a building. There are 3 doors in front.
```

This approach will also work really well in a GUI applications as essentially, the loop there is 

```c++
while (true) {
    Event* event = waitForEvent();
    dispatchEvent(event);
}
```

Key difference being the type returned: insead of string of characters we get a pointer to an `Event`.

This is fine, but again, there is no change between events. In modern games we want physics to influence the state and NPC to do some actions and Animations to be performed.

To have all those features we need something more like this:

```c++
while (true) {
    processInput();
    update();
    render();
}
```

This is still terrible for number of reasons but closer to what we need.

Primarely: we do not halt execution for the user input, rather we execute his commands as they appear.

We call `update` to run game simulation forward. We run AI and physics.

Finally, we render changes to the user.

The reason it is bad is the fact that since we do not block execution to wait for commands we need to ask ourself "How fast does it run"?

If it runs fast then the game is fast and smooth. But when it is slow, game is slow.

True execution time and therefore, the user experience is based on 2 factors:

- How much work is there to do?
- How good is our hardware that runs the game?

> [!Notice]
> If someone is playing a zombie defence game then having good computer is
> actually a disadvantage as zombies will run faster toward you and you have
> less time to react. On the other hand, if your hardware is slow, then instead
> of a game you have an interactive slide show.
> Even in turn-based games, things like music and animations should not be halted when user does not provide input.

> [!Remember]
> Game loop is critical for game performance therefore writing it well is crucial to game design.

## Solutions

### Sleep until it is time to work again

One solution to game running too fast is to make the engine halt for a given mount of time.

```c++
while (true) {
    double start = getCurrentTime();
    processInput();
    update();
    render();
    sleep(start + MS_PER_FRAME - getCurrentTime());
}
```

This will prevent the code from running too fast. It will not help us if the game is too slow.

This will cause the game to slow down. 

### Big step, small step

Basicaly, our problem is as follows:

1. Each update moves our game forward some amount.
2. Processing all of it takes a bit of *real* time.
If step 2 is faster than 1 then the game slows down. In other words, if moving game state 16ms forward takes more that 16ms of *real* time then we will not make it.
However, if in one step we could make *larger* step than 16ms then we could update and render the game less often, thus keeping up.

So basicaly, we need to find a way to choose step size proportional to how much of *real* time it took to update the screen.

Something like this:

```c++
double lastTime = getCurrentTime();
while (true) {
    double current = getCurrentTime();
    double elapsed = current - lastTime;
    processInput();
    update(elapsed);
    render();
    lastTime = current;
}
```

This is almost perfect:

- game speed is the same for everyone no matter the hardware
- gamer with faster computers are playing with more smooth experience

This hides one massive problem however. Game is undeterministic and unstable. 

Consider 2 players: Fred is gaming on advanced computer, George uses computer of his grandma.

If there is a bullet flying through game world, state of the bullet on Fred's machiene can be updated more times, thus is susseptible to rounding errors more!

Bullet can therefore end up in different places on 2 machienes given the same input.

### Playing catch-up game

Since the primary strain on time budget is spent in `render` function we can make better loop by taking liberty with *when* to render the state.

```c++
double lastTime = getCurrentTime();
double lag = 0.0;
while (true) {
    double current = getCurrentTime();
    double elapsed = current - lastTime;
    lastTime = current;
    lag += elapsed;
    processInput();

    while (lag >=MS_PER_FRAME) {
        update();
        lag -= MS_PER_FRAME;
    }
    render();
}
```

This allows us to use constant step for each update and only render after certain ammount of time has passed.

Notice however that it is vulnerable to "in between update rendering". If the rendering happens between the updates then there is a problem. Say that there is a bullet on screen. Update will move it to the right. On the second render we would assume the bullet to be in the middle since it is in between updates. But it will still be on the left making the game feel jittery. We can fix this by using the fact that we know exactly how much time has passed since update. Thus, we need:

```c++
render(lag/MS_PER_UPDATE)
```

We use `MS_PER_UPDATE` to normalise values to 0.0-1.0 range. this way, we can do simple "in between state" calculations. 

> [!Notice]
> This is prone to error due to fact that object could have been stopped or slowed down. In that case we need to make corrections. Those corrections are less visible than the tearing however, so we are mostly fine.

## Design decisions

Note that we have skipped much of the details. Mainly, we did not account for:

- vsync with monitor
- multiprocessing
- GPU workloads
Thus, when we finally do decide on putting them in our game loop things will get far more complex.

Main design decisions factors to consider:

### Who is the owner of the loop: we or the platform?

This is often decided for us. If we build a wed browser game then writing the game loop on our own is practically out of the question. Same goes for game engines.

- We use platforms game loop:
	- It is easy. Game loop is handled for us. We just focus on the game.
	- It plays well with host platform. If host needs to do something else or handle some errors, we do not need to do it manually.
	- We loose control of time. Platform calls our code when it decides it is time. It is a problem because many platforms were not build with games in mind.
- We use game engine: (2 sides of the coin)
	- Don't need to write it.
	- Don't get to write it.
- We build our own:
	- Full control
	- Need to handle the platform interface

### How do we handle energy use?

Not an issue 15 years ago when everything was plugged to the wall socket. But now there are mobile devices and laptops to consider.

- Go as fast as possible:
	- Good for us if energy use is not a concern. Then, we get best graphic and performance we ever could. 
	- Will turn mobile devices into heaters and will drain the battery.
- Limit frames per second
	- Whenever the state has been updated and there are some spare cycles to use, we just do nothing for that time.
	- User gets "good enough" experience and battery life will be better.

### How do we control game speed?

Basically, what approach to we choose from all presented in the note so far.
