package main

import "fmt"

func main() {
	say(func(string string) string {
		fmt.Println(string)
		return "Hello Go!"
	})
}

func say(literal func(string string) string)  {
	fmt.Println(literal("Hello World!"))
}
