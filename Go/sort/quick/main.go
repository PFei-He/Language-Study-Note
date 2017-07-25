package main

import (
	"fmt"
)

func main() {
	slice := []int {2, 1, 3, 5, 4}
	fmt.Println(quickSort(slice))
}

func quickSort(slice []int) []int {
	if len(slice) <= 1 {
		return slice
	}
	mid, i := slice[0], 1
	left, right := 0, len(slice) - 1
	for i = 1; i <= right; {
		if slice[i] > mid {
			slice[i], slice[right] = slice[right], slice[i]
			right--
		} else {
			slice[i], slice[left] = slice[left], slice[i]
			left++
			i++
		}
	}
	slice[left] = mid
	quickSort(slice[:left])
	quickSort(slice[left+1:])

	return slice
}
