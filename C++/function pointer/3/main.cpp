//
//  main.cpp
//  cpp
//
//  Created by Fay on 2017/6/15.
//  Copyright © 2017年 Fay. All rights reserved.
//

#include <iostream>

using namespace std;

typedef void (*End)(string);
typedef void (*Reply)(End);

void say(Reply);
void reply(End);

int main(int argc, const char * argv[]) {
    say(reply);
    return 0;
}

void end(string content) {
    cout << content << endl;
}

void reply(End end) {
    cout << "Hello C++!" << endl;
    end("^_^");
}

void say(Reply reply) {
    cout << "Hello World!" << endl;
    reply(end);
}
