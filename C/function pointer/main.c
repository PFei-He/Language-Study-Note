//
//  main.c
//  c
//
//  Created by Fay on 2017/5/8.
//  Copyright © 2017年 Fay. All rights reserved.
//

#include <stdio.h>

typedef void (*pointer)(char[]);

void say(pointer p);
void content(char c[]);

int main(int argc, const char * argv[]) {
    say(content);
    return 0;
}

void say(pointer p) {
    p("Hello World!");
}

void content(char c[]) {
    printf("%s\n", c);
}
