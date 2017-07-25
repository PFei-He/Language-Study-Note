//
//  OC.m
//  o
//
//  Created by Fay on 2017/7/24.
//  Copyright © 2017年 Fay. All rights reserved.
//

#import "OC.h"

@implementation OC

+ (void)recursive:(NSInteger)i
{
    if (i >= 10) {
        return;
    } else {
        NSLog(@"%ld", (long)i);
        i++;
        [OC recursive:i];
    }
}


@end
