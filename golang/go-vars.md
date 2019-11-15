# Go Vars

## Styles
### A) Separate lines for declaration and assignment
Note that the variable's name comes befor the type for readability
```go
var i int
i = 69
```

### B) All on one line
```
var i int = 69
```

## C) Short version; go will infer the type by the value assigned
Can't use this style at the package level
```go
i := 69
```

## Block Style
### (Only at the package level; outside functions, all statements begin with a keyword)
### can have multiple blocks
```go
var (
        name string = "Bill"
        age int = 69
        rating float32 = 69.69
)
```

## Multiple vars on same line
```go
var c, python, java bool // all are same type and will be initialized with the zero value for the type
var i, j int = 1, 2 // explicitly initialized
var c, python, java = true, false, "no!" // possible to let go infer the type if you do initialize with values
```

## Rules
- vars can be declared only once in a given scope
- when a var is declared in multiple scopes, the inner most scope is used (shadowing)
- declared vars must be used

## Naming
- camelCase
- keep ancronyms upper case, ex ```imgURL``` 
- lower case global vars are scoped to the package (not visible to anything that consumes the package)
- upper case global vars are exposed to the world
- lower case block level vars are only visible to the block

## Conversions
- Can't change type without a conversion function
- Possibility exists that you could lose information (ex: converting a float to an int)

```go
var i int = 33
fmt.Printf("%v, %T\n", i, i)
var j float32
j = float32(i)
fmt.Printf("%v, %T\n", j, j)
```

To convert between strings and numbers, must use the string conversion package (import "strconv")
```go
var i int = 33
fmt.Printf("%v, %T\n", i, i)
var j string
j = strconv.Itoa(i)
fmt.Printf("%v, %T\n", j, j)
```

## Boolean Evaluations
```go
n := 1 == 2
fmt.Printf("%v, %T", n, n)
```
==> false, bool

## Zero Values
Every value gets initialized with the zero value if not assigned
- 0 for numeric types
- false for booleans
- "" for strings

## Constants
- camelCase for constants you don't want to export
- PascalCale for constants you want to export
- Must be assignable at compile time
- Can't make a collection a const because they are mutable
- Can be shadowed (inner scoping overrides outer scoping)
- Can perform operations on a constant and a var of the the same type
- Constants can be typed or untyped (implicit) and the compiler can do implicit conversion

## Write only variable
_ (underscore)
- tells go that we don't care about the value and not to waste memory on it
- commonly used in const blocks with iota

```go
const (
        _ = iota
        dogSpecialist
        reptileSpecialist
        birdSpecialist
)
```
