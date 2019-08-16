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
#import "UIColor+FLColor.h"

NS_ASSUME_NONNULL_BEGIN

@class FLFloatingView;

@protocol FLFloatingViewDelegate <NSObject>

@optional

/*!
 重设抽屉视图
 @param drawerView 抽屉视图
 */
- (void)floatingView:(FLFloatingView *)floatingView resetDrawerView:(UIView *)drawerView;

/*!
 重设抽屉的按钮
 @param button 回调抽屉的按钮
 */
- (void)floatingView:(FLFloatingView *)floatingView resetButton:(UIButton *)button;

/*!
 按钮点击事件
 @param floatingView 悬浮窗
 @param tag 按钮序号
 */
- (void)floatingView:(FLFloatingView *)floatingView buttonClickEventWithTag:(NSInteger)tag;

@end

@interface FLFloatingView : UIImageView

// 代理
@property (nonatomic, weak) id<FLFloatingViewDelegate> delegate;

// 按钮标题
@property (nonatomic, copy) NSArray<NSString *> *buttons;

// 按钮序号 (默认为'1000000*'，*从1开始)
@property (nonatomic, copy) NSArray<NSNumber *> *tags;

// 自动收起
@property (nonatomic) BOOL autoFoldToEdge;

// 按钮点击后是否收起扩展页
@property (nonatomic) BOOL autoFoldAfterButtonClick;

// 开始移动需长按的时间间隔
@property (nonatomic) NSInteger startMovingAfterTimeInterval;

/*!
 设置收起的延时间隔
 @param timeInterval 延时间隔
 */
- (void)foldAfterDelay:(NSTimeInterval)timeInterval;

/*!
 重设抽屉视图
 @param block 回调抽屉视图
 */
- (void)resetDrawerView:(void (^)(UIView *drawerView))block;

/*!
 重设抽屉的按钮
 @param block 回调抽屉的按钮
 */
- (void)resetButton:(void (^)(UIButton *button))block;

/*!
 按钮点击事件
 @param block 回调按钮序号
 */
- (void)buttonClickEventWithTag:(void (^)(NSInteger tag))block;

@end

NS_ASSUME_NONNULL_END
