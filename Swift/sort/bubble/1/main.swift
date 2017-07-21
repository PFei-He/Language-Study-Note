//
//  main.swift
//  S
//
//  Created by Fay on 2017/7/21.
//  Copyright © 2017年 Fay. All rights reserved.
//

import Foundation

func bubbleSort(_ array: Array<Int>) -> Array<Int> {
    var arr = array
    var index = 0
    repeat {
        for i in 1 ..< arr.count {
            if (arr[i - 1] > arr[i]) {
                swap(&arr[i], &arr[i - 1])
            }
            index = i
        }
    } while index == arr.count
    return arr
}

var array = [2, 1, 3, 5, 4]
print(bubbleSort(array))
