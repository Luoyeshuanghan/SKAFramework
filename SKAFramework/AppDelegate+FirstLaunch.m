//
//  AppDelegate+FirstLaunch.m
//  啾啾健康版
//
//  Created by JZZ on 2017/3/7.
//  Copyright © 2017年 哥瑞. All rights reserved.
//

#import "AppDelegate+FirstLaunch.h"

@implementation AppDelegate (FirstLaunch)
- (BOOL)SKA_isFirshLaunch{
    //判断是不是第一次启动应用
    if(![[NSUserDefaults standardUserDefaults] stringForKey:@"firstLaunch"]){
        [[NSUserDefaults standardUserDefaults] setValue:@"1" forKey:@"firstLaunch"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        return YES;
    } else {
        //不是第一次启动
        return NO;
    }
}
@end
