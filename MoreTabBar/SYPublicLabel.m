//
//  SYPublicLabel.m
//  MoreTabBar
//
//  Created by aDu on 2017/2/13.
//  Copyright © 2017年 DuKaiShun. All rights reserved.
//

#import "SYPublicLabel.h"

@implementation SYPublicLabel

- (void)drawTextInRect:(CGRect)rect {
    UIEdgeInsets insets = {0, 5, 0, 5};
    [super drawTextInRect:UIEdgeInsetsInsetRect(rect, insets)];
}

@end
