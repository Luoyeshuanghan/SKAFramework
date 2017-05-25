//
//  SKASts.h
//  啾啾健康版
//
//  Created by JZZ on 2017/3/1.
//  Copyright © 2017年 哥瑞. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AliyunOSSiOS/OSSService.h>

@interface SKASts : NSObject
AS_SINGLETON(SKASts)
@property (nonatomic, strong) NSString * AccessKeyId;
@property (nonatomic, strong) NSString * AccessKeySecret;
@property (nonatomic, strong) NSString * Expiration;
@property (nonatomic, strong) NSString * SecurityToken;
@property (nonatomic, strong) NSString * ChinaExpiration;
@property (nonatomic, strong) OSSFederationToken * federation_token;
- (BOOL)isExpired;
- (void)netGetSts;
@end

@interface SKAStsModel : SKABaseModel
@property (nonatomic, strong) NSString * AccessKeyId;
@property (nonatomic, strong) NSString * AccessKeySecret;
@property (nonatomic, strong) NSString * Expiration;
@property (nonatomic, strong) NSString * SecurityToken;
@property (nonatomic, strong) NSString * ChinaExpiration;
@end
