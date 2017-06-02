//
//  Block.m
//  o
//
//  Created by Fay on 2017/5/8.
//  Copyright © 2017年 Fay. All rights reserved.
//

#import "Block.h"

@implementation Block

- (void)say:(void (^)(NSString *))reply
{
    reply(@"Hello World!");
}


@end
