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
 定义当前打印的包名
 
 @discussion 用于区分当前打印的内容属性哪个类库或工程
 */
#define FL_LIB_NAME(name) \
+ (NSString *)libName { \
return name; \
}

/*!
 定义当前打印的类名
 
 @discussion 用于区分当前打印的内容属性哪个类
 */
#define FL_CLASS_NAME(name) \
+ (NSString *)className { \
return name; \
}

/*!
 调试打印
 */
#define FLLog(args...) \
[self debugLog:args, nil]

@interface NSObject (FLDebug)

/*！
 获取当前的调试状态
 */
@property (nonatomic, readonly) BOOL currentDebugMode;

/*!
 设置调试模式
 
 @param openOrNot 是否打开
 */
+ (void)setDebugMode:(BOOL)openOrNot;

/*!
 打印调试日志
 
 @param strings 日志内容
 */
- (void)debugLog:(NSString *)strings, ...;

@end

NS_ASSUME_NONNULL_END
