//
//  SKANetWorkLogRealm.h
//  啾啾
//
//  Created by JZZ on 2017/2/27.
//  Copyright © 2017年 哥瑞. All rights reserved.
//

#import <Realm/Realm.h>

@interface SKANetWorkLogRealm : RLMObject
//[self.netWork_delegate class], self.url, self.param, self.status, self.info, self.logid, self.score, self.data);
@property (nonatomic, strong) NSString * log_class;/**< 类名 */
@property (nonatomic, strong) NSString * log_url;/**< API */
@property (nonatomic, strong) NSString * log_param;/**< 参数 */
@property (nonatomic, strong) NSString * log_status;/**< 状态 */
@property (nonatomic, strong) NSString * log_info;/**< 信息 */
@property (nonatomic, strong) NSString * log_logid;/**< logid */
@property (nonatomic, strong) NSString * log_score;/**< 积分 */
@property (nonatomic, strong) NSString * log_data;/**< 数据 */
@property (nonatomic, strong) NSString * log_time;/**< 请求时间 */

@end
