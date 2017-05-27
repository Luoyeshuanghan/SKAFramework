//
//  LoginM.h
//  SKAFramework
//
//  Created by JYC on 2017/5/26.
//  Copyright © 2017年 姜雨辰. All rights reserved.
//

#import "SKABaseModel.h"

@interface LoginM : SKABaseModel
@property (nonatomic, strong) NSString * AccessKeyId;/**< AccessKeyId */
@property (nonatomic, strong) NSString * ChinaExpiration;/**< ChinaExpiration */
@end
