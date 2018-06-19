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

@interface FLTimer : NSObject

/* 禁止使用 */
- (nonnull instancetype)init NS_UNAVAILABLE;
+ (nonnull instancetype)new NS_UNAVAILABLE;

/**
 开始计时器
 @param name 计时器名字
 @param timeInterval 超时时隔
 @param queue 所在线程
 @param action 执行的操作
 */
+ (void)scheduledTimerWithName:(nonnull NSString *)name timeInterval:(double)timeInterval queue:(nullable dispatch_queue_t)queue action:(nullable dispatch_block_t)action;

/**
 开始计时器
 @param name 计时器名字
 @param timeInterval 超时时隔
 @param queue 所在线程
 @param repeat 是否重复执行
 @param action 执行的操作
 */
+ (void)scheduledTimerWithName:(nonnull NSString *)name timeInterval:(double)timeInterval queue:(nullable dispatch_queue_t)queue repeat:(BOOL)repeat action:(nullable dispatch_block_t)action;

/**
 暂停计时器
 @param name 计时器名字
 */
+ (void)suspendTimerWithName:(nonnull NSString *)name;

/**
 恢复计时器
 @param name 计时器名字
 */
+ (void)resumeTimerWithName:(nonnull NSString *)name;

/**
 删除计时器
 @param name 计时器名字
 */
+ (void)cancelTimerWithName:(nonnull NSString *)name;

/**
 判断计时器是否存在
 @param name 计时器名字
 */
+ (BOOL)existTimer:(nonnull NSString *)name;

@end
