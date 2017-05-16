//
//  SKANetWorkInterface+Cache.m
//  啾啾
//
//  Created by JZZ on 2017/2/24.
//  Copyright © 2017年 哥瑞. All rights reserved.
//

#import "SKANetWorkInterface+Cache.h"
#import "NSDictionary+SKACache.h"
#import "NSString+SKACache.h"

@implementation SKANetWorkInterface (Cache)
- (NSDictionary *)GetCache{
    NSString * cache_dict = nil;
    RLMRealm * cache_realm = [RLMRealm defaultRealm];
    NSString * cache_sql = [self.param isEqualToDictionary:@{}]?[NSString stringWithFormat:@"url = '%@'", self.url]:[NSString stringWithFormat:@"url = '%@' AND param = '%@'", self.url, [self.param DataToJsonString]];
    RLMResults<SKANetWorkInterfaceRealm *> * cache_result = [SKANetWorkInterfaceRealm objectsInRealm:cache_realm where:cache_sql]; // 从该 Realm 数据库中检索
    //只要大于0则继续
    if (cache_result.count > 0){
        SKANetWorkInterfaceRealm * cache_model = [cache_result lastObject];
//        NSLog(@"缓存内容URL:%@;\n参数:%@;\n过期时间:%tu", cache_model.url, cache_model.result_param, cache_model.overdue_time);
        //如果过期时间大于当前时间 则未过期 返回result_param
        //过期则删除(cache_result.count > 0则肯定有数据，不必担心删错)
        if (cache_model.overdue_time > [[NSDate date] timeIntervalSince1970]){
            NSLog(@"缓存有效，读取缓存成功");
            cache_dict = cache_model.result_param;
            self.status = @"200";
        } else {
            NSLog(@"缓存已过期，读取缓存失败");
            self.status = @"500";
            [cache_realm transactionWithBlock:^{
                NSLog(@"删除缓存成功");
                [cache_realm deleteObject:cache_model];
            }];
        }
    }
    
    if (cache_dict){
        return [cache_dict DictionaryWithJsonString];
    } else {
        return nil;
    }
}

- (void)setCache{
    NSLog(@"开始设置缓存");
    //缓存时间为0不会存进数据库
    if ([self.cache_time integerValue] <= 0){
        NSLog(@"时间为0不缓存");
        return;
    }
    NSLog(@"存入缓存");
    
    SKANetWorkInterfaceRealm * cache_model = [SKANetWorkInterfaceRealm new];
    cache_model.url = self.url;
    cache_model.param = [self.param DataToJsonString];
    cache_model.result_param = [self.data DataToJsonString];
    cache_model.overdue_time = [self.cache_time integerValue];
    cache_model.logid = self.logid;
    RLMRealm * cache_realm = [RLMRealm defaultRealm];
    [cache_realm transactionWithBlock:^{
        [cache_realm addObject:cache_model];
    }];
}

+ (void)clearAllCache{
    RLMRealm * cache_realm = [RLMRealm defaultRealm];
    [cache_realm transactionWithBlock:^{
        [cache_realm deleteAllObjects];
    }];
}
@end
