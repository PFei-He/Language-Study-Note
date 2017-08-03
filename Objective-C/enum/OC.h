//
//  OC.h
//  o
//
//  Created by Fay on 2017/8/2.
//  Copyright © 2017年 Fay. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, Color) {
    RED,
    ORANGE,
    YELLOW,
    GREEN,
    CYAN,
    BLUE,
    PURPLE,
};

@interface OC : NSObject

- (void)printColor:(Color)color;


@end
