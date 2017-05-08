//
//  main.cpp
//  cpp
//
//  Created by Fay on 2017/5/8.
//  Copyright © 2017年 Fay. All rights reserved.
//

#include <iostream>

using namespace std;

typedef void (*pointer)(string);

void say(pointer p);
void content(string string);

int main(int argc, const char * argv[]) {
    say(content);
    return 0;
}

void say(pointer p) {
    p("Hello World!");
}

void content(string string) {
    cout << string << endl;
}
