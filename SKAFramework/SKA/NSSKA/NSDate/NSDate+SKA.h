//
//  NSDate+SKA.h
//  SKAFramework
//
//  Created by JYC on 2017/4/27.
//  Copyright © 2017年 姜雨辰. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (SKA)
//获取当前时间戳
+ (NSTimeInterval)SKAGetNowInterval;
//获取当前时间Components
+ (NSDateComponents * )SKAGetNowDateComponents;
//根据时间戳获取Components
+ (NSDateComponents * )SKAIntervalToDateComponents:(NSTimeInterval)intervalTime;
//根据Components获取时间戳
+ (NSTimeInterval)SKADateComponentsToInterval:(NSDateComponents * )comps;
//根据Date获取Components
+ (NSDateComponents * )SKADateToDateComponents:(NSDate * )date;
//格式化时间戳
+ (NSString * )SKAIntervalToStringFormat:(NSTimeInterval)intervalTime dateFormat:(NSString * )dateFormat;
@end
