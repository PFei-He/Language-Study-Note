//
//  main.cpp
//  cpp
//
//  Created by Fay on 2017/7/25.
//  Copyright © 2017年 Fay. All rights reserved.
//

#include <iostream>

using namespace std;

void recursive(int i);

int main(int argc, const char * argv[]) {
    recursive(0);
    return 0;
}

void recursive(int i) {
    if (i >= 10) {
        return;
    } else {
        cout << i << endl;
        i++;
        recursive(i);
    }
}
