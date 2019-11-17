# Interfaces

## Rules
- Interfaces describe behaviors as opposed to data
- Interfaces store method definitions
- Many go libraries leave the consumer to implement the interfaces they create according to the consumer's needs
- Name an interface by what it does (and just add "er" to the end if possible)
- Structs are the most common ways to implement an interface
  - Any type that can have a method is able to implement an interface
- Interfaces can be composed together
- When implementing an interface using a value type, the implementation method must have value receivers
  - When implementing the interface with a pointer, the methods can be of any receiver type (value or pointer) 
- Best to use many, small interfaces as opposed to large monolithic ones
- Don't export interfaces for types that will be consumed (go requires a vars to be used)
- Do export interfaces for types that will by used by package
- Designing functions and methods that recieve interfaces may make the application more extensible in the future


## Syntax

Using a struct:
```go
func main() {
	var w Writer = ConsoleWriter{} // create var of type Writer and set it to a ConsoleWriter instance
	w.Write([]byte("hello, world")) // calling the Write method based on it's signiture in th interface
}

// interfaces are typically named based on what they do
// agnostic about the nature of the implementation
type Writer interface {
	Write([]byte) (int, error) // Write method that accepts a slice of bytes and returns an int and an error
}

// implement the Writer interface *implicitly*
// this determines how the interface is implemented (where we write to)
type ConsoleWriter struct {}

// define a method on the ConsoleWriter with the same name as on the interface
func (cw ConsoleWriter) Write(data []byte) (int, error) {
	n, err := fmt.Println(string(data)) // convert byte slice to string and print to console
	return n, err
}
```

Using an int:
```go
func main() {
	myInt := IntCounter(0)
	var inc Incrementer = &myInt // use a pointer to myInt object
	for i := 0; i < 10; i++ {
		fmt.Println(inc.Increment())
	}
}

type Incrementor interface {
	Increment() int
}

type IntCounter int // type alias for an integer

func (ic *IntCounter) Increment() int {
	*ic++ // increment the type itself
	return int(*ic)
}
```
