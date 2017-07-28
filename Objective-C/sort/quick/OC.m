//
//  OC.m
//  o
//
//  Created by Fay on 2017/7/27.
//  Copyright © 2017年 Fay. All rights reserved.
//

#import "OC.h"

@implementation OC

+ (NSArray<NSNumber *> *)quickSort:(NSArray<NSNumber *> *)array
{
    if (array.count <= 1) {
        return array;
    }
    NSNumber *pivot = array.firstObject;
    NSMutableArray *left = [NSMutableArray array];
    NSMutableArray *right = [NSMutableArray array];
    
    for (NSNumber *v in array) {
        if (v < pivot) {
            [left addObject:v];
        } else if (v > pivot) {
            [right addObject:v];
        }
    }
    
    NSMutableArray *result = [NSMutableArray array];
    [result addObjectsFromArray:[self quickSort:left]];
    [result addObject:pivot];
    [result addObjectsFromArray:[self quickSort:right]];
    
    return [result copy];
}


@end
