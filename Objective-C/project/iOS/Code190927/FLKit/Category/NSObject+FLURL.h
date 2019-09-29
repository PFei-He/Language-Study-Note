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

@interface NSObject (FLURL)

/*!
 序列化参数
 
 @param parameters 需要转化的参数
 
 @return URL 格式化的字符串
 */
- (NSString *)serializeParameters:(NSDictionary *)parameters;

/*!
 将参数转为 URL 字符串格式
 
 @discussion 将已被 URL 格式化的字符串中的非法字符转为合法的格式，如中文字转化为 UTF-8
 
 @param parameter URL 格式化的字符串
 
 @return 符合 HTTP 请求格式的 URL 字符串
 */
- (NSString *)queryStringForURLParameter:(NSString *)parameter;

@end

NS_ASSUME_NONNULL_END
