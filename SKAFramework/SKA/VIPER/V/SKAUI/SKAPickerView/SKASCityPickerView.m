//
//  SKACityPickerView.m
//  辽宁飞豹
//
//  Created by JZZ on 2016/12/17.
//  Copyright © 2016年 哥瑞. All rights reserved.
//

#import "SKACityPickerView.h"

@implementation SKACityPickerView

- (void)initCityPickerView{
    NSMutableArray * citys_array = [NSArray SKAGetPListArray:@"Citys"];
    [self setDataWithMoreArray:citys_array cascade_array:@[@"citylist", @"arealist", @""] show_key_array:@[@"provinceName", @"cityName", @"areaName"]];
    [self setDefaultMoreData:@[@"2106", @"2172", @"2176"] key:@[@"id", @"id", @"id"]];
}

@end
