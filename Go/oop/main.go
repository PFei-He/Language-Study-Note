package main

import "fmt"

func main() {
	var cls1 class
	cls1.string = "Hello"

	cls2 := class{}
	cls2.string = "World!"

	fmt.Println(cls1.string+" "+cls2.string)
}

type class struct {
	string string
}
