//
//  Block.m
//  o
//
//  Created by Fay on 2017/5/31.
//  Copyright © 2017年 Fay. All rights reserved.
//

#import "Block.h"

@implementation Block

- (void)say:(NSString *(^)(NSString *))block
{
    NSLog(@"%@", block(@"Hello World!"));
}


@end
