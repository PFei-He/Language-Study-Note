package main

import "fmt"

func main() {
	recursive(0)
}

func recursive(i int)  {
	if i >= 10 {
		return
	} else {
		fmt.Println(i)
		i++
		recursive(i)
	}
}
