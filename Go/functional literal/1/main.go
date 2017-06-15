package main

import "fmt"

func main() {
	say(func (content string) {
		fmt.Println(content)
	})
}

func say(reply func (content string))  {
	reply("Hello World!")
}
