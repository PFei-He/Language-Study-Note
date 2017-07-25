//
//  main.cpp
//  cpp
//
//  Created by Fay on 2017/7/25.
//  Copyright © 2017年 Fay. All rights reserved.
//

#include <iostream>

using namespace std;

const function<function<int(int)>(int)> & add =
[](int x) -> function<int(int)> {
    return [x](int y) -> int {
        return x + y;
    };
};

int main(int argc, const char * argv[]) {
    cout << add(8)(10) << endl;
    return 0;
}
