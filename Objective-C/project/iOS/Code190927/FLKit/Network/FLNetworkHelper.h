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
#import "FLModel.h"

NS_ASSUME_NONNULL_BEGIN

/*!
 处理请求成功的通知
 
 @discussion 该方法用于接收请求成功的响应对象
 
            传入的对象用于接收通知
 
 @warning 使用通知操作网络请求时实现

        网络请求助手集成了代码块，代理，通知三种方式进行网络请求操作，使用时只需实现其中一种方式即可
 */
#define FLHandleRequestSuccessNotification(notification) \
- (void)handleRequestSuccessNotification:(NSNotification *)notification

/*!
 处理请求失败的通知
 
 @discussion 该方法用于接收请求失败的响应对象
 
            传入的对象用于接收通知
 
 @warning 使用通知操作网络请求时实现

        网络请求助手集成了代码块，代理，通知三种方式进行网络请求操作，使用时只需实现其中一种方式即可
 */
#define FLHandleRequestFailureNotification(notification) \
- (void)handleRequestFailureNotification:(NSNotification *)notification

/*!
 网络请求响应
 
 @discussion 该方法用于转化请求结束的响应对象，该对象包含有当前的请求任务，请求成功/失败的结果
 
 @return FLResponse 实例
 
 @warning 使用通知操作网络请求时实现

        网络请求助手集成了代码块，代理，通知三种方式进行网络请求操作，使用时只需实现其中一种方式即可
 */
#define kFLResponse \
[FLResponse modelWithJSON:notification.userInfo]

@class FLNetworkHelper;

@protocol FLNetworkHelperDelegate <NSObject>

@optional

/*!
 请求成功的代理方法
 
 @discussion 该方法用于接收请求成功的响应对象，该对象包含有当前的请求任务，请求成功的结果
 
 @param networkHelper 网络请求助手
 
 @param dataTask 接收响应的任务
 
 @param resultData 请求成功的结果
 
 @warning 使用代理操作网络请求时实现

        网络请求助手集成了代码块，代理，通知三种方式进行网络请求操作，使用时只需实现其中一种方式即可
 */
- (void)networkHelper:(FLNetworkHelper *)networkHelper dataTask:(NSURLSessionDataTask *)dataTask resultData:(id)resultData;

/*!
 请求失败的代理方法
 
 @discussion 该方法用于接收请求失败的响应对象，该对象包含有当前的请求任务，请求失败的结果
 
 @param networkHelper 网络请求助手
 
 @param dataTask 接收响应的任务
 
 @param error 请求失败的结果
 
 @warning 使用代理操作网络请求时实现

        网络请求助手集成了代码块，代理，通知三种方式进行网络请求操作，使用时只需实现其中一种方式即可
 */
- (void)networkHelper:(FLNetworkHelper *)networkHelper dataTask:(NSURLSessionDataTask *)dataTask error:(NSError *)error;

@end

/*!
 请求方法
 
 @discussion 定义了 HTTP 协议的请求方法，包括 GET，PUT，POST，DELETE 的请求类型
 */
typedef NS_ENUM(NSUInteger, FLNetworkRequestMethod) {
    FLNetworkRequestMethodGet,
    FLNetworkRequestMethodPut,
    FLNetworkRequestMethodPost,
    FLNetworkRequestMethodDelete
};

@interface FLNetworkHelper : NSObject

/*!
 请求方法
 
 @discussion 默认使用 GET 方法进行请求
 */
@property (nonatomic) FLNetworkRequestMethod requestMethod;

/*!
 请求地址
 
 @discussion 接收请求的服务器地址
 */
@property (nonatomic, copy) NSString *requestURL;

/*!
 请求头
 
 @discussion 发送到服务器的请求的头部参数，用于定义一些网络验证的参数
 */
@property (nonatomic, copy) NSDictionary *requestHeaders;

/*!
 请求参数
 
 @discussion 发送到服务器的请求的参数
 */
@property (nonatomic, copy) NSDictionary *requestParams;

/*!
 超时时隔
 
 @discussion 不设置默认请求时间为120秒
 */
@property (nonatomic) NSTimeInterval timeoutInterval;

/*!
 重试次数
 
 @discussion 不设置默认发送一次
 */
@property (nonatomic) NSInteger retryTimes;

/*!
 服务器信息
 */
@property (nonatomic, copy) NSArray<NSHTTPCookie *> *cookies;

/*!
 网络请求助手代理
 
 @warning 使用代理操作网络请求时实现

        网络请求助手集成了代码块，代理，通知三种方式进行网络请求操作，使用时只需实现其中一种方式即可
 */
@property (nonatomic, weak) id<FLNetworkHelperDelegate> delegate;

/*!
 发送请求
 
 @discussion 发送请求，并返回请求成功/失败的的结果
 
 @param success 请求成功的回调
 
 @param failure 请求失败的回调
 
 @field dataTask 接收响应的任务
 
 @field resultData 请求成功的结果
 
 @field error 请求失败的结果
 
 @return 发起的请求任务
 
 @warning 使用代码块操作网络请求时实现
 
        网络请求助手集成了代码块，代理，通知三种方式进行网络请求操作，使用时只需实现其中一种方式即可
 */
- (NSURLSessionDataTask *)sendRequestSuccess:(nullable void (^)(NSURLSessionDataTask *dataTask, id resultData))success failure:(nullable void (^)(NSURLSessionDataTask *dataTask, NSError *error))failure;

/*!
 发送请求
 
 @discussion 发送请求，并将请求结果返回到代理方法
 
            请求成功实现 `-networkHelper:dataTask:resultData:` 代理方法
 
            请求失败实现 `-networkHelper:dataTask:error:` 代理方法
 
 @return 发起的请求任务
 
 @warning 使用代理操作网络请求时实现

        网络请求助手集成了代码块，代理，通知三种方式进行网络请求操作，使用时只需实现其中一种方式即可
 */
- (NSURLSessionDataTask *)sendRequest;

/*!
 发送请求
 
 @discussion 发送请求，并使用通知发送请求结果
 
            请求成功使用 `FLHandleRequestSuccessNotification(notification)` 宏接收通知
 
            请求失败使用 `FLHandleRequestFailureNotification(notification)` 宏接收通知
 
 @param receiver 请求结果接收者
 
 @return 发起的请求任务
 
 @warning 使用通知操作网络请求时实现
 
        网络请求助手集成了代码块，代理，通知三种方式进行网络请求操作，使用时只需实现其中一种方式即可
 */
- (NSURLSessionDataTask *)sendRequestForReceiver:(id)receiver;

@end

@interface FLResponse : FLModel

/*!
 接收响应的任务
 
 @discussion 使用 kFLResponse 宏接收数据
 
 @warning 使用通知操作网络请求时实现

        网络请求助手集成了代码块，代理，通知三种方式进行网络请求操作，使用时只需实现其中一种方式即可
 */
@property (nonatomic, strong) NSURLSessionDataTask *dataTask;

/*!
 请求成功的结果
 
 @discussion 使用 kFLResponse 宏接收数据
 
 @warning 使用通知操作网络请求时实现
 
        网络请求助手集成了代码块，代理，通知三种方式进行网络请求操作，使用时只需实现其中一种方式即可
 */
@property (nonatomic, strong) id resultData;

/*!
 请求失败的结果
 
 @discussion 使用 kFLResponse 宏来接收数据
 
 @warning 使用通知操作网络请求时实现
 
        网络请求助手集成了代码块，代理，通知三种方式进行网络请求操作，使用时只需实现其中一种方式即可
 */
@property (nonatomic, strong) NSError *error;

@end

NS_ASSUME_NONNULL_END
