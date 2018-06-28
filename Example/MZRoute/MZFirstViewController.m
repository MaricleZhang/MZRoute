//
//  MZFirstViewController.m
//  MZRoute_Example
//
//  Created by 张建 on 2018/6/28.
//  Copyright © 2018 MaricleZhang. All rights reserved.
//

#import "MZFirstViewController.h"
#import "MZRoute.h"

@interface MZFirstViewController ()

@end

@implementation MZFirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"第一个标题";
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSString *urlStr = [NSString stringWithFormat:@"%@://%@?id=102&username=1233",@"11",@"MZSecond"];
//    [[MZRoute route] routeURL:@"https://www.baidu.com"];
//    [[MZRoute route] routeURL:MZNativeURL(@"MZSecond") params:@{@"title" : @"第二个标题"}];
    
    [[MZRoute route] routeURL:MZNativeURL(@"MZSecond?title=第二个标题") params:@{@"title" : @"第二个标题"}];
    [UIViewController getCurrentViewController].callBackBlock = ^(id obj) {
        self.title = obj;
    };
}

@end
