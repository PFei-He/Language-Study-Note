//
//  Copyright (c) 2018 faylib.top
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

#import <Foundation/Foundation.h>

@interface FLDevice : NSObject

/**
 系统版本号
 
 @return 系统版本号
 */
+ (NSString *)systemVersion;

/**
 应用版本号
 
 @return 应用版本号
 */
+ (NSString *)appVersion;

/**
 应用构建号
 
 @return 应用构建号
 */
+ (NSString *)appBuildVersion;

/**
 应用更新检测
 
 @param serverVersion 服务器的应用版本号
 @return 应用是否有可用更新
 */
+ (BOOL)updateDetection:(NSString *)serverVersion;

/**
 越狱检测
 
 @return 设备是否处于越狱状态
 */
+ (BOOL)isJailbroken;

/**
 调试模式
 
 @param openOrNot 打开或关闭
 */
+ (void)debugMode:(BOOL)openOrNot;

@end
