//
//  main.swift
//  s
//
//  Created by Fay on 2017/6/15.
//  Copyright © 2017年 Fay. All rights reserved.
//

import Foundation

func say(_ reply: ((String) -> Void) -> Void) {
    print("Hello World!")
    reply { content in
        print(content)
    }
}

say { end in
    print("Hello Swift!")
    end("^_^")
}
