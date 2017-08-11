//
//  main.cpp
//  cpp
//
//  Created by Fay on 2017/8/11.
//  Copyright © 2017年 Fay. All rights reserved.
//

#include <iostream>
#include <stdarg.h>

using namespace std;

void print(const char *values, ...);

int main(int argc, const char * argv[]) {
    print("A", "B", "C", NULL);
    return 0;
}

void print(const char *values, ...) {
    cout << values << endl;
    va_list list;
    va_start(list, values);
    while (values != NULL) {
        char *value = va_arg(list, char *);
        if (value == NULL) {
            break;
        }
        cout << value << endl;
    }
    va_end(list);
}
