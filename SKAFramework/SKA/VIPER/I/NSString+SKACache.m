//
//  NSString+SKACache.m
//  20161011Test
//
//  Created by JZZ on 2016/11/14.
//  Copyright © 2016年 哥瑞. All rights reserved.
//

#import "NSString+SKACache.h"

@implementation NSString (SKACache)
- (NSDictionary *)DictionaryWithJsonString{
    if (self == nil) {
        return @{};
    }
    NSData * jsonData = [self dataUsingEncoding:NSUTF8StringEncoding];
    NSError * err;
    NSDictionary * dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err){
        NSLog(@"json解析失败：%@",err);
        return @{};
    }
    return dic;
}
@end
