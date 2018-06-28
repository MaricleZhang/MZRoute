//
//  UIViewController+MZRoute.m
//  MZDemo
//
//  Created by 张建 on 2018/4/27.
//  Copyright © 2018年 张建. All rights reserved.
//

#import "UIViewController+MZRoute.h"
#import <objc/runtime.h>

static void *kMZURLString = @"kMZURLString";
static void *kMZURLParams = @"kMZURLParams";
static void *kMZCallBackBlock = @"kMZCallBackBlock";

@implementation UIViewController (MZRoute)

+ (UIViewController *)getCurrentViewController
{
    id result = nil;
    
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    if (window.windowLevel != UIWindowLevelNormal)
    {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tmpWin in windows)
        {
            if (tmpWin.windowLevel == UIWindowLevelNormal)
            {
                window = tmpWin;
                break;
            }
        }
    }
    
    UIView *frontView = [[window subviews] objectAtIndex:0];
    id nextResponder = [frontView nextResponder];
    
    if ([nextResponder isKindOfClass:[UIViewController class]])
        result = nextResponder;
    else
        result = window.rootViewController;
    
    if ([result isKindOfClass:[UITabBarController class]])
    {
        result = [[(UITabBarController *)result viewControllers] objectAtIndex:[(UITabBarController *)result selectedIndex]];
    }
    
    if ([result isKindOfClass:[UINavigationController class]])
    {
        result = [(UINavigationController *)result topViewController];
    }
    
    if ([result isKindOfClass:[UINavigationController class]])
    {
        result = [(UINavigationController *)result topViewController];
    }
    
    return result;
}

#pragma mark - Setter/Getter

- (void)setUrlString:(NSString *)urlString
{
    objc_setAssociatedObject(self, kMZURLString, urlString, OBJC_ASSOCIATION_COPY);
}

- (NSString *)urlString
{
    return objc_getAssociatedObject(self, kMZURLString);
}

- (void)setParams:(NSMutableDictionary *)params
{
    objc_setAssociatedObject(self, kMZURLParams, params, OBJC_ASSOCIATION_COPY);
}

- (NSMutableDictionary *)params
{
    return objc_getAssociatedObject(self, kMZURLParams);
}

- (void)setCallBackBlock:(MZCallBackBlock)callBackBlock
{
    objc_setAssociatedObject(self, kMZCallBackBlock, callBackBlock, OBJC_ASSOCIATION_COPY);
}

- (MZCallBackBlock)callBackBlock
{
    return objc_getAssociatedObject(self, kMZCallBackBlock);
}

@end
