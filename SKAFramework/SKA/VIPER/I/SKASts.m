//
//  SKASts.m
//  啾啾健康版
//
//  Created by JZZ on 2017/3/1.
//  Copyright © 2017年 哥瑞. All rights reserved.
//

#import "SKASts.h"

@implementation SKASts
DEF_SINGLETON(SKASts)
- (instancetype)init{
    self = [super init];
    if (self) {
        [self get_sts];
    }
    return self;
}
- (void)get_sts{
    self.AccessKeyId = [[NSUserDefaults standardUserDefaults] objectForKey:@"AccessKeyId"];
    self.AccessKeySecret = [[NSUserDefaults standardUserDefaults] objectForKey:@"AccessKeySecret"];
    self.Expiration = [[NSUserDefaults standardUserDefaults] objectForKey:@"Expiration"];
    self.SecurityToken = [[NSUserDefaults standardUserDefaults] objectForKey:@"SecurityToken"];
    self.ChinaExpiration = [[NSUserDefaults standardUserDefaults] objectForKey:@"ChinaExpiration"];
    self.federation_token.tAccessKey = self.AccessKeyId;
    self.federation_token.tSecretKey = self.AccessKeySecret;
    self.federation_token.tToken = self.SecurityToken;
}
- (BOOL)isExpired{
    if (self.federation_token == nil)return NO;
    NSTimeInterval now_time_interval = [NSDate SKAGetNowInterval];
    return [self.ChinaExpiration doubleValue] > now_time_interval;
}

- (OSSFederationToken *)federation_token{
    if (_federation_token == nil){
        _federation_token = [OSSFederationToken new];
    }
    return _federation_token;
}

- (void)netGetSts{
    if (![[SKASts sharedInstance] isExpired]){
//        [[SKAStsInterface new] POST:nil param:nil success:nil fail:nil model:@"SKAStsModel"];
    }
}
@end

@implementation SKAStsModel
- (void)parseModel:(NSDictionary *)data{
    [self save_sts];
}
- (void)save_sts{
    [[NSUserDefaults standardUserDefaults] setObject:self.AccessKeyId forKey:@"AccessKeyId"];
    [[NSUserDefaults standardUserDefaults] setObject:self.AccessKeySecret forKey:@"AccessKeySecret"];
    [[NSUserDefaults standardUserDefaults] setObject:self.Expiration forKey:@"Expiration"];
    [[NSUserDefaults standardUserDefaults] setObject:self.SecurityToken forKey:@"SecurityToken"];
    [[NSUserDefaults standardUserDefaults] setObject:self.ChinaExpiration forKey:@"ChinaExpiration"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    [[SKASts sharedInstance] get_sts];
}
@end
