# Maps

## Declarations
Using literal style:
```go
populations := map[string]int { // keys of string type, values of int type
        "CA": 3035051,
	"TX": 3837411,
	"AK": 45617,
	"WA": 652993,
}
```

Using make (useful when the values not know at time of declaration, like for loops):
```go
populations := make(map[string]int)
populations = map[string]int {
        "CA": 3035051,
	"TX": 3837411,
	"AK": 45617,
	"WA": 652993,
}
```

## Accessing, adding to and deleting from maps
```go
populations["AK"] // accessing AK
populations["LA"] = 61998 // adding LA
delete(populations, "CA") // remove CA (note, accessing CA afterward will return and ambiguous '0', see 'ok' below
```

Using ok (a conventional variable name for this kind of test) to determine if key exists: 
```go
delete(populations, "WA")
_, ok := populations["WA"]
fmt.Println(_, ok) // ==> false
```

## Determine map length
```go
len(populations)
```

## Rules
- Possible key types (must be testable for equality):
  - strings, booleans, numerics, arrays, pointers, interfaces, strucs, channels
  - can't use: slices, maps, functions
- Pass by reference (watch out for side effects)
