//
//  main.m
//  o
//
//  Created by Fay on 2017/8/2.
//  Copyright © 2017年 Fay. All rights reserved.
//

#import <Foundation/Foundation.h>

#define NSLog(FORMAT, ...) fprintf(stderr, "%s\n", [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSString *string = [[[NSString alloc] initWithData:[[NSFileHandle fileHandleWithStandardInput] availableData] encoding:NSUTF8StringEncoding] stringByTrimmingCharactersInSet:[NSCharacterSet newlineCharacterSet]];
        NSLog(@"%@", string);
    }
    return 0;
}
