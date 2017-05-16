//
//  SKANetWorkInterfaceRealm.m
//  啾啾
//
//  Created by JZZ on 2017/2/24.
//  Copyright © 2017年 哥瑞. All rights reserved.
//

#import "SKANetWorkInterfaceRealm.h"

@implementation SKANetWorkInterfaceRealm
- (void)setOverdue_time:(NSInteger)overdue_time{
    //过期时间为当前时间+时间*60
    _overdue_time = [[NSDate date] timeIntervalSince1970] + overdue_time * 60;
}
@end
