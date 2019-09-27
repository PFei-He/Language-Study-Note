//
//  FLDebug.m
//  Runner
//
//  Created by Mac on 2019/9/25.
//  Copyright © 2019 FayLib. All rights reserved.
//

#import "FLDebug.h"
#import "FLNetworkHelper.h"
#import "FLReachabilityHelper.h"

@implementation FLDebug

+ (void)debugMode:(BOOL)openOrNot
{
    [FLNetworkHelper setDebugMode:YES];
    [FLReachabilityHelper setDebugMode:YES];
}

@end
