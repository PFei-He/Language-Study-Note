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

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/*!
 添加网络可达性状态改变的监听者
 
 @discussion 此方法用于将监听者添加到网络可达性状态监听队列，所有实现此方法的类都会接收到网络可达性状态改变的消息
 
            传入的对象为监听者

            使用此宏时不需实现 `-addMonitor:` 方法
 
 @warning 使用通知监听网络可达性状态时实现
 
        网络可达性助手集成了代码块，代理，通知三种方式进行网络可达性状态监听，使用时只需实现其中一种方式即可
 */
#define kFLAddReachabilityStatusChangedObserver(observer) \
[[NSNotificationCenter defaultCenter] addObserver:observer selector:@selector(handleReachabilityStatusChangedNotification:) name:kFLReachabilityStatusChangedNotification object:nil]; \
FLLog(@"[ MONITOR ] Addid to reachability helper", @"[ USING ] Notification")

/*!
 移除网络可达性状态改变的监听者
 
 @discussion 此方法用于将监听者从网络可达性状态监听队列移除
 
            传入的对象为监听者
 
            使用此宏时不需实现 `-removeMonitor:` 方法
 
 @warning 使用通知监听网络可达性状态时实现
 
        网络可达性助手集成了代码块，代理，通知三种方式进行网络可达性状态监听，使用时只需实现其中一种方式即可
 */
#define kFLRemoveReachabilityStatusChangedObserver(observer) \
[[NSNotificationCenter defaultCenter] removeObserver:observer name:kFLReachabilityStatusChangedNotification object:nil]; \
FLLog(@"[ MONITOR ] Removed from reachability helper", @"[ USING ] Notification")

/*!
 处理网络可达性状态改变的通知
 
 @discussion 该方法用于接收网络可达性状态发生改变的消息
 
            传入的对象用于接收通知
 
 @warning 使用通知监听网络可达性状态时实现
 
        网络可达性助手集成了代码块，代理，通知三种方式进行网络可达性状态监听，使用时只需实现其中一种方式即可
 */
#define FLHandleReachabilityStatusChangedNotification(notification) \
- (void)handleReachabilityStatusChangedNotification:(NSNotification *)notification

/*!
 获取当前网络可达性状态
 
 @discussion 该方法用于接收当前已发生了改变的网络可达性状态
 
            传入的对象用于接收网络可达性状态
 
 @warning 使用通知监听网络可达性状态时实现
 
        网络可达性助手集成了代码块，代理，通知三种方式进行网络可达性状态监听，使用时只需实现其中一种方式即可
 */
#define kFLGetCurrentReachabilityStatus(status) \
FLReachabilityHelper *reachabilityHelper = notification.object; \
FLReachabilityStatus status = [reachabilityHelper currentReachabilityStatus]

/*!
 网络可达性状态
 */
typedef NS_ENUM(NSUInteger, FLReachabilityStatus) {
    FLReachabilityStatusNone = 0,   // 无网络
    FLReachabilityStatusWiFi,       // 通过 WiFi 连接
    FLReachabilityStatus2G,         // 通过 2G 连接
    FLReachabilityStatus3G,         // 通过 3G 连接
    FLReachabilityStatus4G,         // 通过 4G 连接
    FLReachabilityStatusUnknown     // 未知网络状态
};

/*!
 网络可达性状态转化
 
 @discussion 将当前网络可达性状态转化为字符串
 */
extern NSString * _Nonnull const FLReachabilityStatusConvert[];

/*!
 网络可达性状态改变的通知名
 
 @discussion 使用通知监听网络可达性状态时监听此通知名，所有监听此通知名的类都会接收到网络可达性状态改变的消息
 
 @warning 使用通知监听网络可达性状态时实现
 
        网络可达性助手集成了代码块，代理，通知三种方式进行网络可达性状态监听，使用时只需实现其中一种方式即可
 */
extern NSString * const kFLReachabilityStatusChangedNotification;

@class FLReachabilityHelper;

@protocol FLReachabilityHelperDelegate <NSObject>

/*!
 网络可达性状态发生改变的代理方法
 
 @discussion 此方法用于接收网络可达性状态改变的消息，由一个代理的队列管理，所有实现此代理方法的类都会接收到网络可达性状态改变的消息
 
 @param reachabilityHelper 网络可达性助手
 
 @param status 网络可达性状态
 
 @warning 使用代理监听网络可达性状态时实现
 
        网络可达性助手集成了代码块，代理，通知三种方式进行网络可达性状态监听，使用时只需实现其中一种方式即可
 */
- (void)reachabilityHelper:(FLReachabilityHelper *)reachabilityHelper reachabilityStatusChanged:(FLReachabilityStatus)status;

@end

@interface FLReachabilityHelper : NSObject

/*!
 网络可达性助手代理
 
 @discussion 此代理将被作为监听者添加到网络可达性状态监听队列
 
            若此监听者被从内存中释放，监听队列会自动移除此监听者，不需手动管理
 
 @warning 使用代理监听网络可达性状态时实现
 
        网络可达性助手集成了代码块，代理，通知三种方式进行网络可达性状态监听，使用时只需实现其中一种方式即可
 */
@property (nonatomic, weak) id<FLReachabilityHelperDelegate> delegate;

#pragma mark -

/*!
 检查是否可以连接到指定主机域名
 
 @param hostName 指定主机域名
 
 @return FLReachabilityHelper 实例
 */
+ (instancetype)helperWithHostName:(NSString *)hostName;

/*!
 检查是否可以连接到指定 IP 地址
 
 @param address 指定 IP 地址
 
 @return FLReachabilityHelper 实例
 */
+ (instancetype)helperWithAddress:(const struct sockaddr *)address;

/*!
 检查是否可以连接到默认路由
 
 @return FLReachabilityHelper 实例
 */
+ (instancetype)helper;

#pragma mark -

/*!
 打开网络可达性监听
 
 @return 打开监听是否成功
 */
- (BOOL)startMonitor;

/*!
 关闭网络可达性监听
 
 @return 关闭监听是否成功
 */
- (BOOL)stopMonitor;

#pragma mark -

/*!
 添加网络可达性状态改变的监听者并设置回调
 
 @discussion 此方法用于将监听者添加到网络可达性状态监听队列，所有实现此方法的类都会接收到网络可达性状态改变的消息
 
            若此监听者被从内存中释放，监听队列会自动移除此监听者，不需手动管理
 
 @param monitor 网络可达性监听者
 
 @param block 网络可达性状态发生改变时的回调
 
 @field status 网络可达性状态
 
 @warning 使用代码块监听网络可达性状态时实现
 
        网络可达性助手集成了代码块，代理，通知三种方式进行网络可达性状态监听，使用时只需实现其中一种方式即可
 */
- (void)addMonitor:(id)monitor reachabilityStatusChangedBlock:(nonnull void (^)(FLReachabilityStatus status))block;

/*!
 添加网络可达性状态改变的监听者
 
 @discussion 此方法用于将监听者添加到网络可达性状态监听队列，所有实现此方法的类都会接收到网络可达性状态改变的消息

            使用此方法时不需实现 `kFLAddReachabilityStatusChangedObserver(observer)` 宏
 
 @param monitor 网络可达性监听者
 
 @warning 使用通知监听网络可达性状态时实现
 
        网络可达性助手集成了代码块，代理，通知三种方式进行网络可达性状态监听，使用时只需实现其中一种方式即可
 */
- (void)addMonitor:(id)monitor;

/*!
 移除网络可达性状态改变的监听者
 
 @discussion 此方法用于将监听者从网络可达性状态监听队列移除
 
            使用此方法时不需实现 `kFLRemoveReachabilityStatusChangedObserver(observer)` 宏
 
 @param monitor 网络可达性监听者
 
 @warning 使用通知监听网络可达性状态时实现
 
        网络可达性助手集成了代码块，代理，通知三种方式进行网络可达性状态监听，使用时只需实现其中一种方式即可
 */
- (void)removeMonitor:(id)monitor;

/*!
 当前网络可达性状态
 
 @return 网络可达性状态
 
 @warning 使用通知监听网络可达性状态时实现
 
        网络可达性助手集成了代码块，代理，通知三种方式进行网络可达性状态监听，使用时只需实现其中一种方式即可
 */
- (FLReachabilityStatus)currentReachabilityStatus;

@end

NS_ASSUME_NONNULL_END
