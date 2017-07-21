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
    
    BOOL swapped = YES;
    
    while (swapped) {
        swapped = NO;
        for (int i = 1; i < arr.count; i++) {
            if (arr[i - 1] > arr[i]) {
                [arr exchangeObjectAtIndex:i - 1 withObjectAtIndex:i];
                swapped = YES;
            }
        }
    }
    return arr;
}


@end
