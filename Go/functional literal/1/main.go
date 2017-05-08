package main

import "fmt"

func main() {
	say(func(string string) {
		fmt.Println(string)
	})
}

func say(literal func(string string))  {
	literal("Hello World!")
}
