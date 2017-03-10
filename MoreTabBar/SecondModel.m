//
//  SecondModel.m
//  MoreTabBar
//
//  Created by aDu on 2017/1/4.
//  Copyright © 2017年 DuKaiShun. All rights reserved.
//

#import "SecondModel.h"

@implementation SecondModel

- (id)initWithName:(NSString *)name age:(NSInteger)age
{
    self = [super init];
    if (self) {
        self.name = name;
        self.age = age;
    }
    return self;
}

@end
