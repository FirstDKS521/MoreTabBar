//
//  SecondModel.h
//  MoreTabBar
//
//  Created by aDu on 2017/1/4.
//  Copyright © 2017年 DuKaiShun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SecondModel : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) NSInteger age;

- (id)initWithName:(NSString *)name age:(NSInteger)age;

@end
