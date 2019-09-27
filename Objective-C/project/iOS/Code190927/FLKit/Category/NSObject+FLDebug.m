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

#import "NSObject+FLDebug.h"
#import <objc/runtime.h>

@implementation NSObject (FLDebug)

static char const * const currentDebugModeKey;

@dynamic currentDebugMode;

#pragma mark - Getter / Setter Methods

// 调试模式 Getter 方法
- (BOOL)currentDebugMode
{
    return [objc_getAssociatedObject(self, &currentDebugModeKey) boolValue];
}

// 调试模式 Setter 方法
- (void)setCurrentDebugMode:(BOOL)currentDebugMode
{
    objc_setAssociatedObject(self, &currentDebugModeKey, [NSNumber numberWithBool:currentDebugMode], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

#pragma mark - Public Methods

// 识别码
+ (NSString *)libName
{
    return @"FayLIB";
}

// 识别码
+ (NSString *)className
{
    return @"CLASS";
}

// 设置调试模式
+ (void)setDebugMode:(BOOL)debugMode
{
    [self setCurrentDebugMode:debugMode];
}

// 打印调试信息
- (void)debugLog:(NSString *)strings, ...
{
    if (self.class.currentDebugMode) {
        // 获取包名和类名
        NSString *lib = [[self class] libName];
        NSString *cls = [[self class] className];
        
        // 打印第一个元素
        if ([strings hasPrefix:@"[ "]) NSLog(@"[ %@ ][ %@ ]%@.", lib, cls, strings);
        else NSLog(@"[ %@ ][ %@ ][ DEBUG ] %@.", lib, cls, strings);
        
        // 获取第一个元素内存地址
        va_list list;
        va_start(list, strings);
        while (strings != nil) {
            // 获取剩余的元素
            NSString *string = va_arg(list, NSString *);
            
            // 没有剩余的元素，跳出
            if (!string) break;
            
            // 打印剩余的元素
            if ([strings hasPrefix:@"[ "]) NSLog(@"[ %@ ][ %@ ]%@.", lib, cls, string);
            else NSLog(@"[ %@ ][ %@ ][ DEBUG ] %@.", lib, cls, string);
        }
        va_end(list);
    }
}

@end
