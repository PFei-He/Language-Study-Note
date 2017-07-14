//
//  main.m
//  o
//
//  Created by Fay on 2017/7/14.
//  Copyright © 2017年 Fay. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSArray *array = @[@1, @2];
        for (NSNumber *i in array) {
            NSLog(@"%@", i);
        }
    }
    return 0;
}
