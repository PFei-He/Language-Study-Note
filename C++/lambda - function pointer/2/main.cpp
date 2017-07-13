//
//  main.cpp
//  cpp
//
//  Created by Fay on 2017/6/6.
//  Copyright © 2017年 Fay. All rights reserved.
//

#include <iostream>

using namespace std;

typedef string (*pointer)(string);

void say(pointer p);
string content(string string);

int main(int argc, const char * argv[]) {
    say(content);
    return 0;
}

void say(pointer p) {
    cout << p("Hello World!") << endl;
}

string content(string string) {
    cout << string << endl;
    return "Hello C++!";
}
