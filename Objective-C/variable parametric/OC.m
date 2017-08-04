//
//  OC.m
//  oc
//
//  Created by Fay on 2017/8/3.
//  Copyright © 2017年 Fay. All rights reserved.
//

#import "OC.h"

@implementation OC

+ (void)mainWithValues:(NSString *)values, ...
{
    NSLog(@"%@", values);
    va_list list;
    va_start(list, values);
    while (values != nil) {
        NSString *string = va_arg(list, NSString *);
        if (!string) break;
        NSLog(@"%@", string);
    }
    va_end(list);
}


@end
