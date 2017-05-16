//
//  AppDelegate+SKA.m
//  辽宁飞豹
//
//  Created by JZZ on 2016/11/18.
//  Copyright © 2016年 哥瑞. All rights reserved.
//

#import "AppDelegate+SKA.h"

@implementation AppDelegate (SKA)
//获取AppDelegate
+ (AppDelegate *)sharedApplication{
    return (AppDelegate *)[UIApplication sharedApplication].delegate;
}
@end
