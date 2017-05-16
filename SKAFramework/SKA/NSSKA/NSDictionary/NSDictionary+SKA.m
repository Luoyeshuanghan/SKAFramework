//
//  NSDictionary+SKA.m
//  SKAFramework
//
//  Created by JYC on 2017/4/27.
//  Copyright © 2017年 姜雨辰. All rights reserved.
//

#import "NSDictionary+SKA.h"

@implementation NSDictionary (SKA)
//解决控制台输出Unicode问题
- (NSString *)descriptionWithLocale:(id)locale{
    NSMutableString * strM = [NSMutableString stringWithString:@"{\n"];
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        [strM appendFormat:@"\t%@ = %@;\n", key, obj];
    }];
    [strM appendString:@"}\n"];
    return strM;
}
//解析Plist返回字典
+ (NSDictionary *)SKAGetPlist:(NSString *)plist_name{
    NSString * plistPath = [[NSBundle mainBundle] pathForResource:plist_name ofType:@"plist"];
    NSMutableDictionary * data = [[NSMutableDictionary alloc] initWithContentsOfFile:plistPath];
    return data;
}
@end
