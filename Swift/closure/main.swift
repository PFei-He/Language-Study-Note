//
//  main.swift
//  s
//
//  Created by Fay on 2017/5/8.
//  Copyright © 2017年 Fay. All rights reserved.
//

import Foundation

func say(_ closure: (_ string: String) -> Void) {
    closure("Hello World!")
}

say { (string) in
    print(string)
}
