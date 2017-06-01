//
//  main.swift
//  s
//
//  Created by Fay on 2017/5/26.
//  Copyright © 2017年 Fay. All rights reserved.
//

import Foundation

func say(_ closure: (_ string: String) -> String) {
    print(closure("Hello World!"))
}

say { (string) in
    print(string)
    return "Hello Swift!"
}
