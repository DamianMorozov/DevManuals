====================================================================================================
Go cheatsheet
====================================================================================================
go version
----------------------------------------------------------------------------------------------------
Tutorial: Get started with Go
https://golang.org/doc/tutorial/getting-started
> cd <Folder>
> mkdir Go.HelloWorld
> cd Go.HelloWorld
create file HelloWorld.go
paste the code
'package main
import "fmt"
func main() {
    fmt.Println("Hello, World!")
}'
> go run HelloWorld.go
----------------------------------------------------------------------------------------------------
Call code in an external package
get quote package from https://pkg.go.dev/rsc.io/quote
see Documentation > Index > functions
edit source
'package main
import "fmt"
import "rsc.io/quote"
func main() {
    fmt.Println(quote.Go())
}'
> go mod init HelloWorld
> go run HelloWorld.go
----------------------------------------------------------------------------------------------------
