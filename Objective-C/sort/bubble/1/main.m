//
//  main.m
//  O
//
//  Created by Fay on 2017/7/21.
//  Copyright © 2017年 Fay. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OC.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSArray *array = @[@2, @1, @3, @5, @4];
        NSLog(@"%@", [OC bubbleSort:array]);
    }
    return 0;
}
