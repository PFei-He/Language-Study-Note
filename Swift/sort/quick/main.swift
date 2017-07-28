//
//  main.swift
//  s
//
//  Created by Fay on 2017/7/27.
//  Copyright © 2017年 Fay. All rights reserved.
//

import Foundation

func main() {
    let array = [2, 1, 3, 5, 4]
    print(quickSort(array))
}

func quickSort(_ array: [Int]) -> [Int] {
    if array.isEmpty {
        return array
    }
    let first = array.first!
    let left = array.filter { $0 < first }
    let right = array.filter { $0 > first }
    return quickSort(left) + Array(arrayLiteral: first) + quickSort(right)
}

main()
