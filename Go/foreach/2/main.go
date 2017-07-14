package main

import "fmt"

func main() {
	array := [5] int {1, 2, 3, 4, 5}
	fmt.Println(array)
	for i := range array {
		fmt.Println(i)
	}
}
