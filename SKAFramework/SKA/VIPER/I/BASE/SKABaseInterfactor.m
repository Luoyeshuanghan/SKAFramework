//
//  SKABaseInterfactor.m
//  SKAFramework
//
//  Created by JYC on 2017/5/25.
//  Copyright © 2017年 姜雨辰. All rights reserved.
//

#import "SKABaseInterfactor.h"

@implementation SKABaseInterfactor
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.url = @"";
        self.cache_time = @"0";
        [self initInterfactor];
    }
    return self;
}
- (void)initInterfactor{}
@end
