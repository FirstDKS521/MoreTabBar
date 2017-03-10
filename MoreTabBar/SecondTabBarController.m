//
//  SecondTabBarController.m
//  MoreTabBar
//
//  Created by aDu on 2017/1/3.
//  Copyright © 2017年 DuKaiShun. All rights reserved.
//

#import "SecondTabBarController.h"
#import "ThirdViewController.h"
#import "FouthViewController.h"

@interface SecondTabBarController ()

@end

@implementation SecondTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    ThirdViewController *thirdVC = [[ThirdViewController alloc] init];
    UINavigationController *firstNav = [[UINavigationController alloc] initWithRootViewController:thirdVC];
    thirdVC.title = @"活动";
    
    FouthViewController *fouthVC = [[FouthViewController alloc] init];
    UINavigationController *secondtNav = [[UINavigationController alloc] initWithRootViewController:fouthVC];
    fouthVC.title = @"发现";
    
    self.viewControllers = @[firstNav, secondtNav];
}

@end
