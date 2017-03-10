//
//  MyTabBarController.m
//  MoreTabBar
//
//  Created by aDu on 2017/1/3.
//  Copyright © 2017年 DuKaiShun. All rights reserved.
//

#import "MyTabBarController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"

@interface MyTabBarController ()<UITabBarDelegate>

@end

@implementation MyTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    FirstViewController *firstVC = [[FirstViewController alloc] init];
    UINavigationController *firstNav = [[UINavigationController alloc] initWithRootViewController:firstVC];
    firstVC.title = @"首页";
    
    SecondViewController *secondVC = [[SecondViewController alloc] init];
    UINavigationController *secondtNav = [[UINavigationController alloc] initWithRootViewController:secondVC];
    secondVC.title = @"生活";
    
    self.viewControllers = @[firstNav, secondtNav];
}

@end
