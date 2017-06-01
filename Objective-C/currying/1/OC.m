//
//  OC.m
//  O
//
//  Created by Fay on 2017/5/8.
//  Copyright © 2017年 Fay. All rights reserved.
//

#import "OC.h"

@implementation OC


- (int (^)(int))add:(int)x
{
    return ^(int y) {
        return x + y;
    };
}


@end
