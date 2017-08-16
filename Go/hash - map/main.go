package main

import "fmt"

func main() {
	m := map [string] int {
		"A": 1,
		"B": 2,
		"C": 3,
	}
	fmt.Println(m)
	fmt.Println(m["A"])
	fmt.Println(m["B"])
	fmt.Println(m["C"])
}
