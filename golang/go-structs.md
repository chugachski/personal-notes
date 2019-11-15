# Structs
Like a collection, but without restriciting different types like a map

## Declaration of a struct
```go
type Doctor struct { // capitalize names to export
        badgeID int // these fields won't be exported b/c they are not capitalized
        name string
	specialties []string
}

aDoctor := Doctor { // good practice to list field names, but can exclude them (called positional syntax)
	badgeID: 5,
	name: "Roger",
	specialties: []string {
		"brain surgery",
		"diagnostics",
	},
}
```

## Accessing values
```go
aDoctor.name // use 'dot' notation
aDoctor.specialties[0]
```

## Anonymous Structs
```go
aFriend := struct{name string}{"Jonny"} // second set of curly braces initializes the struct
```

## Rules
- When using positional syntax, order matters, can present maintenance issues
- When using the field names, order is irrelevant and you can exclude fields if necessary
- Pass by value (remember that you are creating a new copy if you pass a large struct around)
- Interfaces are better for describing common behavior b/c they are interchangible

## Using the address-of operator
Can point to same underlying data (like arrays) by using '&'
```go
aFriend := struct{name string}{"Jonny"}
anotherFriend := &aFriend // now manipulating one won't affect the other
```

## Embedding
- Traditional OOP languages utilize the inheritance concept (a Bird *is* an Animal)
- Go supports composition through embedding (a Bird *has* Animal characteristics)

```go
type Animal struct {
        Name string
	Origin string
}

type Bird struct {
	Animal // embedding Animal in Bird (which is otherwise an independent struct)
	SpeedMPH float32
	CanFly bool
}

main() {
	b := Bird{}
	b.Name = "Osterich"
	b.Origin = "Africa"
	b.SpeedMPH = 30
	b.CanFly = false

	c := Bird { // same as above using literals 
		Animal: Animal {Name: "Osterich", Origin: "Africa"},
		SpeedMPH: 30,
		CanFly: false,
	}
}
```

## Tags
- Tags are notated between backticks
- Subtags are space delimited
- Key:Value relationship notated by `key:"value"`

```go
import (
	"fmt"
	"reflect" // needed to access the tag
}

type Animal struct {
        Name string `required max:"100"` // tag
	Origin string
}

func main() {
	t := reflect.TypeOf(Animal{}) // get the type using the reflect package
	field, _ := t.FieldByName("Name") // get the field
	fmt.Println(field.Tag) // ==> required max:"100", process using a library
}
```
