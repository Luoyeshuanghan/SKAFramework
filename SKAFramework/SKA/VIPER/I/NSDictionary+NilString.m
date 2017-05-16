//
//  NSDictionary+NilString.m
//  啾啾健康版
//
//  Created by JZZ on 2017/3/21.
//  Copyright © 2017年 哥瑞. All rights reserved.
//

#import "NSDictionary+NilString.h"

@implementation NSDictionary (NilString)
//将NSDictionary中的Null类型的项目转化成@""
+ (NSDictionary *)nullDic:(NSDictionary *)myDic{
    NSArray *keyArr = [myDic allKeys];
    NSMutableDictionary *resDic = [[NSMutableDictionary alloc]init];
    for (int i = 0; i < keyArr.count; i ++){
        id obj = [myDic objectForKey:keyArr[i]];
        obj = [self SKARemoveNull:obj];
        [resDic setObject:obj forKey:keyArr[i]];
    }
    return resDic;
}
//将NSArray中的Null类型的项目转化成@""
+ (NSArray *)nullArr:(NSArray *)myArr{
    NSMutableArray *resArr = [[NSMutableArray alloc] init];
    for (int i = 0; i < myArr.count; i ++){
        id obj = myArr[i];
        obj = [self SKARemoveNull:obj];
        [resArr addObject:obj];
    }
    return resArr;
}
//将NSString类型的原路返回
+ (NSString *)stringToString:(NSString *)string{
    return string;
}
//将Null类型的项目转化成@""
+ (NSString *)nullToString{
    return @"";
}
//主要方法
//类型识别:将所有的NSNull类型转化成@""
+ (id)SKARemoveNull:(id)data{
    if ([data isKindOfClass:[NSDictionary class]]){
        return [self nullDic:data];
    } else if([data isKindOfClass:[NSArray class]]) {
        return [self nullArr:data];
    } else if([data isKindOfClass:[NSString class]]) {
        return [self stringToString:data];
    } else if([data isKindOfClass:[NSNull class]]) {
        return [self nullToString];
    } else {
        return data;
    }
}
@end
