//
//  main.c
//  c
//
//  Created by Fay on 2017/6/15.
//  Copyright © 2017年 Fay. All rights reserved.
//

#include <stdio.h>

typedef void (*End)(char*);
typedef void (*Reply)(End);

void say(Reply);
void reply(End);

int main(int argc, const char * argv[]) {
    say(reply);
    return 0;
}

void end(char* content) {
    printf("%s\n", content);
}

void reply(End end) {
    printf("Hello C!\n");
    end("^_^");
}

void say(Reply reply) {
    printf("Hello World!\n");
    reply(end);
}
