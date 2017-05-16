//
//  SKANetWorkInterface+Log.h
//  啾啾
//
//  Created by JZZ on 2017/2/27.
//  Copyright © 2017年 哥瑞. All rights reserved.
//

#import "SKANetWorkInterface.h"
#import "SKANetWorkLogRealm.h"

@interface SKANetWorkInterface (Log)
//存储日志
+ (NSMutableArray<SKANetWorkLogRealm *> *)GetLogList;
- (void)netWorkSaveSuccessLog;
- (void)netWorkSaveFaildLog;
+ (void)netWorkDeleteAllLogs;
+ (SKANetWorkLogRealm *)GetLogInfoForLogId:(NSString *)log_id;
+ (void)netWorkDeleteLog:(NSString *)log_id;
//打印日志
- (void)netWorkSuccessLog;
- (void)netWorkFaildLog;
- (void)netWorkCacheLog;
@end
