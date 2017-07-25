package main

import (
	"sort"
	"fmt"
)

func main() {
	slice := sort.IntSlice{2, 1, 3, 5, 4}
	fmt.Println(bubbleSort(slice))
}

func bubbleSort(slice sort.Interface) sort.Interface {
	length := slice.Len()
	for i := 0; i < length - 1; i++ {
		for j := 0; j < length - 1 - i; j++ {
			if slice.Less(j+1, j) {
				slice.Swap(j, j+1)
			}
		}
	}
	return slice
}
