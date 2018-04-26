//
//  Code180111.m
//  O
//
//  Created by Fay on 2018/1/11.
//  Copyright © 2018年 Fay. All rights reserved.
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
