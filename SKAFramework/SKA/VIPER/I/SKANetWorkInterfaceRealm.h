//
//  SKANetWorkInterfaceRealm.h
//  啾啾
//
//  Created by JZZ on 2017/2/24.
//  Copyright © 2017年 哥瑞. All rights reserved.
//

#import <Realm/Realm.h>

@interface SKANetWorkInterfaceRealm : RLMObject
@property (nonatomic, strong) NSString * url;
@property (nonatomic, strong) NSString * param;
@property (nonatomic, strong) NSString * result_param;
@property (nonatomic, assign) NSInteger overdue_time;
@property (nonatomic, strong) NSString * logid;/**< Logid */
@end
