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
 
 @discussion 传入的对象用于添加到网络可达性状态改变的监听者队列
 
 @warning 使用通知接收请求结果时使用
 
        网络可达性助手使用了代码块，代理，通知三种方式进行请求回调，只需要使用其中一种方式即可
 */
#define kFLAddReachabilityStatusChangedObserver(observer) \
[[NSNotificationCenter defaultCenter] addObserver:observer selector:@selector(handleReachabilityStatusChangedNotification:) name:kFLReachabilityStatusChangedNotification object:nil]

/*!
 移除网络可达性状态改变的监听者
 
 @discussion 传入的对象用于移除到网络可达性状态改变的监听者队列
 
 @warning 使用通知接收请求结果时使用
 
        网络可达性助手使用了代码块，代理，通知三种方式进行请求回调，只需要使用其中一种方式即可
 */
#define kFLRemoveReachabilityStatusChangedObserver(observer) \
[[NSNotificationCenter defaultCenter] removeObserver:observer name:kFLReachabilityStatusChangedNotification object:nil]

/*!
 处理网络可达性状态改变时的通知
 
 @discussion 传入的对象用于接收通知的回调
 
 @warning 使用通知接收请求结果时使用
 
        网络可达性助手使用了代码块，代理，通知三种方式进行请求回调，只需要使用其中一种方式即可
 */
#define FLHandleReachabilityStatusChangedNotification(notification) \
- (void)handleReachabilityStatusChangedNotification:(NSNotification *)notification

/*!
 获取当前网络可达性状态
 
 @discussion 传入的对象用于接收当前网络可达性状态
 
 @warning 使用通知接收请求结果时使用
 
        网络可达性助手使用了代码块，代理，通知三种方式进行请求回调，只需要使用其中一种方式即可
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
 网络可达性状态改变的通知
 
 @discussion 使用通知接收状态改变时监听此通知名，此通知名由一个通知的队列管理，所有监听此通知名的类都会接收到通知
 
 @warning 使用通知接收请求结果时使用
 
        网络可达性助手使用了代码块，代理，通知三种方式进行请求回调，只需要使用其中一种方式即可
 */
extern NSString * const kFLReachabilityStatusChangedNotification;

@class FLReachabilityHelper;

@protocol FLReachabilityHelperDelegate <NSObject>

/*!
 网络可达性状态发生改变的代理方法
 
 @discussion 此方法用于接收网络可达性状态改变的消息，由一个代理的队列管理，所有实现此代理方法的类都会接收到消息
 
 @param reachabilityHelper 网络可达性助手实例
 
 @param status 网络可达性状态
 
 @warning 使用代理接收网络状态时调用
 
        网络可达性助手使用了代码块，代理，通知三种方式进行请求回调，只需要使用其中一种方式即可
 */
- (void)reachabilityHelper:(FLReachabilityHelper *)reachabilityHelper reachabilityStatusChanged:(FLReachabilityStatus)status;

@end

@interface FLReachabilityHelper : NSObject

/*!
 网络可达性助手代理
 
 @warning 使用代理接收请求结果时使用
 
        网络可达性助手使用了代码块，代理，通知三种方式进行请求回调，只需要使用其中一种方式即可
 */
@property (nonatomic, weak) id<FLReachabilityHelperDelegate> delegate;

#pragma mark -

/*!
 检查是否可以连接到指定主机域名
 
 @param hostName 指定主机域名
 
 @return FLReachabilityHelper 网络可达性助手实例
 */
+ (instancetype)helperWithHostName:(NSString *)hostName;

/*!
 检查是否可以连接到指定主机 IP 地址
 
 @param hostAddress 指定 IP 地址
 
 @return FLReachabilityHelper 网络可达性助手实例
 */
+ (instancetype)helperWithAddress:(const struct sockaddr *)hostAddress;

/*!
 检查是否可以连接到默认路由
 
 @return FLReachabilityHelper 网络可达性助手实例
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

//#pragma mark -
//
///*!
// 判断设备是否按需连接
//
// @return 当前网络状态是否按需请求
// */
//- (BOOL)connectionRequired;

#pragma mark -

/*!
 监听网络状态发生改变
 
 @discussion 此方法用于添加监听者到网络可达性状态监听队列，网络可达性状态改变时，所有实现此方法的类都会接收到消息
 
 @param monitor 网络可达性监听者
 
 @param block 网络可达性状态发生改变时的回调
 
 @field status 网络可达性状态
 
 @warning 使用代码块接收网络状态时调用
 
        网络可达性助手使用了代码块，代理，通知三种方式进行请求回调，只需要使用其中一种方式即可
 */
- (void)addMonitor:(id)monitor reachabilityStatusChangedBlock:(nonnull void (^)(FLReachabilityStatus status))block;

/*!
 当前网络状态
 
 @return 网络状态
 
 @warning 使用通知接收网络状态时调用
 
        网络可达性助手使用了代码块，代理，通知三种方式进行请求回调，只需要使用其中一种方式即可
 */
- (FLReachabilityStatus)currentReachabilityStatus;

@end

NS_ASSUME_NONNULL_END
