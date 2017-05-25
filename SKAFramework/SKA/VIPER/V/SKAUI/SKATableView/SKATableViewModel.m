//
//  SKATableViewModel.m
//  辽宁飞豹
//
//  Created by JZZ on 2016/11/29.
//  Copyright © 2016年 哥瑞. All rights reserved.
//

#import "SKATableViewModel.h"

@implementation SKATableViewModel
- (NSString *)cell_name{
    return [NSStringFromClass([self class]) stringByReplacingOccurrencesOfString:@"Model" withString:@"Cell"];
}
- (void)setValue:(id)value forUndefinedKey:(NSString *)key{}
@end
