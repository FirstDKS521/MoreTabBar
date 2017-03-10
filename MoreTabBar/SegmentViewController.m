//
//  SegmentViewController.m
//  MoreTabBar
//
//  Created by aDu on 2017/1/5.
//  Copyright © 2017年 DuKaiShun. All rights reserved.
//

#import "SegmentViewController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "FouthViewController.h"
#import "SlideView.h"

#define K_Width self.view.frame.size.width / 3
@interface SegmentViewController ()<UIPageViewControllerDelegate, UIPageViewControllerDataSource>

@property (nonatomic, strong) UIPageViewController *pageView;
@property (nonatomic, strong) NSArray *conArray;
@property (nonatomic, strong) UIView *lineView; //下滑线

@end

@implementation SegmentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"选择器";
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.translucent = NO;
    
    SlideView *slideView = [[SlideView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 40)];
    [self.view addSubview:slideView];
    [slideView buttonBlock:^(NSInteger index) {
        [self findSubTitleViewDidSelectedAtIndex:index];
    }];
    
    self.pageView.view.frame = CGRectMake(0, 40, self.view.frame.size.width, self.view.frame.size.height - 40);
    
    self.lineView = [UIView new];
    _lineView.backgroundColor = [UIColor blackColor];
    _lineView.frame = CGRectMake((K_Width - 40) / 2, 40, 40, 2);
    [self.view addSubview:_lineView];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = YES;
}

#pragma mark - UIPageViewControllerDelegate/UIPageViewControllerDataSource

//这个方法是返回前一个页面,如果返回为nil,那么UIPageViewController就会认为当前页面是第一个页面不可以向前滚动或翻页
- (nullable UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSInteger index = [self indexForViewController:viewController];
    if (index == 0 || index == NSNotFound) {
        return nil;
    }
    return [self.conArray objectAtIndex:index - 1];
}

//这个方法是下一个页面,如果返回为nil,那么UIPageViewController就会认为当前页面是最后一个页面不可以向后滚动或翻页
- (nullable UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSInteger index = [self indexForViewController:viewController];
    if (index == NSNotFound || index == self.conArray.count - 1) {
        return nil;
    }
    return [self.conArray objectAtIndex:index + 1];
}

//这个方法是在UIPageViewController结束滚动或翻页的时候触发
- (void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray<UIViewController *> *)previousViewControllers transitionCompleted:(BOOL)completed
{
    UIViewController *viewcontroller = self.pageView.viewControllers[0];
    
    NSUInteger index = [self indexForViewController:viewcontroller];
    NSLog(@"滑到了第%@个", @(index));
    [self slideView:index];
}

//返回多少个控制器
- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController
{
    return self.conArray.count;
}
                         
- (NSInteger)indexForViewController:(UIViewController *)controller
{
    return [self.conArray indexOfObject:controller];
}

#pragma mark - 点击按钮的事件

- (void)findSubTitleViewDidSelectedAtIndex:(NSInteger)index
{
    NSLog(@"<><><><>%@", @(index));
    [self slideView:index];
    [self.pageView setViewControllers:@[[self.conArray objectAtIndex:index]] direction:(UIPageViewControllerNavigationDirectionForward) animated:NO completion:nil];
}

#pragma mark - 滚动条的滑动

- (void)slideView:(NSInteger)index
{
    [UIView animateWithDuration:0.05 animations:^{
        self.lineView.frame = CGRectMake(index * K_Width + (K_Width - 40) / 2, 40, 40, 2);
    }];
}

#pragma mark - 添加视图控制器

- (NSArray *)conArray
{
    if (!_conArray) {
        UIViewController *firstVC = [[UIViewController alloc] init];
        firstVC.view.backgroundColor = [UIColor orangeColor];
        
        UIViewController *secondVC = [[UIViewController alloc] init];
        secondVC.view.backgroundColor = [UIColor brownColor];
        
        UIViewController *fouthVC = [[UIViewController alloc] init];
        fouthVC.view.backgroundColor = [UIColor greenColor];
        
        _conArray = @[firstVC, secondVC, fouthVC];
    }
    return _conArray;
}

#pragma mark - UIPageViewController

- (UIPageViewController *)pageView
{
    if (!_pageView) {
        NSDictionary *option = [NSDictionary dictionaryWithObject:[NSNumber numberWithInteger:UIPageViewControllerSpineLocationNone] forKey:UIPageViewControllerOptionInterPageSpacingKey];
        _pageView = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:option];
        [_pageView setViewControllers:@[self.conArray[0]] direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
        _pageView.view.backgroundColor = [UIColor whiteColor];
        [self addChildViewController:_pageView];
        _pageView.delegate = self;
        _pageView.dataSource = self;
        [self.view addSubview:_pageView.view];
    }
    return _pageView;
}

@end
