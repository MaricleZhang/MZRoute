//
//  MZRoute.h
//  MZDemo
//
//  Created by 张建 on 2018/4/27.
//  Copyright © 2018年 张建. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIViewController+MZRoute.h"

@interface MZRoute : NSObject

@property (nonatomic, copy) NSString *nativeScheme;//原生页面协议
@property (nonatomic, strong) NSDictionary *routeKeyClass;//映射表
@property (nonatomic, strong) UIViewController *pushViewController;
@property (nonatomic, strong) UIViewController *currentViewController;

+ (instancetype)route;

- (void)routeURL:(NSString *)urlString;

- (void)routeURL:(NSString *)urlString params:(NSDictionary *)params;

@end
