//
//  main.m
//  oc
//
//  Created by Fay on 2017/8/16.
//  Copyright © 2017年 Fay. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
        dictionary[@"A"] = @"1";
        dictionary[@"B"] = @"2";
        dictionary[@"C"] = @"3";
        NSLog(@"%@", dictionary);
    }
    return 0;
}
