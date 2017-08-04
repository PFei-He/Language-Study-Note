package main

import "fmt"

func main() {
	print("A", "B", "C")
}

func print(values ... string) {
	for v := range values {
		fmt.Println(values[v])
	}
}
