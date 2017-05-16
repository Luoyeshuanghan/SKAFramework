//
//  SKANetWorkInterface+Log.m
//  啾啾
//
//  Created by JZZ on 2017/2/27.
//  Copyright © 2017年 哥瑞. All rights reserved.
//

#import "SKANetWorkInterface+Log.h"
#import "NSDictionary+SKACache.h"
#import "NSString+SKACache.h"

@implementation SKANetWorkInterface (Log)
+ (NSMutableArray<SKANetWorkLogRealm *> *)GetLogList{
    RLMResults<SKANetWorkLogRealm *> * log_result = [SKANetWorkLogRealm allObjects]; // 从该 Realm 数据库中检索
    NSMutableArray * log_arr = [NSMutableArray new];
    for (SKANetWorkLogRealm * realm in log_result){
        [log_arr addObject:realm];
    }
    
    return log_arr;
}

+ (SKANetWorkLogRealm *)GetLogInfoForLogId:(NSString *)log_id{
    RLMRealm * log_realm = [RLMRealm defaultRealm];
    NSString * log_sql = [NSString stringWithFormat:@"log_logid = '%@'",log_id];
    RLMResults<SKANetWorkLogRealm *> * log_result = [SKANetWorkLogRealm objectsInRealm:log_realm where:log_sql]; // 从该 Realm 数据库中检索
    SKANetWorkLogRealm * log_data = log_result[0];
    return log_data;
}
//存储日志
- (void)netWorkSaveSuccessLog{
    SKANetWorkLogRealm * log_model = [SKANetWorkLogRealm new];
    log_model.log_class = NSStringFromClass([self.netWork_delegate class]);
    log_model.log_url = self.url;
    log_model.log_param = [self.param DataToJsonString];
    log_model.log_status = self.status;
    log_model.log_info = self.info;
    log_model.log_logid = self.logid;
    log_model.log_score = self.score;
    if ([self.data isKindOfClass:[NSDictionary class]] || [self.data isKindOfClass:[NSArray class]]){
        log_model.log_data = [self.data DataToJsonString];
    } else {
        log_model.log_data = self.data;
    }
    log_model.log_time = [NSDate SKAIntervalToStringFormat:[[NSDate date] timeIntervalSince1970]dateFormat:@"MM-dd HH:mm"];
    RLMRealm * log_realm = [RLMRealm defaultRealm];
    [log_realm transactionWithBlock:^{
        [log_realm addObject:log_model];
    }];
}
- (void)netWorkSaveFaildLog{
    SKANetWorkLogRealm * log_model = [SKANetWorkLogRealm new];
    log_model.log_class = NSStringFromClass([self.netWork_delegate class]);
    log_model.log_url = self.url;
    log_model.log_param = [self.param DataToJsonString];
    log_model.log_status = @"600";
    log_model.log_info = @"Faild";
    log_model.log_logid = @"Faild";
    log_model.log_score = @"Faild";
    log_model.log_data = @"Faild";
    log_model.log_time = [NSDate SKAIntervalToStringFormat:[[NSDate date] timeIntervalSince1970]dateFormat:@"MM-dd HH:mm"];
    RLMRealm * log_realm = [RLMRealm defaultRealm];
    [log_realm transactionWithBlock:^{
        [log_realm addObject:log_model];
    }];
}
+ (void)netWorkDeleteAllLogs{
    RLMRealm * log_realm = [RLMRealm defaultRealm];
    RLMResults<SKANetWorkLogRealm *> * log_result = [SKANetWorkLogRealm allObjects]; // 从该 Realm 数据库中检索
    [log_realm transactionWithBlock:^{
        [log_realm deleteObjects:log_result];
    }];
}
+ (void)netWorkDeleteLog:(NSString *)log_id{
    RLMRealm * log_realm = [RLMRealm defaultRealm];
    NSString * log_sql = [NSString stringWithFormat:@"log_logid = '%@'",log_id];
    RLMResults<SKANetWorkLogRealm *> * log_result = [SKANetWorkLogRealm objectsInRealm:log_realm where:log_sql]; // 从该 Realm 数据库中检索
    [log_realm transactionWithBlock:^{
        [log_realm deleteObjects:log_result];
    }];
}
//打印日志
//此处Log如果写中文会出现打印不全的Bug
- (void)netWorkSuccessLog{
    NSLog(@"\n==================================\n=          RequestStart          =\n==================================\nClass:%@;\nAPI:%@;\nParam:%@;\n----------------------------------\n-             Result             -\n----------------------------------\nStatus:%@;\nInfo:%@;\nLogid:%@;\nScore:%@;\nData:%@;\n==================================\n=           RequestEnd           =\n==================================\n", [self.netWork_delegate class], self.url, self.param, self.status, self.info, self.logid, self.score, self.data);
}
- (void)netWorkFaildLog{
    NSLog(@"\n==================================\n=          RequestStart          =\n==================================\nClass:%@;\nAPI:%@;\nParam:%@;\n**********************************\n*            APIFaild            *\n**********************************\n=           RequestEnd           =\n==================================\n", [self.netWork_delegate class], self.url, self.param);
}
- (void)netWorkCacheLog{
    NSLog(@"\n==================================\n=           CacheStart           =\n==================================\nClass:%@;\nAPI:%@;\nParam:%@;\n----------------------------------\n-             Result             -\n----------------------------------\nCacheData:%@;\n==================================\n=            CacheEnd            =\n==================================\n", [self.netWork_delegate class], self.url, self.param, self.data);
}
@end
