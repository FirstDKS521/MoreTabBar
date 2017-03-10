//
//  MyPageViewController.m
//  MoreTabBar
//
//  Created by aDu on 2017/1/7.
//  Copyright © 2017年 DuKaiShun. All rights reserved.
//

#import "MyPageViewController.h"
#import "DKSPageViewController.h"

@interface MyPageViewController ()

@end

@implementation MyPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"选择器";
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.translucent = NO;
    
    NSArray *titleArray = @[@"关注", @"发现", @"收藏", @"订单"];
    
    UIViewController *firstVC = [[UIViewController alloc] init];
    firstVC.view.backgroundColor = [UIColor orangeColor];
    
    UIViewController *secondVC = [[UIViewController alloc] init];
    secondVC.view.backgroundColor = [UIColor brownColor];
    
    UIViewController *thirdVC = [[UIViewController alloc] init];
    thirdVC.view.backgroundColor = [UIColor blueColor];
    
    UIViewController *fouthVC = [[UIViewController alloc] init];
    fouthVC.view.backgroundColor = [UIColor greenColor];
    
    NSArray *controllerArray = @[firstVC, secondVC, thirdVC, fouthVC];
    
    DKSPageViewController *dksVC = [[DKSPageViewController alloc] initWithTitles:titleArray controllers:controllerArray];
    dksVC.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    [self addChildViewController:dksVC];
    [self.view addSubview:dksVC.view];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = YES;
}

@end
