//
//  MZSecondViewController.m
//  MZRoute_Example
//
//  Created by MaricleZhang on 2018/6/28.
//  Copyright © 2018 MaricleZhang. All rights reserved.
//

#import "MZSecondViewController.h"
#import "MZRoute.h"

@interface MZSecondViewController ()

@end

@implementation MZSecondViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = self.params[@"title"];
    self.view.backgroundColor = [UIColor redColor];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSString *urlStr = [NSString stringWithFormat:@"%@://%@?id=102&username=1233",@"11",@"MZSecond"];
    //    [[MZRoute route] routeURL:@"https://www.baidu.com"];
    if (self.callBackBlock)
    {
        self.callBackBlock(@"回调改变第一个标题");
    }
    [[MZRoute route] routeURL:MZNativeURL(@"MZFirst")];
}

@end
