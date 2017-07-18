package main

import "fmt"

func main() {
	array := [2] int {1, 2}
	fmt.Println(array)
	for i := range array {
		fmt.Println(i)
	}
}
