package main

import "fmt"

type Color int
const (
	RED Color = iota
	ORANGE
	YELLOW
	GREEN
	CYAN
	BLUE
	PURPLE
)

func main() {
	fmt.Println(CYAN)
}
