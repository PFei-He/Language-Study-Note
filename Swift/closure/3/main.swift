//
//  main.swift
//  s
//
//  Created by Fay on 2017/6/2.
//  Copyright © 2017年 Fay. All rights reserved.
//

import Foundation

func say(_ reply: (String) -> String) {
    print(reply("Hello World!"))
}

say { (content) in
    print(content)
    return "Hello Swift!"
}
