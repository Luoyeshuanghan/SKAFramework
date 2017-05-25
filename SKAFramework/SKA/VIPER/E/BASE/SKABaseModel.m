//
//  SKABaseModel.m
//  SKAFramework
//
//  Created by JYC on 2017/5/18.
//  Copyright © 2017年 姜雨辰. All rights reserved.
//

#import "SKABaseModel.h"

@implementation SKABaseModel
- (void)parseModel:(NSDictionary *)data{}
- (void)setValue:(id)value forUndefinedKey:(NSString *)key{}
- (NSDictionary *)toDictionary{
    NSMutableDictionary * dic = [NSMutableDictionary dictionary];
    unsigned int count, i;
    objc_property_t * properties = class_copyPropertyList([self class], &count);
    for (i = 0; i < count; i++) {
        objc_property_t property = properties[i];
        const char* char_f =property_getName(property);
        NSString *propertyName = [NSString stringWithUTF8String:char_f];
        id propertyValue = [self valueForKey:(NSString *)propertyName];
        if (propertyValue) [dic setObject:propertyValue forKey:propertyName];
    }
    free(properties);
    return dic;
}

@end
