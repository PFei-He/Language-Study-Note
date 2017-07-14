package main

import "fmt"

func main() {
	m := map [string] string {
		"a": "1",
		"b": "2",
	}
	fmt.Println(m)
	fmt.Println(m["a"])
	fmt.Println(m["b"])
}
