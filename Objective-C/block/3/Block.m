//
//  Block.m
//  o
//
//  Created by Fay on 2017/6/15.
//  Copyright © 2017年 Fay. All rights reserved.
//

#import "Block.h"

@implementation Block

- (void)say:(void (^)(void (^)(NSString *)))reply
{
    NSLog(@"Hello World!");
    reply(^(NSString *content){
        NSLog(@"%@", content);
    });
}

@end
