# Functions

## Entry point
- Every go application has its entry point in package main
- Within the main package, there must be a function called ```main``` that takes no params and returns no values

## Rules
- Every function begins with the "func" keyword
- Lower case names are internal to the package, upper case names are exported
- Function params can be passed by value or reference
- Passing in pointers is potentially more efficient b/c a new copy isn't made, especially with large collections
- There can only be one variadic parameter which is appears last

## Function parameters
Verbose:
```go
func add(x int, y int) int {
	return x + y
}
```

When the params are both of the same type, can shorten to:
```go
func add(x, y int) int {
	return x + y
}
```

## Function Return
Multiple return values:
```go
func swap(x, y string) (string, string) { // describe the types for two return values after the params
	return y, x
}

func main() {
	a, b := swap("hello", "world") // assign the two return values to vars
	fmt.Println(a, b)
}
```

Returning an error as a second return value:
```go
func main() {
	d, err := divide(10.0, 0.0) // second param will generate a bad result
	if err != nil { // error handling
		fmt.Println(err)
		return
	}
	fmt.Println(d)
}

func divide(a, b float64) (float64, error) {
	if b == 0.0 { // error checking
		return 0.0, fmt.Errorf("Cannot divide by zero")
	}
	return a / b, nil // error value is nil if a good value was passed in
}
```

```go
func split(sum int) (x, y int) { // optionally, return values can be named
	x = sum * 4 / 9
	y = sum - x
	return // called a "naked" return (returns the named return values), use only in short functions
}
```

## Pass by
Value:
```go
func main() {
	greeting := "hello"
	name := "nate"
	sayGreeting(greeting, name)
	fmt.Println(name)
}

func sayGreeting(greeting, name string) {
	fmt.Println(greeting, name)
	name = "bob"
	fmt.Println(name)
}
// ==> hello nate
// ==> bob
// ==> nate
```

Pointers:
```go
func main() {
	greeting := "hello"
	name := "nate"
	sayGreeting(&greeting, &name)
	fmt.Println(name)
}

func sayGreeting(greeting, name *string) {
	fmt.Println(*greeting, *name)
	*name = "bob"
	fmt.Println(*name)
}
// ==> hello nate
// ==> bob
// ==> bob
```

## Variadic Parameters
```go
func main() {
	s := sum(1, 2, 3, 4, 5)
	fmt.Println("The sum is ", s)
}

func sum(values ...int) int { // take all the arguments and wrap them into a slice called values
	fmt.Println(values)
	result := 0
	for _, v := range values {
		result += v
	}
	return result
}
// ==> [1 2 3 4 5]
// ==> The sum is 15
```

## Returning Pointers
A refactored version of the above:
```go
func main() {
	s := sum(1, 2, 3, 4, 5)
	fmt.Println("The sum is ", *s)
}

func sum(values ...int) *int { // take all the arguments and wrap them into a slice called values
	fmt.Println(values)
	result := 0
	for _, v := range values {
		result += v
	}
	return &result // go automatically promotes this var from local mem (stack) to shared mem (heap)
}
// ==> [1 2 3 4 5]
// ==> The sum is 15
```

## Anonymous Functions
- No function name, one-time use
- May be helpful in loops (can pass in the incrementing var to use the inner scope)
- Can save to a variable and pass them around

```go
main() {
	func() {
		fmt.Println("hello nate)
	}() // invoke the function with parens
}
```

## Methods
A function that is executing in a known context (like a struct, but could be any type)

```go
type greeter struct {
	greeting string
	name string
}

func main() {
	g := greeter {
		greeting: "Hello",
		name: "World",
	}
	g.greet() // invoke the method on the greeter
}

func (g greeter) greet() { // this is the method
	fmt.Println(g.greeting, g.name)
}
```
