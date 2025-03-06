---
title: "Command pattern"
date: 2025-02-14
description: ""
tags: 
  - "zettlekasten"
categories: []
---

> [!Definition]
> Behavioral [Design pattern](Design%20pattern) used to encapsulate all information needed to perform an action or trigger an event at a later time. 

Note based on "Programowanie gier Wzorce" by Robert Nystrom

> [!Note]
> Following note assumes we write our code in c++. Therefore we choose the
> object oriented approach to solve this. However, it can also be done in
> languages with no oop support via [Closure in code](Closure%20in%20code.md). Here, we stick with oop
> because of poor nested function support in c++.

## Input to command mapping

In [Game design](Game%20design) we need a way to map user input into actual commands. We could hard-code those inputs like this:

```c++
void InputHandler::handleInput(){
	if (isPressed(BUTTON_X)) jump();
	else if (isPressed(BUTTON_Y)) fireGun();
	else if (isPressed(BUTTON_A)) swapWeapon();
	else if (isPressed(BUTTON_B)) lurchIneffectively();
}
```

This does not allow the player to configure the input map as he would like.

What we need is indirection to be able to substitute values freely, even at

runtime. One way to do this is to use new object to represent an action.

```c++
class Command {
public:
	virtual ~Command() {}
	virtual void execute() = 0;
}
```

Next we create a sub-classes for each game action:

```c++
class JumpCommand : public Command {
	virtual void execute() { jump(); }
}
class FireCommand : public Command {
	virtual void execute() { fireGun(); }
}
```

In our code to handle input we hold pointer to each command:

```c++
class InputHandler {
public:
	void handleInput();
private:
	Command* buttonX_;
	Command* buttonY_;
	Command* buttonA_;
	Command* buttonB_;
}
```

Now, code for handling user input:

```c++
void InputHandler::handleInput() {
	if (isPressed(BUTTON_X)) buttonX_->execute();
	else if (isPressed(BUTTON_Y)) buttonY_->execute();
	else if (isPressed(BUTTON_A)) buttonA_->execute();
	else if (isPressed(BUTTON_B)) buttonB_->execute();
}
```

This is a bit limited. We just assumed there are some top level functions that know how to find player avatar and make him do what we want. Instead, let's relax the limitation. Instead of executing functions that find objects on their own, let's pass the object we want to modify. 

```c++
class Command {
public:
	virtual ~Command() {}
	virtual void execute(GameActor&)
}
```

Now we can declare more clear definition:

```c++
class JumpCommand : public Command {
public:
	virtual void execute(GameActor& actor) {
		actor.jump();
	}
}
```

And now, `handleInput` can just pass commands:

```c++
Command* InputHandler::handleInput() {
	if (isPressed(BUTTON_X)) buttonX_;
	if (isPressed(BUTTON_Y)) buttonY_;
	if (isPressed(BUTTON_A)) buttonA_;
	if (isPressed(BUTTON_B)) buttonB_;

	// If nothing is pressed, do nothing
	return nullptr;
}
```

Then somewhere in code execution part:

```c++
Command* command = InputHandler.handleInput();
if (command) {
	command->execute(actor);
}
```

This in principle allows us to let player control ANY actor defined. This also allows us to use AI to simply generate a stream of Commands.

### Recap

To allow dynamic map of input to actions we need to use pointers to functions instead of hard-coded values. 

1. Create new type and make it a base for any command;
2. Create an object that has a map of button to command;
3. Create a function that interprets the input and returns the command pointer;
4. Call function and save result.
5. Execute the command from under the pointer saved in step 4.

## Undo and redo

Assume that each command is already separated into `Command`:

```c++
class MoveUnitCommand : public Command {
public:
	MoveUnitCommand(Unit* unit, int x, int y) : unit(unit), x_(x), y_(y) {}
	virtual void execute() {
		unit_->moveTo(x_, y_);
	}
private:
	Unit* unit_;
	int x_, y_;
};
```

Now, to make it possible to undo `execute` command we need to force the class to implement `undo` operation.

```c++
class Command {
public:
    virtual ~Command() {}
    virtual void execute() = 0;
    virtual void undo() = 0;
};
```

`undo` method is responsible for reverting the changes done by `execute`. In our example it would look like this:

```c++
class MoveUnitCommand : public Command {
public: 
    MoveUnitCommand(Unit* unit, int x, int y) : unit_(unit), x_(x), y_(y), xBefore_(0), yBefore_(0) {}
    virtual void execute() {
        // memorise the state of unit before execution
        xBefore_ = unit_->x();
        yBefore_ = unit_->y();
        unit_->moveTo(x_, y_);
    }

    virtual void undo() {
        unit_->moveTo(xBefore_, yBefore_);
    }

private:
    Unit* unit_;
    int x_, y_;
    int xBefore_, yBefore_;
}
```

Notice, there is more information stored by each move command object. If we want the ability to undo moves, we need to store the information our-self.

Now, we can do an entire array of move commands that we can undo at will. This storage of moves will also allow us to make `replay` feature easily.
