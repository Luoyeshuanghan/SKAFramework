//
//  SKANetWorkInterface.h
//  辽宁飞豹
//
//  Created by JZZ on 2017/2/24.
//  Copyright © 2017年 哥瑞. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SKANetWorkInterface : NSObject
@property (nonatomic, strong) NSString * url;/**< 请求地址 */
@property (nonatomic, strong) NSDictionary * param;/**< 请求参数 */

@property (nonatomic, strong) NSString * status;/**< 状态 */
@property (nonatomic, strong) NSString * info;/**< 信息 */
@property (nonatomic, strong) id data;/**< 数据 */
@property (nonatomic, strong) NSString * score;/**< 积分 */
@property (nonatomic, strong) NSString * logid;/**< Logid */

@property (nonatomic, strong) NSString * cache_time;/**< 缓存时间 */

@property (nonatomic, assign) id netWork_delegate;/**< 代理 */

+ (void)POST:(id)delegate param:(NSDictionary *)param success:(void (^)(id data))success faild:(void (^)(void))faild;
+ (void)POST:(id)delegate param:(NSDictionary *)param success:(void (^)(id data))success faild:(void (^)(void))faild model:(NSString *)model;

+ (void)POST:(id)delegate param:(NSDictionary *)param cache:(void (^)(id data))cache update:(void (^)(id data))update faild:(void (^)(void))faild;
+ (void)POST:(id)delegate param:(NSDictionary *)param cache:(void (^)(id data))cache update:(void (^)(id data))update faild:(void (^)(void))faild model:(NSString *)model;
@end
