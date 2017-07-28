package main

import "fmt"

func main() {
	cls := class{"Hello Go!"}
	cls.say()
}

type class struct {
	string string
}

func (cls class) say()  {
	fmt.Println(cls.string)
}
