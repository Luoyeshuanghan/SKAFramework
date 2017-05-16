//
//  NSArray+SKA.m
//  SKAFramework
//
//  Created by JYC on 2017/4/27.
//  Copyright © 2017年 姜雨辰. All rights reserved.
//

#import "NSArray+SKA.h"

@implementation NSArray (SKA)
//解决控制台输出Unicode问题
- (NSString *)descriptionWithLocale:(id)locale{
    NSMutableString *strM = [NSMutableString stringWithString:@"(\n"];
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [strM appendFormat:@"\t%@,\n", obj];
    }];
    [strM appendString:@")"];
    return strM;
}
//解析Plist
+ (NSMutableArray *)SKAGetPListArray:(NSString *)plist_name{
    NSString * plistPath = [[NSBundle mainBundle] pathForResource:plist_name ofType:@"plist"];
    NSMutableArray * data = [[NSMutableArray alloc] initWithContentsOfFile:plistPath];
    return data;
}

@end
