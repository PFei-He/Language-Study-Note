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

#import "Code180111.h"

@implementation Code180111

//获取当前的视图控制器
- (UIViewController *)currentViewController
{
    UIViewController *viewController = nil;
    UIWindow *keyWindow = [[UIApplication sharedApplication] keyWindow];

    // 默认的windowLevel是UIWindowLevelNormal，如果不是，找到UIWindowLevelNormal的
    if (keyWindow.windowLevel != UIWindowLevelNormal) {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for (UIWindow *window in windows) {
            if (window.windowLevel == UIWindowLevelNormal) {
                keyWindow = window;
                break;
            }
        }
    }

    id nextResponder = nil;
    UIViewController *rootViewController = keyWindow.rootViewController;

    // 如果是present上来的，rootViewController.presentedViewController不为nil
    if (rootViewController.presentedViewController) {
        nextResponder = rootViewController.presentedViewController;
    } else {
        UIView *frontView = [[keyWindow subviews] objectAtIndex:0];
        nextResponder = [frontView nextResponder];
    }

    // p.s. 避免拿到的ViewController是TabBarController或者NavigationController，需要做判断排除
    if ([nextResponder isKindOfClass:[UITabBarController class]]) {// 如果当前是TabBarController
        UITabBarController *tabBarController = (UITabBarController *)nextResponder;

        UINavigationController *navigationController = (UINavigationController *)tabBarController.viewControllers[tabBarController.selectedIndex];
//        UINavigationController *navigationController = tabBarController.selectedViewController;

        viewController = navigationController.childViewControllers.lastObject;
    } else if ([nextResponder isKindOfClass:[UINavigationController class]]) {// 如果当前是NavigationController
        UIViewController *navigationController = (UIViewController *)nextResponder;
        viewController = navigationController.childViewControllers.lastObject;
    } else {
        viewController = nextResponder;
    }

    return viewController;
}

@end
