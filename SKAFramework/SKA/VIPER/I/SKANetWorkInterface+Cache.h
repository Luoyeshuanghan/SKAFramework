//
//  SKANetWorkInterface+Cache.h
//  啾啾
//
//  Created by JZZ on 2017/2/24.
//  Copyright © 2017年 哥瑞. All rights reserved.
//

#import "SKANetWorkInterface.h"
#import "SKANetWorkInterfaceRealm.h"

@interface SKANetWorkInterface (Cache)
//查找接口名、接口参数、返回状态为200
//如果有 判断是否过期 如果过期删除，返回null
//                 如果没过期，返回数据
//如果没有 返回null
- (NSDictionary *)GetCache;
- (void)setCache;
+ (void)clearAllCache;
@end
