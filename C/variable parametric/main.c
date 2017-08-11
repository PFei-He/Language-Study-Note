//
//  main.c
//  c
//
//  Created by Fay on 2017/8/11.
//  Copyright © 2017年 Fay. All rights reserved.
//

#include <stdio.h>
#include <stdarg.h>

void print(const char *value, ...);

int main(int argc, const char * argv[]) {
    print("A", "B", "C", NULL);
    return 0;
}

void print(const char *values, ...) {
    printf("%s\n", values);
    va_list list;
    va_start(list, values);
    while (values != NULL) {
        char *value = va_arg(list, char *);
        if (value == NULL) {
            break;
        }
        printf("%s\n", value);
    }
    va_end(list);
}
