package main

import "fmt"

func main() {
	var array[10] int
	fmt.Println(array)
	for i := range array {
		fmt.Println(i)
	}
}
