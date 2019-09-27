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

#import "FLHUD.h"
#import "MBProgressHUD.h"

@implementation FLHUD

#pragma mark - Private Methods

// 当前视图控制器
+ (UIViewController *)currentViewController
{
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    UIViewController *viewController = keyWindow.rootViewController;
    while (viewController.presentedViewController) {
        if ([viewController.presentedViewController isKindOfClass:[UINavigationController class]]) {
            viewController = [(UINavigationController *)viewController visibleViewController];
        } else if ([viewController isKindOfClass:[UITabBarController class]]) {
            viewController = [(UITabBarController *)viewController selectedViewController];
        }
    }
    return viewController;
}

#pragma mark - Public Methods

// 显示提示框
+ (void)show
{
    [self showWithContent:nil];
}

// 显示提示框
+ (void)showWithContent:(NSArray *)content
{
    [self showWithContent:content addedTo:nil];
}

// 显示提示框
+ (void)showWithContent:(NSArray *)content addedTo:(UIView *)view
{
    // 获取当前显示的视图
    if (!view) view = [self currentViewController].view;
    
    // 显示提示框
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    if (content) {
        hud.mode = MBProgressHUDModeText;
        hud.label.text = content[0];
        hud.detailsLabel.text = content[1];
        [hud hideAnimated:YES afterDelay:2];
    }
}

// 隐藏提示框
+ (void)hide
{
    [self hideForView:nil];
}

// 隐藏提示框
+ (void)hideForView:(UIView *)view
{
    // 获取当前显示的视图
    if (!view) view = [self currentViewController].view;
    
    // 隐藏提示框
    [MBProgressHUD hideHUDForView:view animated:YES];
}

@end
