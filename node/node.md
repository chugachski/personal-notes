# Node.js
### A runtime environment for javascript outside the browser

- Node is a C++ program embedded with the v8 engine, which translates source code to machine code
- Includes modules that allow for capabilities like listening for http requests and accessing the file system
- Non-blocking/asynchronous
  - A node process is a single thread that can handle multiple requests at the same time w/o waiting for completion
  - Asynchronous architecture is potentially more efficient, b/c a new thread isn't required to handle each client's request
  - The above might mean that a new client has to wait on a thread to become available unless more hardware is added
- Node is great for network/data intensive apps and bad for cpu intensive apps

## Flow
1. A thread receives a request to query the db
2. While the query is running, the thread accepts another request for another task
3. When the query completes, it puts the message into an event queue
4. A background process notices the event and processes it

## Global object
- While the browser's runtime has a ```window``` and a ```document``` object, node has the ```global``` object
- Declaring a variable at the top level does not add the variable to the global object
  - Vars are scoped to the file (module) due to the modular system in node (prevents variable clashing)
  - Vars and functions need to be exposed (exported) from a module in order to be used by another

## Module Wrapper Function
- The code in each module is wrapped in a function at runtime (Module Wrapper Function)
- That f'n has the params: exports, require, module, __filename, __dirname

## Exporting from a module
```javascript
module.exports.log = log; // expose the log f'n under the key log
exports.log = log; // can also leave out the `module` part
module.exports = log; // expose just the log f'n
```

## Synchronous vs. asynchronous functions
- Many functions have two versions
- The async forms take a callback function as a final arg to be executed after completion

## Events
- A signal that something has happened
- EventEmitter class is a container for event related methods and props
- use ```on()``` to register a listener for an event
- use ```emit()``` to raise an event of a given type

