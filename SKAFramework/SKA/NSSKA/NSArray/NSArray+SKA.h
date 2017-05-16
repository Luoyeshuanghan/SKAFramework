//
//  NSArray+SKA.h
//  SKAFramework
//
//  Created by JYC on 2017/4/27.
//  Copyright © 2017年 姜雨辰. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (SKA)
//解析Plist
+ (NSMutableArray *)SKAGetPListArray:(NSString *)plist_name;
@end
