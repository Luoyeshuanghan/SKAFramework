//
//  SKANumber.m
//  SKAFramework
//
//  Created by JYC on 2017/5/18.
//  Copyright © 2017年 姜雨辰. All rights reserved.
//

#import "SKANumber.h"

@implementation SKANumber
+ (NSInteger)GetRandom:(NSInteger)from to:(NSInteger)to{
    return (NSInteger)(from + (arc4random() % (to - from + 1)));
}
@end
