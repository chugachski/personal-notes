# Defer, Panic, Recover

## Defer
- The "defer" keyword executes any functions that are passed into it
after the surrounding function executes it's last statement but before the return
- Useful to group open and close operations together (so you don't forget)

```go
func main() {
	fmt.Println("start")
	defer fmt.Println("middle")
	fmt.Println("end")
}
// ==> start end middle
```

Multiple defers are executed in LIFO order
Often used to close out resources in case one resource was dependent on another one
```go
func main() {
	defer fmt.Println("start")
	defer fmt.Println("middle")
	defer fmt.Println("end")
}
// ==> end middle start
```

## Panic
#### When the go program cannot continue
- Note that go doesn't have exceptions in the sense used by other langs
- Go usually just returns an error and leaves handling it to the programmer
- Panics happen *after defered statements have run* (so that you can still close a process even if the program panics)

Runtime generated panic:
```go
func main() {
	a, b := 1, 0
	ans := a / b
	fmt.Println(ans)
}
// panic: runtime error: integer divide by zero
```

Developer generated panic (using panic function):
```go
func main() {
	fmt.Println("start")
	panic("something bad happened"
	fmt.Println("end")
}
// panic: something bad happened
```







