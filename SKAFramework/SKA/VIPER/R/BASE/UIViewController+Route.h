//
//  UIViewController+Route.h
//  SKAFramework
//
//  Created by JYC on 2017/5/15.
//  Copyright © 2017年 姜雨辰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Route)
@property (nonatomic, assign) BOOL SKAPushInNaviState;//进入后Navi状态
@property (nonatomic, assign) BOOL SKAPushInTabbarState;//进入后Navi状态

- (void)SKA_push:(NSString *)viewController param:(NSDictionary *)param;
- (void)SKA_push:(NSString *)viewController param:(NSDictionary *)param hideNavi:(BOOL)hideNavi;
- (void)SKA_push:(NSString *)viewController param:(NSDictionary *)param hideTabbar:(BOOL)hideTabbar;
- (void)SKA_push:(NSString *)viewController param:(NSDictionary *)param hideNavi:(BOOL)hideNavi hideTabbar:(BOOL)hideTabbar;
- (void)SKA_pop:(NSString *)viewController param:(NSDictionary *)param;
- (void)SKA_back;
@end
