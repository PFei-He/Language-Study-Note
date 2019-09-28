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

#import <netdb.h>
#import <ifaddrs.h>
#import <arpa/inet.h>
#import <netinet/in.h>
#import <sys/socket.h>
#import <CoreFoundation/CoreFoundation.h>
#import <CoreTelephony/CTTelephonyNetworkInfo.h>
#import <SystemConfiguration/SystemConfiguration.h>
#import "NSObject+FLDebug.h"
#import "FLReachabilityHelper.h"

/*! 网络可达性状态改变的回调 */
typedef void(^FLReachabilityStatusCallbackBlock)(void);
/*! 网络可达性状态的回调 */
typedef void(^FLReachabilityStatusChangedBlock)(FLReachabilityStatus);

/*! 网络可达性状态改变的通知 */
NSString * const kFLReachabilityStatusChangedNotification = @"kFLReachabilityStatusChangedNotification";
/*! 代码块计数名 */
NSString * const kFLReachabilityStatusChangedBlock = @"kFLReachabilityStatusChangedBlock";

/*! 声明网络可达性状态发生变化回调的方法 */
static void FLReachabilityCallback(SCNetworkReachabilityRef ref, SCNetworkReachabilityFlags flags, void* info);
/*! 声明复制网络可达性状态改变回调的方法 */
static const void * FLReachabilityCallbackCopy(const void *info);
/*! 声明释放网络可达性状态改变回调的方法 */
static void FLReachabilityCallbackRelease(const void *info);

NSString * const FLReachabilityStatusConvert[6] = {
    [FLReachabilityStatusNone] = @"None",
    [FLReachabilityStatusWiFi] = @"WiFi",
    [FLReachabilityStatus2G] = @"2G",
    [FLReachabilityStatus3G] = @"3G",
    [FLReachabilityStatus4G] = @"4G",
    [FLReachabilityStatusUnknown] = @"Unknown"
};

#pragma mark -

@interface FLReachabilityHelper ()

// 代理数组
@property (nonatomic, strong) NSPointerArray *delegates;

// 监听者数组
@property (nonatomic, strong) NSMapTable *monitors;

// 代码块数组
@property (nonatomic, strong) NSMutableDictionary *blocks;

// 网络可达性句柄
@property (nonatomic, assign) SCNetworkReachabilityRef reachabilityRef;

// 上一个网络状态
@property (nonatomic, assign) FLReachabilityStatus previousStatus;

// 代码块计数
@property (nonatomic) NSInteger blocksCount;

// 代码块随机字符串
@property (nonatomic, copy) NSString *random;

@end

@implementation FLReachabilityHelper

FL_CLASS_NAME(@"REACHABILITY")

#pragma mark - Life Cycle

// 检查是否可以连接到指定主机域名
+ (instancetype)helperWithHostName:(NSString *)hostName
{
    FLReachabilityHelper *reachabilityHelper = NULL;
    SCNetworkReachabilityRef reachabilityRef = SCNetworkReachabilityCreateWithName(kCFAllocatorDefault, [hostName UTF8String]);
    if (reachabilityRef != NULL) {
        reachabilityHelper = [[self alloc] init];
        if (reachabilityHelper != NULL) {
            reachabilityHelper.reachabilityRef = reachabilityRef;
            reachabilityHelper.previousStatus = FLReachabilityStatusUnknown;
        } else {
            CFRelease(reachabilityRef);
        }
    }
    return reachabilityHelper;
}

// 检查是否可以连接到指定 IP 地址
+ (instancetype)helperWithAddress:(const struct sockaddr *)hostAddress
{
    FLReachabilityHelper *reachabilityHelper = NULL;
    SCNetworkReachabilityRef reachabilityRef = SCNetworkReachabilityCreateWithAddress(kCFAllocatorDefault, hostAddress);
    if (reachabilityRef != NULL) {
        reachabilityHelper = [[self alloc] init];
        if (reachabilityHelper != NULL) {
            reachabilityHelper.reachabilityRef = reachabilityRef;
            reachabilityHelper.previousStatus = FLReachabilityStatusUnknown;
        } else {
            CFRelease(reachabilityRef);
        }
    }
    return reachabilityHelper;
}

// 检查是否可以连接到默认路由
+ (instancetype)helper
{
    // 本机地址 (0.0.0.0)
    struct sockaddr_in zeroAddress;
    bzero(&zeroAddress, sizeof(zeroAddress));
    zeroAddress.sin_len = sizeof(zeroAddress);
    zeroAddress.sin_family = AF_INET;
    
    return [self helperWithAddress:(const struct sockaddr *)&zeroAddress];
}

// 代码块随机字符串
- (NSString *)random
{
    if (!_random) {
        char data[8];
        for (int x = 0; x < 8; data[x++] = (char)('a' + (arc4random_uniform(26))));
        _random = [[NSString alloc] initWithBytes:data length:8 encoding:NSUTF8StringEncoding];
    }
    return _random;
}

// 释放
- (void)dealloc
{
    [self stopMonitor];
    if (self.reachabilityRef != NULL) {
        CFRelease(self.reachabilityRef);
    }
}

#pragma mark - Getter / Setter Methods

// 代理数组
- (NSPointerArray *)delegates
{
    if (!_delegates) {
        _delegates = [NSPointerArray weakObjectsPointerArray];
    }
    return _delegates;
}

// 监听者数组
- (NSMapTable *)monitors
{
    if (!_monitors) {
        _monitors = [NSMapTable mapTableWithKeyOptions:NSPointerFunctionsStrongMemory valueOptions:NSPointerFunctionsWeakMemory];
    }
    return _monitors;
}

// 代码块数组
- (NSMutableDictionary *)blocks
{
    if (!_blocks) {
        _blocks = [NSMutableDictionary dictionary];
    }
    return _blocks;
}

// 设置代理
- (void)setDelegate:(id<FLReachabilityHelperDelegate>)delegate
{
    if ([delegate respondsToSelector:@selector(reachabilityHelper:reachabilityStatusChanged:)]) {
        [self.delegates addPointer:(__bridge void*)delegate];
	FLLog(@"[ MONITOR ] Added");
        FLLog([NSString stringWithFormat:@"[ CLASS ] %@", [delegate class]]);
        FLLog(@"[ USING ] Delegate");
    }
}

#pragma mark - Private Methods

// 当前状态
- (FLReachabilityStatus)currentStatus
{
    FLReachabilityStatus status = FLReachabilityStatusUnknown;
    SCNetworkReachabilityFlags flags;
    
    // 获取当前标记对应的网络可达性状态
    if (SCNetworkReachabilityGetFlags(self.reachabilityRef, &flags)) {
        status = [self networkStatusForFlags:flags];
    }
    
    return status;
}

// 根据标记获取网络状态
- (FLReachabilityStatus)networkStatusForFlags:(SCNetworkReachabilityFlags)flags
{
    if ((flags & kSCNetworkReachabilityFlagsReachable) == 0) { // 网络不通
	return FLReachabilityStatusNone;
    }

    // 网络可达性状态
    FLReachabilityStatus status = FLReachabilityStatusUnknown;

    if ((flags & kSCNetworkReachabilityFlagsConnectionRequired) == 0) { // 可连上目标主机
	status = FLReachabilityStatusWiFi;
    }

    if ((((flags & kSCNetworkReachabilityFlagsConnectionOnDemand) != 0) || (flags & kSCNetworkReachabilityFlagsConnectionOnTraffic) != 0)) { // 按需连接状态（CFSocketStream）
        if ((flags & kSCNetworkReachabilityFlagsInterventionRequired) == 0) { // 不需用户干预
            status = FLReachabilityStatusWiFi;
        }
    }

    if ((flags & kSCNetworkReachabilityFlagsIsWWAN) == kSCNetworkReachabilityFlagsIsWWAN) { // 使用的是 WWAN 网络接口（CFNetwork）
        
        // 获取当前数据网络的类型
        CTTelephonyNetworkInfo *info = [CTTelephonyNetworkInfo new];
        if ([info respondsToSelector:@selector(currentRadioAccessTechnology)]) {
            // 定义网络类型
            NSArray *type2G = @[CTRadioAccessTechnologyGPRS, CTRadioAccessTechnologyEdge, CTRadioAccessTechnologyCDMA1x];
            NSArray *type3G = @[CTRadioAccessTechnologyWCDMA, CTRadioAccessTechnologyHSDPA, CTRadioAccessTechnologyHSUPA, CTRadioAccessTechnologyCDMAEVDORev0, CTRadioAccessTechnologyCDMAEVDORevA, CTRadioAccessTechnologyCDMAEVDORevB, CTRadioAccessTechnologyeHRPD];
            NSArray *type4G = @[CTRadioAccessTechnologyLTE];
            
            // 当前网络类型
            NSString *generation = info.currentRadioAccessTechnology;
            
            // 获取当前网络状态
            if ([type2G containsObject:generation]) {
                status = FLReachabilityStatus2G;
            } else if ([type3G containsObject:generation]) {
                status = FLReachabilityStatus3G;
            } else if ([type4G containsObject:generation]){
                status = FLReachabilityStatus4G;
            }
        }
    }
    
    return status;
}

// 网络可达性状态改变
- (void)reachabilityChanged
{
    FLLog(@"[ STATUS ] Changed");
    FLLog([NSString stringWithFormat:@"[ TYPE ] %@", FLReachabilityStatusConvert[self.previousStatus]]);
    
    // 使用代码块回调
    dispatch_async(dispatch_get_main_queue(), ^{
        if (self.blocks.count != 0) {
            NSArray *keys = [[self.blocks allKeys] sortedArrayUsingSelector:@selector(compare:)];
            NSArray *monitors = [[self.monitors keyEnumerator] allObjects];
            for (NSString *key in keys) {
                if ([monitors containsObject:key]) {
                    FLReachabilityStatusChangedBlock block = self.blocks[key];
                    block(self.previousStatus);
                } else {
                    [self.blocks removeObjectForKey:key];
                }
            }
        }
    });
    
    // 使用代理回调
    dispatch_async(dispatch_get_main_queue(), ^{
        if (self.delegates.count != 0) {
            for (id<FLReachabilityHelperDelegate> delegate in self.delegates) {
                [delegate reachabilityHelper:self reachabilityStatusChanged:self.previousStatus];
            }
        }
    });
    
    // 使用通知回调
    dispatch_async(dispatch_get_main_queue(), ^{
        [[NSNotificationCenter defaultCenter] postNotificationName:kFLReachabilityStatusChangedNotification object:self];
    });
}

#pragma mark - Public Methods

// 打开网络监听
- (BOOL)startMonitor
{
    BOOL started = NO;
    
    // 回调网络可达性状态改变
    FLReachabilityStatusCallbackBlock callback = ^() {
        // 判断当前网络可达性状态是否发生了改变
        if (self.previousStatus != [self currentStatus]) {
            self.previousStatus = [self currentStatus];
            
            // 网络可达性状态改变时，发起回调
            [self reachabilityChanged];
        }
    };
    
    // 获取网络可达性上下文
    SCNetworkReachabilityContext context = {0, (__bridge void *)callback, FLReachabilityCallbackCopy, FLReachabilityCallbackRelease, NULL};
    
    // 设置网络状态改变的回调
    if (SCNetworkReachabilitySetCallback(self.reachabilityRef, FLReachabilityCallback, &context)) {
        if (SCNetworkReachabilityScheduleWithRunLoop(self.reachabilityRef, CFRunLoopGetCurrent(), kCFRunLoopDefaultMode)) {
            started = YES;
            
            FLLog(@"[ MONITOR ] Started");
    
            // 后台获取网络可达性的标记并设置回调
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
                SCNetworkReachabilityFlags flags;
                if (SCNetworkReachabilityGetFlags(self.reachabilityRef, &flags)) {
                    FLReachabilityCallback(self.reachabilityRef, flags, (__bridge void *)(callback));
                }
            });
        }
    }

    return started;
}

// 关闭网络监听
- (BOOL)stopMonitor
{
    BOOL stopped = NO;
    
    if (self.reachabilityRef != NULL) {
        if (SCNetworkReachabilityUnscheduleFromRunLoop(self.reachabilityRef, CFRunLoopGetCurrent(), kCFRunLoopDefaultMode)) {
            stopped = YES;
            
            FLLog(@"[ MONITOR ] Stopped");
        }
    }
    
    return stopped;
}

//#pragma mark -
//
//// 判断设备是否按需连接
//- (BOOL)connectionRequired
//{
//    SCNetworkReachabilityFlags flags;
//
//    if (SCNetworkReachabilityGetFlags(self.reachabilityRef, &flags)) {
//        return (flags & kSCNetworkReachabilityFlagsConnectionRequired);
//    }
//
//    return NO;
//}

#pragma mark -

// 监听网络可达性状态发生改变
- (void)addMonitor:(id)monitor reachabilityStatusChangedBlock:(void (^)(FLReachabilityStatus))block
{
    [self.monitors setObject:monitor forKey:[NSString stringWithFormat:@"%@_%@_%ld", kFLReachabilityStatusChangedBlock, self.random, (long)self.blocksCount]];
    [self.blocks setObject:block forKey:[NSString stringWithFormat:@"%@_%@_%ld", kFLReachabilityStatusChangedBlock, self.random, (long)self.blocksCount]];
    self.blocksCount++;
	
    FLLog(@"[ MONITOR ] Added");
    FLLog([NSString stringWithFormat:@"[ CLASS ] %@", [monitor class]]);
    FLLog(@"[ USING ] Block");
}

//
- (void)addMonitor：(id)monitor
{
    FLLog(@"[ MONITOR ] Added");
    FLLog([NSString stringWithFormat:@"[ CLASS ] %@", [monitor class]]);
    FLLog(@"[ USING ] Notification");
}

// 当前网络可达性状态
- (FLReachabilityStatus)currentReachabilityStatus
{
    return self.previousStatus;
}

@end

#pragma mark - Supporting Functions

// 网络可达性状态发生变化的回调
static void FLReachabilityCallback(SCNetworkReachabilityRef ref, SCNetworkReachabilityFlags flags, void* info) {
    FLReachabilityStatusCallbackBlock block = (__bridge FLReachabilityStatusCallbackBlock)info;
    block();
}

// 复制网络可达性状态改变的回调
static const void * FLReachabilityCallbackCopy(const void* info) {
    return Block_copy(info);
}

// 释放网络可达性状态改变的回调
static void FLReachabilityCallbackRelease(const void* info) {
    if (info) {
        Block_release(info);
    }
}
