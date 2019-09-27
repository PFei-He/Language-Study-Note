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

#import "FLNetworkHelper.h"
#import "NSObject+FLDebug.h"

static dispatch_queue_t network_helper_queue() {
    static dispatch_queue_t network_helper_creation_queue;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        network_helper_creation_queue = dispatch_queue_create("top.faylib.network.hepler.creation", DISPATCH_QUEUE_SERIAL);
    });
    
    return network_helper_creation_queue;
}

@interface FLNetworkHelper ()

// 请求重试次数计数
@property (nonatomic) NSInteger retryTimesCount;

// 请求成功通知名
@property (nonatomic, copy) NSString *successNotificationName;

// 请求失败通知名
@property (nonatomic, copy) NSString *failureNotificationName;

// 请求接收者
@property (nonatomic, strong) id receiver;

@end

@implementation FLNetworkHelper

FL_CLASS_NAME(@"NETWORK")

NSString * const FLNetworkRequestMethodConvert[4] = {
    [FLNetworkRequestMethodGet] = @"GET",
    [FLNetworkRequestMethodPut] = @"PUT",
    [FLNetworkRequestMethodPost] = @"POST",
    [FLNetworkRequestMethodDelete] = @"DELETE"
};

#pragma mark - Getter / Setter Methods

// 超时时隔
- (NSTimeInterval)timeoutInterval
{
    if (_timeoutInterval == 0) {
        return 120;
    }
    return _timeoutInterval;
}

// 服务器信息
- (NSArray<NSHTTPCookie *> *)cookies
{
    NSHTTPCookieStorage *storage = [NSHTTPCookieStorage sharedHTTPCookieStorage];
    return [storage cookies];
}

#pragma mark - Private Methods

// 发送请求
- (NSURLSessionDataTask *)requestWithMethod:(NSString *)method URLString:(NSString *)URLString body:(id)body success:(void (^)(NSURLSessionDataTask * _Nonnull, id _Nullable))success failure:(void (^)(NSURLSessionDataTask * _Nonnull, NSError * _Nonnull))failure
{
    // 请求次数减一
    self.retryTimesCount--;
    
    FLLog(@"[ REQUEST ] Sending",
          (self.retryTimes - self.retryTimesCount == 1) ? @"[ STATUS ] Start" : @"[ STATUS ] Retry",
          [NSString stringWithFormat:@"[ COUNT ] %@", @(self.retryTimes - self.retryTimesCount)],
          [NSString stringWithFormat:@"[ URL ] %@", URLString],
          [NSString stringWithFormat:@"[ METHOD ] %@", method],
          [NSString stringWithFormat:@"[ TIMEOUT ] %@", @(self.timeoutInterval)],
          [NSString stringWithFormat:@"[ HEADERS ] %@", self.requestHeaders],
          [NSString stringWithFormat:@"[ PARAMS ] %@", body]);
    
    // 创建请求
    NSURLSession *session = [NSURLSession sharedSession];
    NSURL *url = [NSURL URLWithString:self.requestURL];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    // 设置请求方法
    request.HTTPMethod = FLNetworkRequestMethodConvert[self.requestMethod];
    
    // 设置超时时隔
    request.timeoutInterval = self.timeoutInterval;
    
    // 设置请求头
    [self.requestHeaders enumerateKeysAndObjectsUsingBlock:^(id _Nonnull field, id _Nonnull value, BOOL * _Nonnull stop) {
        [request setValue:value forHTTPHeaderField:field];
    }];
    
    // 设置请求参数
    request.HTTPBody = [[self serializeParameters:self.requestParams] dataUsingEncoding:NSUTF8StringEncoding];
    
    // 设置数据请求
    __block NSURLSessionDataTask *dataTask = nil;
    dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) { // 请求失败
            if (self.retryTimesCount < 1) {
                // 使用代码块回调
                dispatch_async(dispatch_get_main_queue(), ^{
                    if (failure) failure(dataTask, error);
                });
                
                // 使用代理回调
                dispatch_async(dispatch_get_main_queue(), ^{
                    if ([self.delegate respondsToSelector:@selector(networkHelper:dataTask:error:)]) [self.delegate networkHelper:self dataTask:dataTask error:error];
                });
                
                // 使用通知回调
                dispatch_async(dispatch_get_main_queue(), ^{
                    [[NSNotificationCenter defaultCenter] postNotificationName:self.failureNotificationName object:self userInfo:@{@"dataTask": dataTask, @"error": error}];
                    [[NSNotificationCenter defaultCenter] removeObserver:self.receiver name:self.successNotificationName object:nil];
                    [[NSNotificationCenter defaultCenter] removeObserver:self.receiver name:self.failureNotificationName object:nil];
                });
            } else { // 发起重试
                [self requestWithMethod:method URLString:URLString body:body success:success failure:failure];
            }
        } else { // 请求成功
            // 解析 JSON
            NSDictionary *resultData = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            
            // 使用代码块回调
            dispatch_async(dispatch_get_main_queue(), ^{
                if (success) success(dataTask, resultData);
            });
            
            // 使用代理回调
            dispatch_async(dispatch_get_main_queue(), ^{
                if ([self.delegate respondsToSelector:@selector(networkHelper:dataTask:resultData:)]) [self.delegate networkHelper:self dataTask:dataTask resultData:resultData];
            });
            
            // 使用通知回调
            dispatch_async(dispatch_get_main_queue(), ^{
                [[NSNotificationCenter defaultCenter] postNotificationName:self.successNotificationName object:self userInfo:@{@"dataTask": dataTask, @"resultData": resultData}];
                [[NSNotificationCenter defaultCenter] removeObserver:self.receiver name:self.successNotificationName object:nil];
                [[NSNotificationCenter defaultCenter] removeObserver:self.receiver name:self.failureNotificationName object:nil];
            });
        }
    }];
    
    // 发送请求
    [dataTask resume];
    
    // 返回数据请求
    return dataTask;
}

// 序列化参数
- (NSString *)serializeParameters:(NSDictionary *)parameters
{
    NSMutableArray *pairs = NSMutableArray.array;
    for (NSString *key in parameters.keyEnumerator) {
        id value = parameters[key];
        if ([value isKindOfClass:[NSDictionary class]]) {
            for (NSString *subKey in value) {
                [pairs addObject:[NSString stringWithFormat:@"%@[%@]=%@", key, subKey, [self queryStringForURLParameter:[value objectForKey:subKey]]]];
            }
        } else if ([value isKindOfClass:[NSArray class]]) {
            for (NSString *subValue in value) {
                [pairs addObject:[NSString stringWithFormat:@"%@[]=%@", key, [self queryStringForURLParameter:subValue]]];
            }
        } else {
            [pairs addObject:[NSString stringWithFormat:@"%@=%@", key, [self queryStringForURLParameter:[NSString stringWithFormat:@"%@", value]]]];
        }
    }
    return [pairs componentsJoinedByString:@"&"];
}

// 将参数转为 URL 字符串格式
- (NSString *)queryStringForURLParameter:(NSString *)parameter
{
    return [parameter stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
}

#pragma mark - Public Methods

// 发送请求(代码块)
- (NSURLSessionDataTask *)sendRequestSuccess:(void (^)(NSURLSessionDataTask * _Nonnull, id _Nonnull))success failure:(void (^)(NSURLSessionDataTask * _Nonnull, NSError * _Nonnull))failure
{
    // 设置数据请求
    __block NSURLSessionDataTask *dataTask = nil;
    dispatch_sync(network_helper_queue(), ^{
        // 设置重试计数
        self.retryTimesCount = self.retryTimes = self.retryTimes < 1 ? 1 : self.retryTimes;
        
        // 发送
        dataTask = [self requestWithMethod:FLNetworkRequestMethodConvert[self.requestMethod] URLString:self.requestURL body:self.requestParams success:success failure:failure];
    });
    
    // 返回数据请求
    return dataTask;
}

// 发送请求(代理)
- (NSURLSessionDataTask *)sendRequest
{
    // 设置数据请求
    __block NSURLSessionDataTask *dataTask = nil;
    dispatch_sync(network_helper_queue(), ^{
        // 设置重试计数
        self.retryTimesCount = self.retryTimes = self.retryTimes < 1 ? 1 : self.retryTimes;
        
        // 发送
        dataTask = [self requestWithMethod:FLNetworkRequestMethodConvert[self.requestMethod] URLString:self.requestURL body:self.requestParams success:nil failure:nil];
    });
    
    // 返回数据请求
    return dataTask;
}

// 发送请求(通知)
- (NSURLSessionDataTask *)sendRequestForReceiver:(id)receiver
{
    // 设置数据请求
    __block NSURLSessionDataTask *dataTask = nil;
    dispatch_sync(network_helper_queue(), ^{
        // 设置请求接收者
        self.receiver = receiver;
        
        // 生成8位随机字符串
        char data[8];
        for (int x = 0; x < 8; data[x++] = (char)('a' + (arc4random_uniform(26))));
        NSString *random = [[NSString alloc] initWithBytes:data length:8 encoding:NSUTF8StringEncoding];
        
        // 设置请求成功通知名并添加监听
        self.successNotificationName = [NSString stringWithFormat:@"%@%@RequestSuccessNotification", random, [receiver class]];
        [[NSNotificationCenter defaultCenter] addObserver:receiver selector:NSSelectorFromString(@"handleRequestSuccessNotification:") name:self.successNotificationName object:nil];
        
        // 设置请求失败通知名并添加监听
        self.failureNotificationName = [NSString stringWithFormat:@"%@%@RequestFailureNotification", random, [receiver class]];
        [[NSNotificationCenter defaultCenter] addObserver:receiver selector:NSSelectorFromString(@"handleRequestFailureNotification:") name:self.failureNotificationName object:nil];
        
        // 设置重试计数
        self.retryTimesCount = self.retryTimes = self.retryTimes < 1 ? 1 : self.retryTimes;
        
        // 发送
        dataTask = [self requestWithMethod:FLNetworkRequestMethodConvert[self.requestMethod] URLString:self.requestURL body:self.requestParams success:nil failure:nil];
    });
    
    // 返回数据请求
    return dataTask;
}

@end

@implementation FLResponse

@end
