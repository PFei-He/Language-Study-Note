//
//  Block.h
//  o
//
//  Created by Fay on 2017/6/15.
//  Copyright © 2017年 Fay. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Block : NSObject

- (void)say:(void (^)(void (^end)(NSString *)))reply;

@end
