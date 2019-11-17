# Go Routines

## Rules and definitions
- Concurrency is the composition of independently executing processes
  - Dealing with lots of things at once
  - Possible when the order of execution doesn't matter
  - Benifit is performance and cost is complexity
- Parallelism is the simultaneous execution of possibly related computations
  - Doing lots of things at once
- A go routine is an abstraction of a thread
  - A thread is a path of execution within a process
  - The runtime includes a scheduler that maps go routines onto the os threads for periods of time
  - Cheap to create and destroy (low overthread)
  - Possible to have a large number of go routines in an app without issues
- The main function executes in a go routine itself
- Best to pass data into go routines by argument and avoid closurses (separate copy of data)
- Make sure you stop completed go routines to avoid memory leaks
- Add the ```-race``` flag to `go build` or `go run`

## Syntax
### Waitgroups
```go
var wg = sync.WaitGroup{} // create a waitgroup object from the sync package to help syncronize go routines

func main() {
	wg.Add(1) // tell the waitgroup to add another go routine 
	go sayHello() // spawn another go routine
	wg.Wait() // exit when the waitgroup count is back to zero
}

func sayHello() {
	fmt.Println("Hello there")
	wg.Done() // decrement the waitgroup count by 1
}
```

### Mutexes
Note: the below code forces the go routines to work like they would single if threaded and is not ideal
```go
var wg = sync.WaitGroup{}
var counter = 0
var m = sync.RWMutex{} // read write mutex; anything can read the data but only one thing can write at a time, provided that nothing is reading

func main() {
	fmt.Printf("Threads: %v\n", runtime.GOMAXPROCS(-1)) // find out the max number of threads available
	for i := 0; i < 10; i++ {
		wg.Add(2)
		m.RLock() // locks need to be outside the context of the go routine
		go sayHello()
		m.Lock()
		go increment()
	}
	wg.Wait()
}

func sayHello() {
	fmt.Printf("Hello #%v\n", counter)
	m.RUnlock() // unlock the read lock
	wg.Done()
}

func increment() { // mutating data in this function
	counter++
	m.Unlock() // unlock the write lock
	wg.Done()
}
```
