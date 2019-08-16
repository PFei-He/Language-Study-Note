//
//  v.m
//  demo2
//
//  Created by Mac on 2019/8/10.
//  Copyright © 2019 FayLib. All rights reserved.
//

#import "version.h"

@implementation version

+ (NSString *)filling:(NSString *)string
{
    NSArray *array = @[@"0000", @"000", @"00", @"0", @""];
    NSArray *strings = [string componentsSeparatedByString:@"."];
    NSMutableArray *mutableArray = [NSMutableArray arrayWithArray:strings];
    for (int i = 0; i < mutableArray.count; i++) {
        NSInteger index = [mutableArray[i] length];
        mutableArray[i] = [NSString stringWithFormat:@"%@%@", array[index], mutableArray[i]];
    }
    return [mutableArray componentsJoinedByString:@""];
}

+ (NSString *)compareWithClientVersion:(NSString *)clientVersion serverVersion:(NSString *)serverVersion
{
    NSString *client = [self filling:clientVersion];
    NSString *server = [self filling:serverVersion];
    
    if ([client compare:server] == NSOrderedDescending) {
        return client;
    }
    
    if ([client compare:server] == NSOrderedAscending) {
        return server;
    }
}

@end
