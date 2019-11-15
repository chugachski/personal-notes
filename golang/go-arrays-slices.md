# Arrays

## Declaring Arrays
name := [n]type{values}
```go
grades := [3]int{88, 95, 76}
grades := [...]int{90, 69, 97, 84} // make an array just large enough to contain the data passed in
var students [3]string // make an array with three zeroed out members
students[0] = "Bill" // assign the first member
len(students) // return the length of the students array
```

## Rules
- Arrays are of fixed size known at compile time
- Arrays can be made up of any type, but the type must match
- If you copy an array, you are creating a different set of data (pass by value)
  - mutating an array changes that copy only
  - passing arrays into a function involves creating a new array
  - can avoid with pointers (using the 'address-of' operator)

```go
a := [...]{1, 2, 3}
b := a
b[0] = 9
fmt.Println(a) // ==> 1, 2, 3
fmt.Println(b) // ==> 9, 2, 3
```

## Identity Matrices
An array made up of arrays
```go
var identityMatrix [3][2]int = [3][2]int{ [2]int{1, 3}, [2]int{5, 2}, [2]int{2, 9} } // ==> [[1 3] [5 2] [2 9]]
```

or equivalently,

```go
var identityMatrix [3][2]int
identityMatrix[0] = [2]{1, 3}
identityMatrix[1] = [2]{5, 2}
identityMatrix[2] = [2]{2, 9}
```

# Slices

## Declaring Slices
name := []type{values}

```go
a := []int{1, 2, 3, 4, 5, 6, 7, 8, 9, 10}
b := a[:] // slice of all elements
c := a[3:] // copy values from index 3 to the end
d := a[:6] // copy values from the beginning to but not including index 6
e := [3:6] // copy values from index 3 up to but not including index 6
```
first number is inclusive, second number is exclusive

a := make([]int, 3) // first arg is what you are making,
// second arg is the length of the slice,
// optional third arg is the capacity
// the reason for the capacity is that copying large slices in operations like append is costly

## Appending to slices
```go
a := []int{}
a = append(a, 1) // takes 2 or more args where the args following the source slice are all appended
a = append(a, []int{2, 4, 6}...) // use a "spread" like operator to expand the slice out and append the ints
```

## Rules
- Slices are backed by arrays
- Slices are dynamically sized  
- Slices are pass by reference (mutating a copy affects the original)
- Slicing operations can have an array or a slice as the source
- If an append operation on an array exceeds it's capacity, there will be a copy operation
