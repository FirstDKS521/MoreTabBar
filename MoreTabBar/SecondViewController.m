//
//  SecondViewController.m
//  MoreTabBar
//
//  Created by aDu on 2017/1/3.
//  Copyright © 2017年 DuKaiShun. All rights reserved.
//

#import "SecondViewController.h"
#import "SegmentViewController.h"
#import "SecondModel.h"

@interface SecondViewController ()

@property (nonatomic, strong) SecondModel *model;
@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.model = [[SecondModel alloc] initWithName:@"阿杜" age:20];
    self.label.text = [NSString stringWithFormat:@"姓名：%@-年龄：%@", _model.name, @(_model.age)];
    [_model addObserver:self forKeyPath:@"age" options:NSKeyValueObservingOptionNew context:nil];
}

- (IBAction)click:(id)sender {
    _model.age += 2;
    _model.name = [NSString stringWithFormat:@"阿杜%@", @(_model.age)];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"age"] && object == _model) {
        self.label.text = [NSString stringWithFormat:@"姓名：%@-年龄：%@", _model.name, @(_model.age)];
    }
}

- (IBAction)segment:(id)sender {
    SegmentViewController *segmentVC = [[SegmentViewController alloc] init];
    [self.navigationController pushViewController:segmentVC animated:YES];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = NO;
}

- (void)dealloc
{
    [_model removeObserver:self forKeyPath:@"age"];
}

@end
