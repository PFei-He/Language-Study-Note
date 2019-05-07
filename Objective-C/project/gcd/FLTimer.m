//
//  Copyright (c) 2019 faylib.top
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

#import "FLTimer.h"

@interface FLTimer ()

// 计时器仓库
@property (strong, nonatomic) NSMutableDictionary *timerContainer;

@end

@implementation FLTimer

#pragma mark - Setter / Getter Methods

// 计时器仓库
- (NSMutableDictionary *)timerContainer
{
    if (!_timerContainer) {
        _timerContainer = [[NSMutableDictionary alloc] init];
    }
    return _timerContainer;
}


#pragma mark - Private Methods

// 单例
+ (nonnull instancetype)sharedInstance
{
    static FLTimer *instance = nil;
    static dispatch_once_t timer_onceToken;
    dispatch_once(&timer_onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}


#pragma mark - Public Methods

// 开始计时器
+ (void)scheduledTimerWithName:(NSString *)name timeInterval:(double)timeInterval queue:(dispatch_queue_t)queue action:(dispatch_block_t)action
{
    // 队列
    if (queue == nil) {
        queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    }

    // 计时器
    dispatch_source_t timer = [FLTimer sharedInstance].timerContainer[name];
    if (!timer) {
        timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
        [[FLTimer sharedInstance].timerContainer setObject:timer forKey:name];
    }
    dispatch_source_set_timer(timer, DISPATCH_TIME_NOW, (int64_t)timeInterval * NSEC_PER_SEC, 0);
    dispatch_source_set_event_handler(timer, action);
    dispatch_resume(timer);
}

// 开始计时器
+ (void)scheduledTimerWithName:(NSString *)name timeInterval:(double)timeInterval queue:(dispatch_queue_t)queue repeat:(BOOL)repeat action:(dispatch_block_t)action
{
    if (repeat) {
        [FLTimer scheduledTimerWithName:name timeInterval:timeInterval queue:queue action:action];
    } else {
        dispatch_time_t time = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(timeInterval * NSEC_PER_SEC));
        if (queue == nil) {
            queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
        }
        dispatch_after(time, queue, action);
    }
}

// 暂停计时器
+ (void)suspendTimerWithName:(NSString *)name
{
    dispatch_source_t timer = [FLTimer sharedInstance].timerContainer[name];
    if (!timer) {
        return;
    }
    dispatch_suspend(timer);
}

// 恢复计时器
+ (void)resumeTimerWithName:(NSString *)name
{
    dispatch_source_t timer = [FLTimer sharedInstance].timerContainer[name];
    if (!timer) {
        return;
    }
    dispatch_resume(timer);
}

// 删除计时器
+ (void)cancelTimerWithName:(NSString *)name
{
    dispatch_source_t timer = [FLTimer sharedInstance].timerContainer[name];
    if (!timer) {
        return;
    }
    [[FLTimer sharedInstance].timerContainer removeObjectForKey:name];
    dispatch_source_cancel(timer);
}

// 判断计时器是否存在
+ (BOOL)existTimer:(NSString *)name
{
    if ([FLTimer sharedInstance].timerContainer[name]) {
        return YES;
    }
    return NO;
}

@end
