//
//  AppDelegate+MainVC.m
//  啾啾健康版
//
//  Created by JZZ on 2017/3/7.
//  Copyright © 2017年 哥瑞. All rights reserved.
//

#import "AppDelegate+MainVC.h"
#import "AppDelegate+FirstLaunch.h"

@implementation AppDelegate (MainVC)

- (NSString *)SKA_getMainVC{
    //如果首次打开则进入引导页
    //否则判断如果用户未登录则进入登录页
    //否则进入主页
    NSString * main_vc = nil;
    if ([self SKA_isFirshLaunch]){
        main_vc = @"GRSGuidanceC";
    } else {
        main_vc = @"GRSLoginNavi";
    }
    return main_vc;
}

@end
