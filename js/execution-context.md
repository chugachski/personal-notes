# JS Execution Context
## The environment the current code is being run in

## Links
- https://medium.com/dailyjs/i-never-understood-javascript-closures-9663703368e8
- http://davidshariff.com/blog/what-is-the-execution-context-in-javascript/

## Contexts
- Global, the default environment
- Function, when the flow of execution enters the function body
- Eval, text evaluated inside the internal ```eval``` function

## Execution Context Stack
- The browser interpreter is single threaded - only one thing can happen at one time
- Other actions/events are queued into the stack
- The global context is always at the bottom
- There is only one global context
- There can be infinite function contexts
- Each function call creates a new context
- When a function completes, it gets popped off the stack
- Synchronous execution - wait for completion before moving on

## Execution Context Stages
1. Creation
  - Create the scope chain
  - Create vars, functions and args
  - Determine the value of "this"
2. Activation/Execution
  - Assign values, references to functions and execute code

## Timeline after the program calls a function
1. Create a new execution contest with its own set of vars and value for ```this```
2. The local execution context goes to the top of the stack
  - The function executes and ends when it reaches a closing brace or ```return```
3. The local execution context pops off the stack and sends the return value back to the calling context
  - If there is no return value, ```undefined``` gets sent back
4. The local execution context is destroyed

## Variable Accessibility
1. Function check for the variable in its local execution context
2. Check for the variable in the calling context until all the calling contexts are checked
3. Check in the global context
4. Undefined

## Closures
- Whenever you declare a f'n and assign it to a variable, a *closure* gets stored along with the function definition
- Closures include all the vars that are in scope at the time the f'n was created
