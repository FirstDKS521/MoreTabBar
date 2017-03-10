//
//  DKSPageViewController.h
//  MoreTabBar
//
//  Created by aDu on 2017/1/6.
//  Copyright © 2017年 DuKaiShun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DKSPageViewController : UIViewController

/**
 * titleArray 标题名称数组
 * controllerArray 子试图控制器数组
 */
- (id)initWithTitles:(NSArray *)titleArray controllers:(NSArray *)controllerArray;

@end
