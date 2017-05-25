//
//  SKAStsInterface.m
//  啾啾健康版
//
//  Created by JZZ on 2017/3/1.
//  Copyright © 2017年 哥瑞. All rights reserved.
//

#import "SKAStsInterface.h"

@implementation SKAStsInterface

- (instancetype)init{
    self = [super init];
    if (self) {
        self.url = @"Sts/getStsToken";
    }
    return self;
}

@end
