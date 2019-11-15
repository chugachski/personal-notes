# Control Flow

## If statement syntax
### Standard
```go
if condition {
        // code to execute
} elseif condition {
	// code to execute
} else {
	// code to execute
}
```

### Initializer syntax:
```go
// setting two vars (one to store a value and one to store a boolean
// based on the existence of the "LA" key in the populations map
// pop, ok vars are scoped to the block
if pop, ok := populations["LA"]; ok { // semi colon to separate the initializer from the boolean var
        fmt.Println(pop)
}
```

## Rules for if statements
- Curly braces are required
- No parens around condition
- Comparison operators: ```<, <=, >, >=, ==, !=```
- Logical operators: ```||, &&, !```
  - Short circuiting does apply (go will only evaluate the expressions it needs to
  - Evaluation stops when an or expression returns true or a false expression returns false

## Switch statement syntax
### Standard
```go
switch comparisonValue {
case possibility1:        
	fmt.Println("one")
case possibility2:
	fmt.Println("two")
default:
	fmt.Println("not one or two")
}
```

### Multiple tests in a single case (instead of relying on falling through)
### and Initializing the comparison value
cases cannot overlap
```go
switch i := 2 + 3; i { // initialization
case 1, 3, 5, 7, 9:
	fmt.Println("odd input")
case 2, 4, 6, 8
	fmt.Println("even input")
}
```

### Tagless syntax
utilize comparison operations in cases
```go
i := 10
switch {
case i <= 10:
	fmt.Println("less than or equal to 10")
case i <= 20:
	fmt.Println("less than or equal to 20") // cases can overlap
default
	fmt.Println("greater than 20")
}
```

### Type Switches
```go
var i interface{} = 1 // an interface can represent any kind of data, in this case, an int
switch i.(type) { // access the underlying type
case int:
	fmt.Println("i is an int")
case float64:
	fmt.Println("i is a float")
case string:
	fmt.Println("i is a string")
case [3]int:
	fmt.Println("i is an array of three ints")
default:
	fmt.Println("i is another type")
}
```

## Switch statement rules
- Breaks are implicit
- Use the "fallthrough" keyword if you want to execute the statements in the next case to execute (logic-less)
- Use the "break" keyword to leave a case early (possibly as the result of some kind of validation)
