//
//  FirstViewController.m
//  MoreTabBar
//
//  Created by aDu on 2017/1/3.
//  Copyright © 2017年 DuKaiShun. All rights reserved.
//

#import "FirstViewController.h"
#import "SecondTabBarController.h"
#import "MyPageViewController.h"
#import "SYPublicLabel.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
//    步骤一: 根据需求修改状态栏的样式
//    self.navigationController.navigationBar.barStyle = UIStatusBarStyleLightContent;
//    或者
//    self.navigationController.navigationBar.barStyle = UIStatusBarStyleDefault;
    
    
//    步骤二: 重新绘制状态栏
    [self setNeedsStatusBarAppearanceUpdate];
    
    SYPublicLabel *label = [[SYPublicLabel alloc] init];
    label.frame = CGRectMake(100, 300, 150, 30);
    label.text = @"打开的金卡";
    [label sizeToFit];
    label.frame = CGRectMake(label.frame.origin.x, label.frame.origin.y, label.frame.size.width + 10, label.frame.size.height);
//    [label drawTextInRect:label.frame];
    label.backgroundColor = [UIColor orangeColor];
    label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label];
}

- (IBAction)click:(id)sender {
    self.tabBarController.tabBar.hidden = YES;
    SecondTabBarController *tabVC = [[SecondTabBarController alloc] init];
    [self.navigationController pushViewController:tabVC animated:YES];
}

- (IBAction)pageView:(id)sender {
    MyPageViewController *myVC = [[MyPageViewController alloc] init];
    [self.navigationController pushViewController:myVC animated:YES];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[UIApplication sharedApplication] setStatusBarStyle:(UIStatusBarStyleLightContent)];
//    UIApplication.sharedApplication().setStatusBarStyle(UIStatusBarStyle.LightContent, animated: true)
    self.navigationController.navigationBar.hidden = YES;
//    self.navigationController.tabBarController.tabBar.hidden = NO;
//    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [[UIApplication sharedApplication] setStatusBarStyle:(UIStatusBarStyleDefault)];
    self.navigationController.navigationBar.hidden = NO;
//    self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
}

//-(UIStatusBarStyle)preferredStatusBarStyle
//
//{
//    return UIStatusBarStyleLightContent; //默认的值是黑色的
//}
//
//- (BOOL)prefersStatusBarHidden
//
//{
//    return NO; // 是否隐藏状态栏
//}

@end
