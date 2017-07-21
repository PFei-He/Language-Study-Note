//
//  main.m
//  o
//
//  Created by Fay on 2017/7/19.
//  Copyright © 2017年 Fay. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSDictionary *dictionary = @{@"A": @1, @"B": @2, @"C": @3};
        NSLog(@"%@", dictionary);
        NSLog(@"%@", dictionary[@"A"]);
        NSLog(@"%@", dictionary[@"B"]);
        NSLog(@"%@", dictionary[@"C"]);
    }
    return 0;
}
