# Pointers
### Make a variable point to another variable using a pointer

## Syntax
### Standard
```go
func main() {
	var a int = 56
	var b int = a
	fmt.Println(a, b) // ==> 56 56
	a = 1
	fmt.Println(a, b) // ==> 1 56
}
```
### Using a pointer
- precede the pointer's type with a star
- precede the value you are pointing to with an ampersand (address-of operator)

```go
func main() {
	var a int = 56
	var b *int = &a // var b is a pointer to an int and holds the memory location of var a
	fmt.Println(a, b) // ==> 56 0x40e020
	fmt.Println(&a, b) // ==> 0x40e020 0x40e020
	fmt.Println(a, *b) // ==> 56 56
	// putting a star in front of a pointer gets the value by "dereferencing" the pointer
	a = 1
	fmt.Println(a, *b) // ==> 1 1
	*b = 99 // can also dereference var b and change the values
	fmt.Println(a, *b) // 99 99
}
```

### Working with objects
```go
type myStruct struct {
	foo int
}

func main() {
	ms := myStruct{foo: 75} // instantiate a ms object
	fmt.Println(ms) // ==> {75}
	p := &ms // create a pointer to ms
	fmt.Println(p) // ==> &{75}
}
```

Same as above:
```go
func main() {
	var ms *myStruct
	ms = &myStruct{foo: 42}
	fmt.Println(ms) // ==> &{42} the address of an object with a field with the value 42 in it
}
```

Even shorter:
```go
func main() {                         
        ms := &myStruct{foo: 42}
        fmt.Println(ms)
}
```

Using the "new" keyword to initialize an empty object and then setting it
```go
func main() {
	var ms *myStruct
	ms = new(myStruct)
	fmt.Println(ms) // ==> &{0} the field is initialized to the zero value for an int
	(*ms).foo = 42 // set the field to 42 (parens around the ms pointer to dereference it and not ms.foo)
	fmt.Println((*ms).foo) // ==> 42
}
```

Same as above, but omitting the dereferencing:
```go
func main() {
	var ms *myStruct
	ms = new(myStruct)
	ms.foo = 42
	fmt.Println(ms.foo) // ==> 42
}
```

## Rules
- No pointer arithmetic in golang without using the "unsafe" package
- An uninitialized pointer has a zero value of nil
