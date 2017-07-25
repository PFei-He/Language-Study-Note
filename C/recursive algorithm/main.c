//
//  main.c
//  c
//
//  Created by Fay on 2017/7/25.
//  Copyright © 2017年 Fay. All rights reserved.
//

#include <stdio.h>

void recursive(int i);

int main(int argc, const char * argv[]) {
    recursive(0);
    return 0;
}

void recursive(int i) {
    if (i >= 10) {
        return;
    } else {
        printf("%d\n", i);
        i++;
        recursive(i);
    }
}
