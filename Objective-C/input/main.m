//
//  main.m
//  o
//
//  Created by Fay on 2017/5/3.
//  Copyright © 2017年 Fay. All rights reserved.
//

#import <Foundation/Foundation.h>

//#ifdef DEBUG
//#define NSLog(...) NSLog(__VA_ARGS__)
//#else
//#define NSLog(...)
//#endif

//#ifdef DEBUG
//#define NSLog(FORMAT, ...) fprintf(stderr, "%s\n", [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
//#else
//#define NSLog(...)
//#endif

#define NSLog(FORMAT, ...) fprintf(stderr, "%s\n", [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        char c[0];
        scanf("%s", c);
        NSLog(@"%@", [NSString stringWithCString:c encoding:NSUTF8StringEncoding]);
    }
    return 0;
}
