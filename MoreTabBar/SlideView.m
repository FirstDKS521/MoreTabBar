//
//  SlideView.m
//  MoreTabBar
//
//  Created by aDu on 2017/1/6.
//  Copyright © 2017年 DuKaiShun. All rights reserved.
//

#import "SlideView.h"
#import "Masonry.h"

@interface SlideView ()

@property (nonatomic, copy) ButtonBlock block;

@end

@implementation SlideView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        float width = self.frame.size.width / 3;
        for (int i = 0; i < 3; i++) {
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            [button setTitle:[NSString stringWithFormat:@"按钮%@", @(i)] forState:UIControlStateNormal];
            [button setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
            button.tag = 100 + i;
            [self addSubview:button];
            [button mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self.mas_left).offset(width * i);
                make.top.and.bottom.equalTo(self);
                make.width.equalTo(@(width));
            }];
            [button addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
        }
    }
    return self;
}

- (void)click:(UIButton *)button
{
    NSLog(@"%@", button);
    self.block(button.tag - 100);
}

- (void)buttonBlock:(ButtonBlock)block
{
    self.block = block;
}

@end
