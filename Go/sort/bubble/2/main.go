package main

import (
	"fmt"
)

func main() {
	slice := []int {2, 1, 3, 5, 4}
	fmt.Println(bubbleSort(slice))
}

func bubbleSort(slice []int) []int {
	length := len(slice)
	for i := 0; i < length - 1; i++ {
		for j := 0; j < length - 1 - i; j++ {
			if (slice[j] > slice[j + 1]) {
				swap(slice, j)
			}
		}
	}
	return slice
}

func swap(slice []int, i int)  {
	temp := slice[i]
	slice[i] = slice[i + 1]
	slice[i + 1] = temp
}
