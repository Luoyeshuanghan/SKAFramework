//
//  SKANetWorkInterface.m
//  辽宁飞豹
//
//  Created by JZZ on 2017/2/24.
//  Copyright © 2017年 哥瑞. All rights reserved.
//

#import "SKANetWorkInterface.h"
#import "SKANetWorkInterface+Cache.h"

@implementation SKANetWorkInterface
+ (void)POST:(id)delegate param:(NSDictionary *)param success:(void (^)(id data))success faild:(void (^)(void))faild{
    [self POST:delegate param:param success:success faild:faild model:nil];
}
+ (void)POST:(id)delegate param:(NSDictionary *)param success:(void (^)(id data))success faild:(void (^)(void))faild model:(NSString *)model{
    SKANetWorkInterface * net_work = [self new];//self.new需要为不同子类生成对象
    net_work.netWork_delegate = delegate;
    net_work.param = param;
    
    //如果有缓存 则读取缓存 没有则读取网络接口
    net_work.data = [net_work GetCache];
    if ([net_work.cache_time intValue] > 0 && net_work.data){
        if (![net_work.data isKindOfClass:[NSString class]] && ![net_work.data isKindOfClass:[NSArray class]] && ![net_work.data isKindOfClass:[NSDictionary class]]){
        } else {
            [net_work netWorkCacheLog];
            if (success != nil){
                success([net_work GetResultData:model]);
            }
        }
    } else {
        [net_work netWork:^(id data) {
            [net_work parseStatus:data success:success faild:faild model:model];
        } faild:faild];
    }
}

+ (void)POST:(id)delegate param:(NSDictionary *)param cache:(void (^)(id data))cache update:(void (^)(id data))update faild:(void (^)(void))faild{
    [self POST:delegate param:param cache:cache update:update faild:faild model:nil];
}
+ (void)POST:(id)delegate param:(NSDictionary *)param cache:(void (^)(id data))cache update:(void (^)(id data))update faild:(void (^)(void))faild model:(NSString *)model{
    SKANetWorkInterface * net_work = [self new];//self.new需要为不同子类生成对象
    net_work.netWork_delegate = delegate;
    net_work.param = param;
    net_work.cache_time = @"999999";//此方法的缓存是永不过期的
    
    //如果有缓存 则读取缓存 没有则读取网络接口
    net_work.data = [net_work GetCache];
    if ([net_work.cache_time intValue] > 0 && net_work.data){
        [net_work netWorkCacheLog];
        if (cache != nil){
            cache([net_work GetResultData:model]);
        }
    }
    [net_work netWork:^(id data) {
        [net_work parseStatus:data success:update faild:faild];
        [net_work setCache];
    } faild:faild];

}

#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
- (void)parseStatus:(NSDictionary *)data success:(void (^)(id data))success faild:(void (^)(void))faild{
    [self parseStatus:data success:success faild:faild model:nil];
}
- (void)parseStatus:(NSDictionary *)data success:(void (^)(id data))success faild:(void (^)(void))faild model:(NSString *)model{
    self.status = data[@"status"];
    self.info = data[@"info"];
    self.data = data[@"data"];
    self.score = data[@"score"];
    self.logid = data[@"log_id"];
    
    [self netWorkSuccessLog];
    [self netWorkSaveSuccessLog];
    
    if ([self.status isEqualToString:@"200"]){
        if ([self.cache_time integerValue] > 0){
            [self setCache];
        }
        if (![data isKindOfClass:[NSString class]] && ![data isKindOfClass:[NSArray class]] && ![data isKindOfClass:[NSDictionary class]]){
        } else {
            if (success != nil){
                success([self GetResultData:model]);
            }
        }
    } else if ([self.status isEqualToString:@"201"]){
        if ([self.netWork_delegate respondsToSelector:NSSelectorFromString(@"netWork_s201:")]){
            [self.netWork_delegate performSelector:NSSelectorFromString(@"netWork_s201:") withObject:self.info];
        } else {
            
        }
    } else if ([self.status isEqualToString:@"202"]){
        if ([self.netWork_delegate respondsToSelector:NSSelectorFromString(@"netWork_s202:")]){
            [self.netWork_delegate performSelector:NSSelectorFromString(@"netWork_s202:") withObject:self.info];
        } else {
            
        }
    }  else if ([self.status isEqualToString:@"500"]){
        if (faild != nil){
            faild();
        }
        
        if ([self.netWork_delegate respondsToSelector:NSSelectorFromString(@"netWork_s500:")]){
            [self.netWork_delegate performSelector:NSSelectorFromString(@"netWork_s500:") withObject:self.info];
        }
    }
}

- (void)netWork:(void (^)(id data))success faild:(void (^)(void))faild{
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];//使用这个将得到的是JSON
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/json", @"text/plain", @"text/html", nil];
    ((AFJSONResponseSerializer *)manager.responseSerializer).removesKeysWithNullValues = YES;
    [manager POST:[self getEntityUrl] parameters:self.param progress:^(NSProgress * _Nonnull uploadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success != nil){
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if(faild != nil){
            [self netWorkFaildLog];
            [self netWorkSaveFaildLog];
            faild();
        }
    }];
}

- (NSString *)getEntityUrl{
    NSString * url_a = [NSString stringWithFormat:@"%@%@", NETWORK_BASEURL, self.url];;
//    if ([SKAUser sharedInstance].is_test == nil || [[SKAUser sharedInstance].is_test isEqualToString:@""]){
//        url_a = [NSString stringWithFormat:@"%@%@", NETWORK_BASEURL, self.url];
//    } else {
//        url_a = [NSString stringWithFormat:@"%@%@", NETWORK_BASEURL_T, self.url];
//    }
    return url_a;
}

- (NSDictionary *)param{
    if (_param == nil){
        _param = @{};
    }
    return _param;
}

- (id)GetResultData:(NSString *)model{
    id result_data = nil;
    if (model == nil){
        result_data = self.data;
    } else {
//        SKABaseModel * obj = [NSClassFromString(model) new];
//        [obj setValuesForKeysWithDictionary:self.data];
//        [obj parseModel:self.data];
//        result_data = obj;
    }
    return result_data;
}
@end
