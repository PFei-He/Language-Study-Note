//
//  main.swift
//  S
//
//  Created by Fay on 2017/5/8.
//  Copyright © 2017年 Fay. All rights reserved.
//

import Foundation


func add(_ x: Int) -> (_ y: Int) -> Int {
    return { (y) in
        return x + y
    }
}

print(add(8)(10))
