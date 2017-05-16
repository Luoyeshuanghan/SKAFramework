//
//  NSDate+SKA.m
//  SKAFramework
//
//  Created by JYC on 2017/4/27.
//  Copyright © 2017年 姜雨辰. All rights reserved.
//

#import "NSDate+SKA.h"

@implementation NSDate (SKA)
//获取当前时间戳
+ (NSTimeInterval)SKAGetNowInterval{
    NSDate * date = [NSDate date];
    return [date timeIntervalSince1970];
}
//获取当前时间Components
+ (NSDateComponents *)SKAGetNowDateComponents{
    return [self SKADateToDateComponents:[NSDate date]];
}
//根据时间戳获取Components
+ (NSDateComponents *)SKAIntervalToDateComponents:(NSTimeInterval)intervalTime{
    return [self SKADateToDateComponents:[NSDate dateWithTimeIntervalSince1970:intervalTime]];
}
//根据Components获取时间戳
+ (NSTimeInterval)SKADateComponentsToInterval:(NSDateComponents *)comps{
    NSDate * date = [[NSCalendar currentCalendar] dateFromComponents:comps];
    return [date timeIntervalSince1970];
}
//根据Date获取Components
+ (NSDateComponents *)SKADateToDateComponents:(NSDate *)date{
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday |
    NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    NSDateComponents *comps  = [calendar components:unitFlags fromDate:date];
    return comps;
}
//格式化时间戳
+ (NSString *)SKAIntervalToStringFormat:(NSTimeInterval)intervalTime dateFormat:(NSString *)dateFormat{
    NSDate * date = [NSDate dateWithTimeIntervalSince1970:intervalTime];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:dateFormat];
    return [dateFormatter stringFromDate:date];
}

@end
