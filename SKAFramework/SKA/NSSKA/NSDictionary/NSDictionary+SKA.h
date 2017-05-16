//
//  NSDictionary+SKA.h
//  SKAFramework
//
//  Created by JYC on 2017/4/27.
//  Copyright © 2017年 姜雨辰. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (SKA)
//解析Plist返回字典
+ (NSDictionary *)SKAGetPlist:(NSString *)plist_name;
@end
