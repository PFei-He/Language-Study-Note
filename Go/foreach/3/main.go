package main

import "fmt"

func main() {
	m := map[string]string {
		"a": "1",
		"b": "2",
	}
	fmt.Println(m)
	for key, value := range m {
		fmt.Println(key)
		fmt.Println(value)
	}
}
