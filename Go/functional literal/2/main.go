package main

import "fmt"

func main() {
	fmt.Println(add(8)(10))
}

func add(x int) func (y int) int {
	return func (y int) int {
		return x + y
	}
}
