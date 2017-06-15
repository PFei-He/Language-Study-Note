package main

import "fmt"

func main() {
	say(func (content string) string {
		fmt.Println(content)
		return "Hello Go!"
	})
}

func say(reply func(string)string)  {
	fmt.Println(reply("Hello World!"))
}
