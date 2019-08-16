//
//  v.h
//  demo2
//
//  Created by Mac on 2019/8/10.
//  Copyright © 2019 FayLib. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface version : NSObject

+ (NSString *)compareWithClientVersion:(NSString *)clientVersion serverVersion:(NSString *)serverVersion;

@end

NS_ASSUME_NONNULL_END
