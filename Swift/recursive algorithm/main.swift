//
//  main.swift
//  s
//
//  Created by Fay on 2017/7/24.
//  Copyright © 2017年 Fay. All rights reserved.
//

import Foundation

func main() {
    recursive(i: 0)
}

func recursive(i: Int) {
    var j = i
    if j >= 10 {
        return
    } else {
        print(j)
        j += 1
        recursive(i: j)
    }
}

main()
