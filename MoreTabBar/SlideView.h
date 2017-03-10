//
//  SlideView.h
//  MoreTabBar
//
//  Created by aDu on 2017/1/6.
//  Copyright © 2017年 DuKaiShun. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ButtonBlock)(NSInteger index);
@interface SlideView : UIView

- (void)buttonBlock:(ButtonBlock)block;

@end
