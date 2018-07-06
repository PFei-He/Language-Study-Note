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

#import "FLAlert.h"
#import <objc/runtime.h>

///调试模式
static BOOL DEBUG_MODE = NO;

@implementation FLAlert

#pragma mark - Private Methods

/**
 创建Block类型
 */
static Class BlockClass() {
    static Class blockClass;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        void (^tempBlock)() = [^{} copy];
        blockClass = [tempBlock class];
        while (class_getSuperclass(blockClass) && class_getSuperclass(blockClass) != [NSObject class]) {
            blockClass = class_getSuperclass(blockClass);
        }
    });
    return blockClass;
}

/**
 检测对象类型是否为Block
 */
BOOL FLDetectBlockObject(void *object) {
    Class blockClass = BlockClass();
    Class candidate = object_getClass((__bridge id)object);
    return [candidate isSubclassOfClass:blockClass];
}

//通过数组的内容创建提示框
+ (UIAlertController *)alertFromArray:(NSArray *)array
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:array[0] message:array[1] preferredStyle:UIAlertControllerStyleAlert];
    
    // 检测对象类型
    for (int i = 2; i < array.count; i++) {
        if (i % 2 == 0 && ![array[i] isKindOfClass:[NSString class]]) {
            if (DEBUG_MODE) {
                NSLog(@"[ ALERT ][ ERROR ] Value must be type of string.");
                NSLog(@"[ -> ][ INFO ] value number %d", i);
            }
            return alert;
        } else if (i % 2 != 0 && !FLDetectBlockObject((__bridge void *)(array[i]))) {
            if (DEBUG_MODE) {
                NSLog(@"[ ALERT ][ ERROR ] Value must be type of block.");
                NSLog(@"[ -> ][ INFO ] value number %d", i);
            }
            return alert;
        }
    }
    
    for (int i = 3; i < array.count; i += 2) {
        
        // 通过Block获取按钮的点击事件并于按钮点击时回调
        void (^callback)(void) = array[i];
        UIAlertAction *alertAction = [UIAlertAction actionWithTitle:array[i-1] style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [alert dismissViewControllerAnimated:YES completion:NULL];
            
            // 响应按钮点击事件（Block回调）
            callback();
        }];
        [alert addAction:alertAction];
    }
    
    return alert;
}


#pragma mark - Public Methods

//创建提示框
+ (UIAlertController *)alertWithMessages:(id)message, ...
{
    NSMutableArray *allObj = [NSMutableArray array];
    
    // 添加标题到数组
    [allObj addObject:message];
    
    // 添加除标题外的其它参数到数组
    // 获取所有的可变参数
    va_list list;
    va_start(list, message);
    while (message != nil) {
        id obj = va_arg(list, id);
        if (!obj) break;
        [allObj addObject:obj];
    }
    
    return [FLAlert alertFromArray:allObj];
}

//弹出提示框
+ (void)showAboveController:(UIViewController *)viewController withMessages:(id)message, ...
{
    NSMutableArray *allObj = [NSMutableArray array];
    
    // 添加标题到数组
    [allObj addObject:message];
    
    // 添加除标题外的其它参数到数组
    // 获取所有的可变参数
    va_list list;
    va_start(list, message);
    while (message != nil) {
        id obj = va_arg(list, id);
        if (!obj) break;
        [allObj addObject:obj];
    }
    
    [viewController presentViewController:[FLAlert alertFromArray:allObj] animated:YES completion:NULL];
}

//弹出提示框
+ (void)showAboveController:(UIViewController *)viewController withMessages:(NSArray *)messages callback:(QuQFunction (^)(NSInteger))callback
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:messages[0] message:messages[1] preferredStyle:UIAlertControllerStyleAlert];
    
    for (int i = 2; i < messages.count; i++) {
        
        UIAlertAction *alertAction = [UIAlertAction actionWithTitle:messages[i] style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [alert dismissViewControllerAnimated:YES completion:NULL];
            
            // 响应按钮点击事件（Block回调）
            callback(i-2)();
        }];
        [alert addAction:alertAction];
    }
    
    [viewController presentViewController:alert animated:YES completion:NULL];
}

//调试模式
+ (void)debugMode:(BOOL)openOrNot
{
    DEBUG_MODE = openOrNot;
}

@end
