//
//  main.m
//  O
//
//  Created by Fay on 2017/5/8.
//  Copyright © 2017年 Fay. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "B.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        B *b = [[B alloc] init];
        NSLog(@"%d", [b add:8](10));
    }
    return 0;
}
