//
//  main.m
//  O
//
//  Created by Fay on 2017/5/8.
//  Copyright © 2017年 Fay. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OC.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        OC *oc = [[OC alloc] init];
        NSLog(@"%d", [oc add:8](10));
    }
    return 0;
}
