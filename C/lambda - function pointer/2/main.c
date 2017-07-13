//
//  main.c
//  c
//
//  Created by Fay on 2017/6/6.
//  Copyright © 2017年 Fay. All rights reserved.
//

#include <stdio.h>

typedef char* (*pointer)(char*);

void say(pointer p);
char* content(char* c);

int main(int argc, const char * argv[]) {
    say(content);
    return 0;
}

void say(pointer p) {
    printf("%s\n", p("Hello World!"));
}

char* content(char* c) {
    printf("%s\n", c);
    return "Hello C!";
}
