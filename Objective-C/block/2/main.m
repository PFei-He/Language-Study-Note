//
//  main.m
//  o
//
//  Created by Fay on 2017/5/31.
//  Copyright © 2017年 Fay. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Block.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Block *b = [[Block alloc] init];
        [b say:^NSString *(NSString *content) {
            NSLog(@"%@", content);
            return @"Hello Objective-C!";
        }];
    }
    return 0;
}
