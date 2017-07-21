//
//  OC.m
//  O
//
//  Created by Fay on 2017/7/21.
//  Copyright © 2017年 Fay. All rights reserved.
//

#import "OC.h"

@implementation OC

+ (NSArray *)bubbleSort:(NSArray *)array
{
    NSMutableArray *arr = [NSMutableArray arrayWithArray:array];
    for (int i = 0; i < arr.count - 1; i++) {
        for (int j = 0; j < arr.count - 1 - i; j++) {
            if (arr[j] > arr[j + 1]) {
                [arr exchangeObjectAtIndex:j withObjectAtIndex:j + 1];
            }
        }
    }
    return arr;
}


@end
