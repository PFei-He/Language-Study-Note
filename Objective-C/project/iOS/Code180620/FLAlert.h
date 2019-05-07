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

#import <UIKit/UIKit.h>

@interface FLAlert : NSObject

/**
 创建提示框

 [QuQAlert alertWithMessages:@"标题", @"内容", @"按钮一", ^{NSLog(@"事件一");}, @"按钮二", ^{NSLog(@"事件二");}, nil];

 @param message 提示框展示的信息，可变参数。第一个参数为标题，第二个参数为内容，第三个参数开始，奇数为按钮标题，偶数为按钮事件。
 @warning Objective-C语法中，可变参数要以 `nil` 关键字结尾作为最后一个参数，表示结束赋值。
 */
+ (UIAlertController *)alertWithMessages:(id)message, ...;

/**
 弹出提示框

 [QuQAlert showAboveController:ViewController withMessages:@"标题", @"内容", @"按钮一", ^{NSLog(@"事件一");}, @"按钮二", ^{NSLog(@"事件二");}, nil];

 @param viewController 需要显示提示框的视图控制器。
 @param message 提示框展示的信息，可变参数。第一个参数为标题，第二个参数为内容，第三个参数开始，奇数为按钮标题，偶数为按钮事件。
 @warning Objective-C语法中，可变参数要以 `nil` 关键字结尾作为最后一个参数，表示结束赋值。
 */
+ (void)showAboveController:(UIViewController *)viewController withMessages:(id)message, ...;

/**
 无参数无返回值闭包
 */
typedef void (^QuQFunction)(void);

/**
 弹出提示框

 [QuQAlert showAboveController:ViewController withMessages:@[@"标题", @"内容", @"按钮一", @"按钮二"] callback:^QuQFunction(NSInteger buttonIndex) {return ^{NSLog(@"%ld", (long)buttonIndex);};}];

 @param viewController 需要显示提示框的视图控制器。
 @param messages 提示框展示的信息，可变参数。第一个参数为标题，第二个参数为内容，第三个参数开始为按钮标题。
 @param callback 回调按钮的序号。
 @return 返回按钮对应的方法。
 */
+ (void)showAboveController:(UIViewController *)viewController withMessages:(NSArray *)messages callback:(QuQFunction (^)(NSInteger buttonIndex))callback;

/**
 调试模式

 @param openOrNot 打开或关闭
 */
+ (void)debugMode:(BOOL)openOrNot;

@end
