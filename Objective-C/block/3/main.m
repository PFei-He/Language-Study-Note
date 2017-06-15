//
//  main.m
//  o
//
//  Created by Fay on 2017/6/15.
//  Copyright © 2017年 Fay. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Block.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Block *b = [[Block alloc] init];
        [b say:^(void (^end)(NSString *)) {
            NSLog(@"Hello Objective-C!");
            end(@"^_^");
        }];
    }
    return 0;
}
