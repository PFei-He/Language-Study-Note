package main

import "fmt"

func main() {
	say(func (end func (content string)) {
		fmt.Println("Hello Go!")
		end("^_^")
	})
}

func say(reply func (func (string))) {
	fmt.Println("Hello World!")
	reply(func (content string) {
		fmt.Println(content)
	})
}
