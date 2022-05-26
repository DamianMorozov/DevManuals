# Get started with Go

## Go version
- [Get started with Go](https://go.dev/doc/tutorial/getting-started)

## Quick start
Cmd
```
mkdir GoSource
cd GoSource
```
create file HelloWorld.go
paste the code
```
package main
import "fmt"
func main() {
  fmt.Println("Hello, World")
}
```
Cmd
```go run .```

## Call code in an external package
get quote package from https://pkg.go.dev/search?q=quote
see Documentation > Index > functions
edit source
```
package main
import "fmt"
import "rsc.io/quote"
func main() {
  fmt.Println(quote.Go())
}
```
Cmd
```
go mod tidy
go run .
```
