//
//  Block.h
//  o
//
//  Created by Fay on 2017/5/31.
//  Copyright © 2017年 Fay. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Block : NSObject

- (void)say:(NSString *(^)(NSString *content))reply;


@end
